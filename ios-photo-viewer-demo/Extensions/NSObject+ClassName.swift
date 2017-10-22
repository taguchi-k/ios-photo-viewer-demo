//
//  NSObject+ClassName.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Foundation

extension NSObject {

    /// クラス名を取得する
    static var className: String {
        get {
            return String(describing: self)
        }
    }
}
