//
//  SearchPhotoStatus.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/25.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Foundation

/// 写真検索APIステータス
enum SearchPhotoStatus {
    case none
    case loading
    case noData
    case loaded(SearchPhotoResult)
    case offline
    case error(Error)
}
