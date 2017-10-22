//
//  Photo.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Foundation
import ObjectMapper

struct Photo: Mappable {
    var farm = 0
    var server = ""
    var id = ""
    var secret = ""

    init?(map: Map){}

    mutating func mapping(map: Map) {
        farm    <- map["farm"]
        server  <- map["server"]
        id      <- map["id"]
        secret  <- map["secret"]
    }
}
