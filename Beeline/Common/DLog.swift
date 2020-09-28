//
//  DLog.swift
//  Beeline
//
//  Created by Mehmet Tarhan on 28.09.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import Foundation

import Foundation

var currentDate: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-MM HH:mm:ss.SSSS"
    return dateFormatter.string(from: Date())
}

func dlog(
    _ tag: AnyObject,
    _ items: Any...) {
    #if DEBUG
        var list: [Any] = []
        let logInfo = currentDate + " " + String(describing: tag)
        list.append(logInfo)
        list.append(contentsOf: items)
        print(list, separator: " ", terminator: "\n")
    #endif
}
