//
//  Photos.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Foundation
import ObjectMapper

struct Photos: Mappable {

    var page = 0
    var pages = 0
    var perpage = 0
    var photo: [Photo] = []

    init?(map: Map){}

    mutating func mapping(map: Map) {
        page    <- map["page"]
        pages   <- map["pages"]
        perpage <- map["perpage"]
        photo   <- map["photo"]
    }
}
