//
//  MocPhotoList.swift
//  ios-photo-viewer-demoTests
//
//  Created by Kentaro on 2017/10/23.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Foundation
import ObjectMapper
@testable import ios_photo_viewer_demo

final class MocPhotoList {

    func feachTestData() -> PhotoSearchResult{

        let bundle = Bundle(for: type(of: self))

        guard
            let path = bundle.path(forResource: "flickr", ofType: "json"),
            let fileHandle = FileHandle(forReadingAtPath: path),
            let json = String(data: fileHandle.readDataToEndOfFile(), encoding: String.Encoding.utf8),
            let searchResult = Mapper<PhotoSearchResult>().map(JSONString: json) else {
                fatalError("テストデータが読み込めない")
        }
        return searchResult
    }
}
