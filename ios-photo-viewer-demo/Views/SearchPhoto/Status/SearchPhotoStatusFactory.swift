//
//  SearchPhotoStatusFactory.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/25.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

final class SearchPhotoStatusFactory: NSObject, SearchPhotoStatusType {

    private var viewType: SearchPhotoStatusType?

    func setStatus(status: SearchPhotoStatus) {

        switch status {
        case .none:
            viewType = SearchPhotoStatusNone()
        case .loading:
            viewType = SearchPhotoStatusLoading()
        case .noData:
            viewType = SearchPhotoStatusNoData()
        case .loaded:
            viewType = SearchPhotoStatusLoaded()
        case .offline:
            viewType = SearchPhotoStatusOffLine()
        case .error(let error):
            viewType = SearchPhotoStatusError(error: error)
        }
    }

    // MARK: - SearchPhotoStatusType
    func create(collectionView: UICollectionView,
                indexPath: IndexPath,
                photos: [Photo]) -> UICollectionViewCell {

        return viewType?.create(collectionView: collectionView,
                                indexPath: indexPath,
                                photos: photos) ?? UICollectionViewCell()
    }

    func numberOfItemsInSection(photos: [Photo]) -> Int {
        return viewType?.numberOfItemsInSection(photos: photos) ?? 0
    }

    func message() -> String {
        return viewType?.message() ?? ""
    }

    func cellSize(collectionView: UICollectionView) -> CGSize {
        return viewType?.cellSize(collectionView: collectionView) ?? .zero
    }
}
