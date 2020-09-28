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

    func display(_ state: HomeEntity.Activity.State)
    func display(_ annotation: HomeEntity.Activity.Annotation)
}

class HomeViewControllerImpl: UIViewController {
    var presenter: HomePresenter?

    @IBOutlet var mapView: MKMapView!
    @IBOutlet var activityButton: UIButton!

    private let locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.activityType = .fitness
        manager.distanceFilter = CLLocationDistance(10)

        return manager
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    @IBAction func didTapStart(_ sender: Any) {
        presenter?.presentNewActivity()
    }

    private func setup() {
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
    }
}

// MARK: - HomeViewController

extension HomeViewControllerImpl: HomeViewController {
    func display(_ state: HomeEntity.Activity.State) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveEaseInOut]) {
                if state.shouldUpdateLocation {
                    self.locationManager.startUpdatingLocation()
                }
                self.activityButton.setTitle(state.title, for: [])
                self.activityButton.backgroundColor = state.color
            } completion: { _ in
            }
        }
    }

    func display(_ annotation: HomeEntity.Activity.Annotation) {
        DispatchQueue.main.async {
            let point = Annotation(coordinate: CLLocationCoordinate2D(latitude: 33.0, longitude: -97.0), title: annotation.title)
            self.mapView.addAnnotation(point)
        }
    }
}

// MARK: - CLLocationManagerDelegate

extension HomeViewControllerImpl: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        presenter?.presentLocationUpdated(location)
    }
}
