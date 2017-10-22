//
//  APIClient.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Alamofire

enum Result<T> {
    case success(T)
    case failure(Error)
}

final class APIClient {

    static func request(router : Router,
                 completionHandler: @escaping (Result<Any>) -> () = {_ in}) {
        
        Alamofire.request(router).responseJSON  { response in
            switch response.result {
            case .success(let value):
                completionHandler(.success(value))

            case .failure:

                if let error = response.result.error {
                    completionHandler(.failure(error))
                } else {
                    fatalError("エラーのインスタンスがnil")
                }
            }
        }
    }
}
