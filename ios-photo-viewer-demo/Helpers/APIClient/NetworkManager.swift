//
//  NetworkManager.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Alamofire

final class NetworkManager {

    static func isAvailable() -> Bool{

        let net = NetworkReachabilityManager()
        net?.startListening()

        if net?.isReachable ?? false {
            return true

        } else {
            return false
        }
    }
}
