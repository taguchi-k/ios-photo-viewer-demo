//
//  FavoritePhotoDao.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/24.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Foundation
import RealmSwift

/// お気に入り写真DAO
final class FavoritePhotoDao {

    static let dao = RealmDaoHelper<FavoritePhoto>()

    /// お気に入り写真を追加する
    ///
    /// - Parameter photoId: PhotoのID
    /// - Returns: FavoritePhotoオブジェクト
    @discardableResult
    static func add(photoId: String, imageData: Data) -> FavoritePhoto {

        guard let id = dao.newId() else {
            fatalError("主キー発行失敗")
        }

        let object = FavoritePhoto()
        object.id = id
        object.photoId = photoId
        object.imageData = imageData
        object.date = Date().now()

        dao.add(d: object)

        return object
    }

    /// 該当するIDのお気に入り写真を削除する
    ///
    /// - Parameter id: お気に入りID
    static func delete(id: Int) {
        guard let object = dao.findFirst(key: id as AnyObject) else { return }
        dao.delete(d: object)
    }

    /// 指定したphotoIdのお気に入り写真を削除する
    ///
    /// - Parameter photoId:
    static func delete(photoId: String) {
        guard let object = find(photoId: photoId) else { return }
        dao.delete(d: object)
    }

    /// お気に入り写真を全て削除する
    static func deleteAll() {
        dao.deleteAll()
    }

    /// 指定したIDのお気に入り写真を取得する
    ///
    /// - Parameter id: お気に入りID
    /// - Returns: FavoritePhoto?
    static func find(id: Int) -> FavoritePhoto? {
        return dao.findFirst(key: id as AnyObject)
    }

    /// 指定したphotoIdのお気に入り写真を取得する
    ///
    /// - Parameter photoId:
    /// - Returns: FavoritePhoto?
    static func find(photoId: String) -> FavoritePhoto? {
        return dao.findAll().filter("photoId == %@", photoId).first
    }

    /// 全てのお気に入り写真を取得する
    ///
    /// - Returns: お気に入り写真モデルの配列
    static func findAll() -> [FavoritePhoto] {
        let objects = dao
            .findAll()
            .sorted(byKeyPath: Constants.dateKey, ascending: false)
        return objects.map {FavoritePhoto(value: $0)}
    }
}
