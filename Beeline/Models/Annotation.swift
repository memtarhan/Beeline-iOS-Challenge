//
//  Annotation.swift
//  Beeline
//
//  Created by Mehmet Tarhan on 28.09.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import MapKit
import UIKit

class Annotation: NSObject, MKAnnotation {
    @objc dynamic var coordinate: CLLocationCoordinate2D
    var title: String?

    init(coordinate: CLLocationCoordinate2D, title: String?) {
        self.coordinate = coordinate
        self.title = title
    }
}
