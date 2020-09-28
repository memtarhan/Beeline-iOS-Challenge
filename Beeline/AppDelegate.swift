//
//  AppDelegate.swift
//  Beeline
//
//  Created by Mehmet Tarhan on 2.09.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import Swinject
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var assembler: Assembler?

    var rootViewController: UIViewController? {
        get { return window?.rootViewController }
        set {
            window?.rootViewController = newValue
            window?.makeKeyAndVisible()
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        initWindow()
        initDI()
        initTabBar()
        initNavigationBar()
        initUI()

        return true
    }

    /// - Initializing window
    private func initWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
    }

    /// - Initializing dependency injection
    private func initDI() {
        assembler = Assembler([
            ActivitiesAssembly(),
            HomeAssembly(),
        ])
        assembler?.apply(assembly: ViewControllerAssembly(assembler: assembler!))
    }

    /// - Initializing UI w/ initial view controller
    func initUI() {
        let tabBarController = UITabBarController()
        if let home = assembler?.resolver.resolve(HomeViewController.self) as? UIViewController,
            let activities = assembler?.resolver.resolve(ActivitiesViewController.self) as? UIViewController {
            tabBarController.tabBar.layer.borderWidth = 0.5
            tabBarController.tabBar.layer.borderColor = UIColor.clear.cgColor
            tabBarController.tabBar.clipsToBounds = true

            /// - Home
            home.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "Home"), tag: 0)
            let homeNavigationController = UINavigationController(rootViewController: home)

            /// - Trending
            activities.tabBarItem = UITabBarItem(title: "Actities", image: UIImage(named: "Actities"), tag: 1)
            let trendingNavigationController = UINavigationController(rootViewController: activities)

            tabBarController.setViewControllers([homeNavigationController, trendingNavigationController], animated: true)

            rootViewController = tabBarController
        }
    }

    /// - Initializing UINavigationBar
    private func initNavigationBar() {
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().barStyle = .black
    }

    /// - Initializing UITabBar
    private func initTabBar() {
        UITabBar.appearance().tintColor = UIColor(named: "UITabBar-tintColor")
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().barTintColor = .clear
        UITabBar.appearance().backgroundColor = .black
        UITabBar.appearance().layer.backgroundColor = UIColor.clear.cgColor
        
        
    }
}
