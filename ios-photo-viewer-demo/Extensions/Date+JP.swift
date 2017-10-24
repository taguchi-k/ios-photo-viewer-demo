//
//  Date+JP.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/24.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Foundation

extension Date {

    func now() -> Date {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        return formatter.date(from: formatter.string(from:self))!
    }
}
