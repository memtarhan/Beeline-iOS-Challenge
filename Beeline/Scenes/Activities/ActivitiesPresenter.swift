//
//  ActivitiesPresenter.swift
//  Beeline
//
//  Created Mehmet Tarhan on 22.09.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import UIKit

protocol ActivitiesPresenter: class {
    var view: ActivitiesViewController? { get set }
    var interactor: ActivitiesInteractor? { get set }
    var router: ActivitiesRouter? { get set }
}

class ActivitiesPresenterImpl: ActivitiesPresenter {
    var view: ActivitiesViewController?
    var interactor: ActivitiesInteractor?
    var router: ActivitiesRouter?
}
