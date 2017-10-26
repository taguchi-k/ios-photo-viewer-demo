//
//  SearchPhotoStatusError.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/25.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

final class SearchPhotoStatusError: NSObject, SearchPhotoStatusType {

    var error: Error

    init(error: Error) {
        self.error = error
        super.init()
    }

    func message() -> String {
        return error.localizedDescription
    }
}
