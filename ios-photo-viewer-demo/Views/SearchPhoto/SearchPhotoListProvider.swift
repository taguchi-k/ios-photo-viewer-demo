//
//  SearchPhotoListProvider.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/25.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

final class SearchPhotoListProvider: NSObject {

    var photos = [Photo]()
    fileprivate let factory = SearchPhotoStatusFactory()

    private var status: SearchPhotoStatus? {
        didSet {
            guard let status = status else { return }
            factory.setStatus(status: status)
        }
    }

    func add(status: SearchPhotoStatus, photos: [Photo]) {
        self.status = status
        self.photos = photos
    }

    func append(status: SearchPhotoStatus, photos: [Photo]) {
        self.status = status
        self.photos += photos
    }

    func view() -> SearchPhotoStatusFactory {
        return factory
    }
}

// MARK: - UICollectionViewDataSource
extension SearchPhotoListProvider: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return factory.numberOfItemsInSection(photos: photos)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return factory.create(collectionView: collectionView,
                              indexPath: indexPath,
                              photos: photos)
    }
}

