//
//  Photo.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Foundation
import ObjectMapper

/// 写真のモデル
struct Photo: Mappable {

    var id = ""
    var farm = 0
    var server = ""
    var secret = ""

    init?(map: Map){}

    mutating func mapping(map: Map) {
        farm    <- map["farm"]
        server  <- map["server"]
        id      <- map["id"]
        secret  <- map["secret"]
    }

    /// UIImageをDate?に変換する
    ///
    /// - Parameter image: UIImage
    /// - Returns: Date?
    func imageData(image: UIImage) -> Data? {
        return UIImagePNGRepresentation(image)
    }
}
