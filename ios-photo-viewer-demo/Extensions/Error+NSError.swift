//
//  Error+NSError.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Foundation

extension Error {

    var code: Int {
        return (self as NSError).code
    }

    var domain: String {
        return (self as NSError).domain
    }
}