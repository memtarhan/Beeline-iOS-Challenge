//
//  HomeInteractor.swift
//  Beeline
//
//  Created Mehmet Tarhan on 19.09.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import UIKit

protocol HomeInteractor: class {
    var currentActivity: ActivityModel? { get set }

    func save()
}

class HomeInteractorImpl: HomeInteractor {
    private let service: HomeService

    init(service: HomeService) {
        self.service = service
    }

    var currentActivity: ActivityModel?

    func save() {
        dlog(self, #function)
    }
}
