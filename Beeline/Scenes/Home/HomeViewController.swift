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
    @IBOutlet var blurView: CardBlurView!

    @IBOutlet var blurViewBottomConstraint: NSLayoutConstraint!

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
        blurView.layer.cornerRadius = blurView.frame.height / 12
        blurViewBottomConstraint.constant = 96 - blurView.frame.height
    }

    private func setup() {
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
