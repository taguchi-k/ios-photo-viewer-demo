//
//  PhotosTests.swift
//  ios-photo-viewer-demoTests
//
//  Created by Kentaro on 2017/10/23.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import ios_photo_viewer_demo

class PhotosTests: XCTestCase {

    var photosResult: PhotoSearchResult?

    override func setUp() {
        super.setUp()
        photosResult = MocPhotoList().feachTestData()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testPhotos() {

        let photos = self.photosResult?.photos

        XCTAssertEqual(photos?.page, 1)
        XCTAssertEqual(photos?.pages, 4168)
        XCTAssertEqual(photos?.perpage, 100)
        XCTAssertEqual(photos?.photo.count, 100)
        XCTAssertNotNil(photos?.photo.first)
        XCTAssertNotNil(photos?.photo.last)
    }
}
