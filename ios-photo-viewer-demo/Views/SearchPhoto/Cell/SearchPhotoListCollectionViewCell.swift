//
//  SearchPhotoListCollectionViewCell.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/24.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit
import Kingfisher

final class SearchPhotoListCollectionViewCell: UICollectionViewCell, JigglyAnimatable {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!

    var photo: Photo? {
        didSet {
            setup(photo: photo)
        }
    }

    private var photoURL: String = "" {
        didSet {
            setup(photoURL: photoURL)
        }
    }

    override func prepareForReuse() {
        photoImageView.image = nil
    }

    // MARK: - Action
    @IBAction private func tappedFavoriteButton(_ sender: UIButton) {

        sender.isSelected = !sender.isSelected

        if sender.isSelected {
            // お気に入り未登録なので登録
            addFavorite()
        } else {
            // お気に入り済みなので解除
            removeFavorite()
        }
    }

    // MARK: - Private
    private func setup(photo: Photo?) {
        guard let photo = photo else { return }
        photoURL = PhotoImageURLBuilder.create(photo: photo)
        favoriteButton.isSelected = FavoritePhotoDao.find(photoId: photo.id) != nil
    }

    private func setup(photoURL: String) {
        guard let url = URL(string: photoURL) else {
            fatalError("不正な写真URL")
        }
        photoImageView.kf.setImage(with: url,
                                   placeholder: nil,
                                   options: [.transition(ImageTransition.fade(0.3)), .keepCurrentImageWhileLoading],
                                   progressBlock: nil,
                                   completionHandler: nil)
    }

    private func addFavorite() {
        guard
            let photoId = photo?.id,
            let image = photoImageView.image,
            let imageData = UIImagePNGRepresentation(image) else { return }
        FavoritePhotoDao.add(photoId: photoId, imageData: imageData)
        animate()
    }

    private func removeFavorite() {
        guard let photoId = photo?.id else { return }
        FavoritePhotoDao.delete(photoId: photoId)
    }
}
