//
//  HomePresenter.swift
//  Beeline
//
//  Created Mehmet Tarhan on 19.09.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import UIKit

protocol HomePresenter: class {
    var view: HomeViewController? { get set }
    var interactor: HomeInteractor? { get set }
    var router: HomeRouter? { get set }

    func present()
    func presentNewActivity()
}

class HomePresenterImpl: HomePresenter {
    var view: HomeViewController?
    var interactor: HomeInteractor?
    var router: HomeRouter?

    private var hasStartedActivity = false

    func present() {
    }

    func presentNewActivity() {
        hasStartedActivity = !hasStartedActivity
        let color: UIColor = hasStartedActivity ? .systemRed : .systemGreen
        let title: String = hasStartedActivity ? "Start your activity" : "Stop your activity"

        let state = HomeEntity.Activity.State(color: color, title: title)
        view?.display(state)
    }
}
