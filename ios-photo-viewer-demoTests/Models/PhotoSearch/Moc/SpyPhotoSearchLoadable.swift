//
//  SpyPhotoSearchLoadable.swift
//  ios-photo-viewer-demoTests
//
//  Created by Kentaro on 2017/10/23.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import XCTest
@testable import ios_photo_viewer_demo

final class SpyPhotoSearchLoadable: PhotoSearchLoadable {

    var status: PhotoSearchStatus?
    var asyncExpectation: XCTestExpectation?

    func setStatus(status: PhotoSearchStatus) {

        guard let expectation = asyncExpectation else {
            XCTFail("Delegateが正しく設定されていない")
            return
        }

        self.status = status
        expectation.fulfill()
    }
}
