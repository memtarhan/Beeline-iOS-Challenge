//
//  HomeRouter.swift
//  Beeline
//
//  Created Mehmet Tarhan on 19.09.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import UIKit

protocol HomeRouter: class {
    var view: HomeViewController? { get set }
}

class HomeRouterImpl: HomeRouter {
    var view: HomeViewController?
    
    private let factory: ViewControllerFactory

    init(factory: ViewControllerFactory) {
        self.factory = factory
    }
}
