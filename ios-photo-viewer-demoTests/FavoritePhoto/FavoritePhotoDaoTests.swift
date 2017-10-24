//
//  FavoritePhotoDaoTests.swift
//  ios-photo-viewer-demoTests
//
//  Created by Kentaro on 2017/10/24.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import ios_photo_viewer_demo

class FavoritePhotoDaoTests: XCTestCase {

    override func setUp() {
        super.setUp()
        FavoritePhotoDao.deleteAll()
    }

    override func tearDown() {
        FavoritePhotoDao.deleteAll()
        super.tearDown()
    }

    /// 登録できるか
    func testAddFavoritePhoto() {

        let model = dummyModel()
        _ = FavoritePhotoDao.add(photoId: model.photoId,
                                 imageData: model.imageData)
        let data = NSKeyedArchiver.archivedData(withRootObject: ["test": "hoge"])

        verifyFavoritePhoto(id: 1, photoId: "photoId", imageData: data)
    }

    /// 指定したお気に入り写真が削除できるか
    func testDeleteFavoritePhoto() {

        let model = dummyModel()
        _ = FavoritePhotoDao.add(photoId: model.photoId,
                                 imageData: model.imageData)
        FavoritePhotoDao.delete(id: 1)

        verifyCount(count: 0)
    }

    /// 線削除できるか
    func testDeleteAllFavoritePhoto() {
        addDummyModels()
        FavoritePhotoDao.deleteAll()
        verifyCount(count: 0)
    }

    /// 全取得できるか
    func testFindAllFavoritePhoto() {
        addDummyModels()
        verifyCount(count: 3)
    }

    /// 登録日時の降順でお気に入り写真が取得できるか
    func testFindAllFavoritePhotoForOrder() {

        _ = FavoritePhotoDao.add(photoId: "photoId1", imageData: Data())
        sleep(1)
        _ = FavoritePhotoDao.add(photoId: "photoId2", imageData: Data())
        sleep(1)
        _ = FavoritePhotoDao.add(photoId: "photoId3", imageData: Data())

        let results = FavoritePhotoDao.findAll()

        XCTAssertEqual("photoId3", results[0].photoId)
        XCTAssertEqual("photoId2", results[1].photoId)
        XCTAssertEqual("photoId1", results[2].photoId)
    }

    /// 指定したIDのお気に入り写真が取得できるか
    func testFindFavoritePhotoById() {
        addDummyModels()
        let result = FavoritePhotoDao.find(id: 2)
        XCTAssertEqual("photoId2", result?.photoId)
    }

    /// 指定したphotoIdのお気に入り写真が取得できるか
    func testFindFavoritePhotoByPhotoId() {
        addDummyModels()
        let result = FavoritePhotoDao.find(photoId: "photoId2")
        XCTAssertEqual("photoId2", result?.photoId)
    }
}

// MARK: - Helper
private extension FavoritePhotoDaoTests {

    func verifyFavoritePhoto(id: Int, photoId: String, imageData: Data) {

        let results = FavoritePhotoDao.findAll()

        if let result = results.first {
            XCTAssertEqual(result.id, id)
            XCTAssertEqual(result.photoId, photoId)
            XCTAssertEqual(result.imageData, imageData)
        }
    }

    func verifyCount(count: Int) {
        let result = FavoritePhotoDao.findAll()
        XCTAssertEqual(result.count, count)
    }

    func dummyModel() -> FavoritePhoto {
        let model = FavoritePhoto()
        model.photoId = "photoId"
        model.imageData = NSKeyedArchiver.archivedData(withRootObject: ["test": "hoge"])

        return model
    }

    func addDummyModels() {
        _ = FavoritePhotoDao.add(photoId: "photoId1", imageData: Data())
        _ = FavoritePhotoDao.add(photoId: "photoId2", imageData: Data())
        _ = FavoritePhotoDao.add(photoId: "photoId3", imageData: Data())
    }
}
