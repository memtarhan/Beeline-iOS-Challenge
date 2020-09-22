//
//  ActivitiesRouter.swift
//  Beeline
//
//  Created Mehmet Tarhan on 22.09.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import UIKit

protocol ActivitiesRouter: class {
    var view: ActivitiesViewController? { get set }
}

class ActivitiesRouterImpl: ActivitiesRouter {
    var view: ActivitiesViewController?
    
    private let factory: ViewControllerFactory

    init(factory: ViewControllerFactory) {
        self.factory = factory
    }
}
