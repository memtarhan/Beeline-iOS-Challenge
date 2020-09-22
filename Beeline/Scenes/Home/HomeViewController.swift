//
//  HomeViewController.swift
//  Beeline
//
//  Created Mehmet Tarhan on 19.09.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import CoreLocation
import MapKit
import UIKit

protocol HomeViewController: class {
    var presenter: HomePresenter? { get set }
}

class HomeViewControllerImpl: UIViewController {
    var presenter: HomePresenter?

    @IBOutlet var mapView: MKMapView!

    private let locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        // manager.allowsBackgroundLocationUpdates = true

        return manager
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        localize()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    private func setup() {
        let blurEffect = UIBlurEffect(style: .prominent) // here you can change blur style
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = tabBarController?.tabBar.bounds ?? CGRect(x: 0, y: view.frame.height - 64, width: view.frame.width, height: 64)
        blurView.autoresizingMask = .flexibleWidth
        tabBarController?.tabBar.insertSubview(blurView, at: 0)
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
    }

    private func localize() {
    }
}

// MARK: - HomeViewController

extension HomeViewControllerImpl: HomeViewController {
}

// MARK: - CLLocationManagerDelegate

extension HomeViewControllerImpl: CLLocationManagerDelegate {
}
