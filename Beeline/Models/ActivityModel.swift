//
//  ActivityModel.swift
//  Beeline
//
//  Created by Mehmet Tarhan on 28.09.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import Foundation

class ActivityModel {
    var startTime: Date?
    var finishTime: Date?
    var trackingData: [Tracking]?

    init() {
        trackingData = []
    }
}

struct Tracking {
    let timestamp: TimeInterval
    let latitude: Double
    let longitude: Double
    let altitude: Double
}
