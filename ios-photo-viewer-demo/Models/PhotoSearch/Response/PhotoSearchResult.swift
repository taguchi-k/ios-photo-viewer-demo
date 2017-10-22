//
//  PhotoSearchResult.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Foundation
import ObjectMapper

struct PhotoSearchResult: Mappable {

    var stat = ""
    var photos: Photos?

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        stat <- map["stat"]
        photos <- map["photos"]
    }
}
