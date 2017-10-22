//
//  PhotoSearchParamsBuilder.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/23.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Foundation

struct PhotoSearchParamsBuilder {

    static let perPage = 50

    static func create(tags: String, page: Int) -> [String: Any]{

        var params = FlickrBaseParamsBuilder.create()
        params["page"] = "\(page)"
        params["per_page"] = "\(perPage)"
        params["tags"] = tags
        return params
    }
}
