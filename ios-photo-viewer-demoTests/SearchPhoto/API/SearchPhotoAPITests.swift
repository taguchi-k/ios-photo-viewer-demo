//
//  SearchPhotoAPITests.swift
//  ios-photo-viewer-demoTests
//
//  Created by Kentaro on 2017/10/23.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import ios_photo_viewer_demo

class SearchPhotoAPITests: XCTestCase {

    let api = SearchPhotoAPI()
    let loadable = SpySearchPhotoLoadable()

    override func setUp() {
        super.setUp()
        api.loadable = loadable
    }

    override func tearDown() {
        api.loadable = nil
        super.tearDown()
    }

    func testSearchPhotoAPI() {
        XCTAssertFalse(SearchPhotoAPI().waiting())
    }

    func testSearchPhotoRequestCount() {

        let count = SearchPhotoAPI()
        XCTAssertEqual(count.current(), 1)

        (0..<2).forEach { _ in
            count.incement()
        }
        XCTAssertEqual(count.current(), 3)

        count.reset()
        XCTAssertEqual(count.current(), 1)

        count.updateTotal(total: 150)
        // 50
        XCTAssertTrue(count.isMoreRequest())

        count.incement()
        // 100
        XCTAssertTrue(count.isMoreRequest())

        count.incement()
        //150
        XCTAssertFalse(count.isMoreRequest())
    }

    func testSearchPhoto() {

        let exp = expectation(description: "「犬」で検索したときのテスト")
        loadable.asyncExpectation = exp

        api.load(tags: "犬")

        waitForExpectations(timeout: 3) { (error) in
            if let error = error {
                XCTFail("waitForExpectationsエラー: \(error)")
            }

            if let status = self.loadable.status {

                switch status {
                case .loaded(let result) :
                    XCTAssertNotNil(result)
                    XCTAssertTrue(result.photos!.photo.count > 0)
                    XCTAssertEqual(result.stat, "ok")

                case .error(let error) :
                    XCTFail(error.localizedDescription)

                default:
                    XCTFail("バグです")
                }
            }
        }
    }

    func testSearchPhotoNoData() {

        let exp = expectation(description: "該当データがないときのテスト")
        loadable.asyncExpectation = exp

        api.load(tags: "ARあああEAL2101")

        waitForExpectations(timeout: 3) { error in
            if let error = error {
                XCTFail("waitForExpectationsエラー: \(error)")
            }

            if let status = self.loadable.status {
                switch status {
                case .noData:
                    XCTAssertTrue(true)

                case .error(let error) :
                    XCTFail(error.localizedDescription)

                default:
                    XCTFail("バグです")
                }
            }
        }
    }
}
