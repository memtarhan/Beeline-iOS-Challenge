//
//  HomeEntity.swift
//  Beeline
//
//  Created Mehmet Tarhan on 19.09.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import UIKit
import CoreLocation

struct HomeEntity {
    struct Activity {
        struct State {
            let color: UIColor
            let title: String
            let shouldUpdateLocation: Bool
        }
        
        struct Annotation {
            let location: CLLocationCoordinate2D
            let title: String
        }
    }
}
