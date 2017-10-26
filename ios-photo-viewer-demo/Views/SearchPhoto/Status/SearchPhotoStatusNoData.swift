//
//  SearchPhotoStatusNoData.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/25.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

final class SearchPhotoStatusNoData: NSObject, SearchPhotoStatusType {

    func message() -> String {
        return "MSG_NODATA".localized()
    }
}
