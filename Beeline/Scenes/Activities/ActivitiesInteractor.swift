//
//  ActivitiesInteractor.swift
//  Beeline
//
//  Created Mehmet Tarhan on 22.09.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import UIKit

protocol ActivitiesInteractor: class {
}

class ActivitiesInteractorImpl: ActivitiesInteractor {
    
    private let service: ActivitiesService

    init(service: ActivitiesService) {
        self.service = service
    }
}
