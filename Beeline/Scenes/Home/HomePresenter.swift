//
//  HomePresenter.swift
//  Beeline
//
//  Created Mehmet Tarhan on 19.09.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import CoreLocation
import UIKit

protocol HomePresenter: class {
    var view: HomeViewController? { get set }
    var interactor: HomeInteractor? { get set }
    var router: HomeRouter? { get set }

    func present()
    func presentNewActivity()
    func presentLocationUpdated(_ location: CLLocation)
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
        let title: String = hasStartedActivity ? "Stop your activity" : "Start your activity"

        let state = HomeEntity.Activity.State(color: color, title: title, shouldUpdateLocation: hasStartedActivity)
        view?.display(state)

        if hasStartedActivity {
            interactor?.currentActivity = ActivityModel()
            interactor?.currentActivity?.startTime = Date()

        } else {
            interactor?.currentActivity?.finishTime = Date()
            interactor?.save()
            interactor?.currentActivity = nil
        }
    }

    func presentLocationUpdated(_ location: CLLocation) {
        let tracking = Tracking(timestamp: Date().timeIntervalSince1970, latitude: location.coordinate.latitude, longitude: location.coordinate.longitude, altitude: location.altitude)
        if let interactor = interactor,
            let activity = interactor.currentActivity,
            activity.trackingData!.isEmpty {
            view?.display(HomeEntity.Activity.Annotation(location: location.coordinate, title: "Start"))
        }

        interactor?.currentActivity?.trackingData?.append(tracking)
    }
}
