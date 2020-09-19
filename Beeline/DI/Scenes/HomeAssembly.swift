//
//  HomeAssembly.swift
//  Beeline
//
//  Created Mehmet Tarhan on 19.09.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import Swinject
import UIKit

class HomeAssembly: Assembly {
    func assemble(container: Container) {
        container.register(HomeViewController.self) { r in
            let viewController = HomeViewControllerImpl(nibName: "HomeViewController", bundle: nil)
            let presenter = r.resolve(HomePresenter.self)!
            let interactor = r.resolve(HomeInteractor.self)!
            let router = r.resolve(HomeRouter.self)!

            presenter.view = viewController
            presenter.router = router
            presenter.interactor = interactor
            viewController.presenter = presenter
            router.view = viewController

            return viewController
        }

        container.register(HomePresenter.self) { _ in
            HomePresenterImpl()
        }

        container.register(HomeInteractor.self) { r in
            HomeInteractorImpl(service: r.resolve(HomeService.self)!)
        }

        container.register(HomeRouter.self) { r in
            HomeRouterImpl(factory: r.resolve(ViewControllerFactory.self)!)
        }
        
        container.register(HomeService.self) { r in
            HomeServiceImpl()
        }
    }
}
