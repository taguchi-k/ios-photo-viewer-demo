//
//  FavoritePhotoTests.swift
//  ios-photo-viewer-demoTests
//
//  Created by Kentaro on 2017/10/24.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import ios_photo_viewer_demo

class FavoritePhotoTests: XCTestCase {

    let favoritePhoto = FavoritePhoto()

    override func setUp() {
        super.setUp()
        FavoritePhotoDao.deleteAll()
    }

    override func tearDown() {
        FavoritePhotoDao.deleteAll()
        super.tearDown()
    }

    /// デフォルト値の確認
    func testFavoritePhotoDefault() {
        XCTAssertEqual(favoritePhoto.id, 0)
        XCTAssertEqual(favoritePhoto.photoId, "")
        XCTAssertNotNil(favoritePhoto.imageData)
        XCTAssertNotNil(favoritePhoto.date)
    }

    /// 各プロパティに値がセットできるか
    func testSetFavoritePhoto() {

        let dic = ["test": "hoge"]
        let data = NSKeyedArchiver.archivedData(withRootObject: dic)

        favoritePhoto.id = 1
        favoritePhoto.photoId = "photoId"
        favoritePhoto.imageData = data
        favoritePhoto.date = string2Date("2017/01/01")

        verifyFavoritePhoto(id: 1, photoId: "photoId", imageData: data, date: "2017/01/01")
    }
}

// MARK: - Helper
private extension FavoritePhotoTests {

    func verifyFavoritePhoto(id: Int, photoId: String, imageData: Data, date: String) {
        XCTAssertEqual(favoritePhoto.id, id)
        XCTAssertEqual(favoritePhoto.photoId, photoId)
        XCTAssertEqual(favoritePhoto.imageData, imageData)
        XCTAssertEqual(favoritePhoto.date, string2Date(date))
    }

    func string2Date(_ dateString: String) -> Date {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter.date(from: dateString)!
    }
}
