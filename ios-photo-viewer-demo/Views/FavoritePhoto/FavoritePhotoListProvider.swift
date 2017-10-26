//
//  FavoritePhotoListProvider.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/26.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

protocol FavoritePhotoListProviderDelegate: class {
    func didDeleteItem()
}

final class FavoritePhotoListProvider: NSObject {

    var favoritePhotos = [FavoritePhoto]()
    weak var delegate: FavoritePhotoListProviderDelegate?

    fileprivate var isExist: Bool {
        return favoritePhotos.count > 0
    }

    func add(favoritePhotos: [FavoritePhoto]) {
        self.favoritePhotos = favoritePhotos
    }

    func cellSize(collectionView: UICollectionView) -> CGSize {

        if isExist {

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
            
        } else {
            return collectionView.frame.size
        }
    }
}

// MARK: - UICollectionViewDataSource
extension FavoritePhotoListProvider: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return isExist ? favoritePhotos.count : 1
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if isExist {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FavoritePhotoListCollectionViewCell.className,
                for: indexPath) as! FavoritePhotoListCollectionViewCell
            cell.favoritePhoto = favoritePhotos[indexPath.item]
            cell.delegate = self

            return cell

        } else {

            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FavoritePhotoListIllegalCollectionViewCell.className,
                for: indexPath) as! FavoritePhotoListIllegalCollectionViewCell
            cell.messageLabel.text = "MSG_FAV_NODATA".localized()

            return cell
        }
    }
}

// MARK: - FavoritePhotoListCollectionViewCellDelegate
extension FavoritePhotoListProvider: FavoritePhotoListCollectionViewCellDelegate {

    func didDeleteItem() {
        delegate?.didDeleteItem()
    }
}
