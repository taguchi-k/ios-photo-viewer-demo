//
//  SearchPhotoResultTests.swift
//  ios-photo-viewer-demoTests
//
//  Created by Kentaro on 2017/10/23.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import ios_photo_viewer_demo

class SearchPhotoResultTests: XCTestCase {

    var photosResult: SearchPhotoResult?

    override func setUp() {
        super.setUp()
        photosResult = MocPhotoList().feachTestData()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testPhotosResult() {

        let photosResult = self.photosResult

        XCTAssertEqual(photosResult?.stat, "ok")
        XCTAssertNotNil(photosResult?.photos)
    }
}
