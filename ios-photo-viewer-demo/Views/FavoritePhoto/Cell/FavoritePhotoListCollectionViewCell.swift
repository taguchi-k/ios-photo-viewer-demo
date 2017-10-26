//
//  FavoritePhotoListCollectionViewCell.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/25.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

protocol FavoritePhotoListCollectionViewCellDelegate: class {
    func didDeleteItem()
}

final class FavoritePhotoListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!

    weak var delegate: FavoritePhotoListCollectionViewCellDelegate?

    var favoritePhoto: FavoritePhoto? {
        didSet {
            setup(favoritePhoto: favoritePhoto)
        }
    }

    override func prepareForReuse() {
        photoImageView.image = nil
    }

    // MARK: - Action
    @IBAction private func tappedFavoriteButton(_ sender: UIButton) {

        sender.isSelected = !sender.isSelected
        // お気に入り済みなので解除
        removeFavorite()
    }

    // MARK: - Private
    private func setup(favoritePhoto: FavoritePhoto?) {
        guard let favoritePhoto = favoritePhoto else { return }
        photoImageView.image = UIImage(data: favoritePhoto.imageData)
        favoriteButton.isSelected = FavoritePhotoDao.find(photoId: favoritePhoto.photoId) != nil
    }

    private func removeFavorite() {
        guard let favoritePhoto = favoritePhoto else { return }
        FavoritePhotoDao.delete(id: favoritePhoto.id)
        delegate?.didDeleteItem()
    }
}
