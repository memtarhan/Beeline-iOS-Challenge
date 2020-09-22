//
//  ActivitiesAssembly.swift
//  Beeline
//
//  Created Mehmet Tarhan on 22.09.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import Swinject
import UIKit

class ActivitiesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ActivitiesViewController.self) { r in
            let viewController = ActivitiesViewControllerImpl(nibName: "ActivitiesViewController", bundle: nil)
            let presenter = r.resolve(ActivitiesPresenter.self)!
            let interactor = r.resolve(ActivitiesInteractor.self)!
            let router = r.resolve(ActivitiesRouter.self)!

            presenter.view = viewController
            presenter.router = router
            presenter.interactor = interactor
            viewController.presenter = presenter
            router.view = viewController

            return viewController
        }

        container.register(ActivitiesPresenter.self) { _ in
            ActivitiesPresenterImpl()
        }

        container.register(ActivitiesInteractor.self) { r in
            ActivitiesInteractorImpl(service: r.resolve(ActivitiesService.self)!)
        }

        container.register(ActivitiesRouter.self) { r in
            ActivitiesRouterImpl(factory: r.resolve(ViewControllerFactory.self)!)
        }
        
        container.register(ActivitiesService.self) { r in
            ActivitiesServiceImpl()
        }
    }
}
