//
//  PhotoSearchParamsBuilderTests.swift
//  ios-photo-viewer-demoTests
//
//  Created by Kentaro on 2017/10/23.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import ios_photo_viewer_demo

class PhotoSearchParamsBuilderTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testPhotoSearchParamsBuilder() {

        let params = PhotoSearchParamsBuilder.create(tags: "あいうえお",
                                                     page: 1) as! [String: String]

        XCTAssertEqual(params["tags"], "あいうえお")
        XCTAssertEqual(params["method"], "flickr.photos.search")
        XCTAssertEqual(params["page"], "1")
        XCTAssertEqual(params["per_page"], "50")
    }
}
