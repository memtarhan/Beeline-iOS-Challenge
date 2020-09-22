//
//  ActivitiesViewController.swift
//  Beeline
//
//  Created Mehmet Tarhan on 22.09.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import UIKit

protocol ActivitiesViewController: class {
    var presenter: ActivitiesPresenter? { get set }
}

class ActivitiesViewControllerImpl: UIViewController {
    var presenter: ActivitiesPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        localize()
    }
    
    private func setup() {
    }
    
    private func localize() {
    }
}

// MARK: - ActivitiesViewController

extension ActivitiesViewControllerImpl: ActivitiesViewController {
}

