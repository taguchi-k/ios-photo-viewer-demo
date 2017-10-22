//
//  PhotoSearchAPI.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Foundation
import ObjectMapper

/// 写真検索APIステータス
enum PhotoSearchStatus {
    case none
    case loading
    case noData
    case normal(PhotoSearchResult)
    case offline
    case error(Error)
}

/// 写真検索API結果を通知するプロトコル
protocol PhotoSearchLoadable{
    func setStatus(status: PhotoSearchStatus)
}

/// 写真検索APIリクエスト実行クラス
final class PhotoSearchAPI {

    var loadable: PhotoSearchLoadable?
    private var isLoading = false
    private var requestCount = 1
    private var totalCount = 1

    func waiting() -> Bool {
        return isLoading
    }

    func load(tags: String) {

        guard NetworkManager.isAvailable() else {
            loadable?.setStatus(status: .offline)
            return
        }

        isLoading = true
        let parameters = PhotoSearchParamsBuilder.create(tags: tags, page: current())
        let router = Router.photosSearch(parameters)

        APIClient.request(router: router) { [weak self] (response) in

            switch response {
            case .success(let result):

                if let searchResult = Mapper<PhotoSearchResult>().map(JSONObject: result) {
                    let status = self?.hasPhotoList(result: searchResult) ?? .none
                    self?.loadable?.setStatus(status: status)
                }

            case .failure(let error):
                self?.loadable?.setStatus(status: .error(error))
            }
            self?.isLoading = false
        }
    }

    private func hasPhotoList(result: PhotoSearchResult) -> PhotoSearchStatus{

        return (result.photos?.photo.count == 0) ?
            PhotoSearchStatus.noData : PhotoSearchStatus.normal(result)
    }

    // MARK: - リクエスト回数の管理
    func current() -> Int {
        return requestCount
    }

    func reset() {
        requestCount = 1
    }

    func incement() {
        requestCount += 1
    }

    func updateTotal(total: Int) {
        self.totalCount = total
    }

    func isMoreRequest() -> Bool{
        return totalCount > requestCount * PhotoSearchParamsBuilder.perPage
    }
}
