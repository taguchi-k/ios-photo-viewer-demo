//
//  FlickrBaseParamsBuilder.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Foundation

struct FlickrBaseParamsBuilder {

    static func create() -> [String: Any] {

        return [
            "method" : "flickr.photos.search",
            "api_key" : "10ba93bbe49a6480d765ce486673954a",
            "nojsoncallback" : "1",
            "format": "json"]
    }
}
