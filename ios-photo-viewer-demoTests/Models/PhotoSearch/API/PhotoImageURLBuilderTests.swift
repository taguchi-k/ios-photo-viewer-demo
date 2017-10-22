//
//  PhotoImageURLBuilderTests.swift
//  ios-photo-viewer-demoTests
//
//  Created by Kentaro on 2017/10/23.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import ios_photo_viewer_demo

class PhotoImageURLBuilderTests: XCTestCase {

    var photosResult: PhotoSearchResult?

    override func setUp() {
        super.setUp()
        photosResult = MocPhotoList().feachTestData()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testPhotoImageURLBuilder() {

        let photo = self.photosResult?.photos?.photo.first

        XCTAssertEqual(PhotoImageURLBuilder.create(photo: photo!),
                       "https://farm6.staticflickr.com/5696/32011675501_9c9ef7045f.jpg")
    }
}
