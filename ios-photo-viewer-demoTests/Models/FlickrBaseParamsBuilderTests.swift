//
//  FlickrBaseParamsBuilderTests.swift
//  ios-photo-viewer-demoTests
//
//  Created by Kentaro on 2017/10/23.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import ios_photo_viewer_demo

class FlickrBaseParamsBuilderTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testFlickrBaseParamBuilder() {

        let params = FlickrBaseParamsBuilder.create() as! [String: String]
        XCTAssertEqual(params["method"], "flickr.photos.search")
        XCTAssertEqual(params["nojsoncallback"], "1")
        XCTAssertEqual(params["format"], "json")
    }
}
