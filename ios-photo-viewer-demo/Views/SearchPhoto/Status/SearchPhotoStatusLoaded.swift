//
//  SearchPhotoStatusLoaded.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/25.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

final class SearchPhotoStatusLoaded: SearchPhotoStatusType {

    func create(collectionView: UICollectionView, indexPath: IndexPath, photos: [Photo]) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SearchPhotoListCollectionViewCell.className,
            for: indexPath) as! SearchPhotoListCollectionViewCell
        cell.photo = photos[indexPath.item]

        return cell
    }

    func numberOfItemsInSection(photos: [Photo]) -> Int {
        return photos.count
    }

    func message() -> String {
        fatalError("ありえないパターン")
    }

    func cellSize(collectionView: UICollectionView) -> CGSize {

        let margin: CGFloat = 4
        let horizontalMargin = (margin * 3)
        let verticalMargin = (margin * 4)
        let horizontalCount: CGFloat = 2
        let verticalCount: CGFloat = 3

        let width = collectionView.frame.width - horizontalMargin
        let height = collectionView.frame.height - verticalMargin

        let cellWidth = width / horizontalCount
        let cellHeight = height / verticalCount

        return CGSize(width: cellWidth, height: cellHeight)
    }
}
