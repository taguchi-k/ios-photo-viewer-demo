//
//  FavoritePhoto.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/24.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Foundation
import RealmSwift

/// お気に入り写真のモデル
final class FavoritePhoto: Object {

    /// お気に入り写真ID
    dynamic var id = 0

    /// 写真ID
    dynamic var photoId = ""

    /// 画像データ
    dynamic var imageData = Data()

    /// 登録日時
    dynamic var date = Date()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
