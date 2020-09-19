//
//  CardBlurView.swift
//  Beeline
//
//  Created by Mehmet Tarhan on 19.09.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import UIKit

class CardBlurView: UIVisualEffectView {
    override func layoutSubviews() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: -0.7, height: -1.0)
        layer.shadowOpacity = 0.4
        layer.cornerRadius = frame.height / 10
    }
}
