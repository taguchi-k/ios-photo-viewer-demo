//
//  PhotoTests.swift
//  ios-photo-viewer-demoTests
//
//  Created by Kentaro on 2017/10/23.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import ios_photo_viewer_demo

class PhotoTests: XCTestCase {

    var photosResult: SearchPhotoResult?

    override func setUp() {
        super.setUp()
        photosResult = MocPhotoList().feachTestData()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testPhoto() {

        let photo = self.photosResult?.photos?.photo.first

        XCTAssertEqual(photo?.farm, 6)
        XCTAssertEqual(photo?.server, "5696")
        XCTAssertEqual(photo?.id, "32011675501")
        XCTAssertEqual(photo?.secret, "9c9ef7045f")
    }
}
