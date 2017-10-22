//
//  Router.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Alamofire

enum Router: URLRequestConvertible {

    static let baseURLString = "https://api.flickr.com/services/rest"

    case photosSearch([String: Any])

    func asURLRequest() throws -> URLRequest {

        let (method, path, parameters): (HTTPMethod, String, [String: Any]) = {

            switch self {
            case .photosSearch(let params):
                return (.get, "", params)
            }
        }()

        if let url = URL(string: Router.baseURLString) {
            var urlRequest = URLRequest(url: url.appendingPathComponent(path))
            urlRequest.httpMethod = method.rawValue
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: parameters)
        } else {
            fatalError("URLがnil")
        }
    }
}
