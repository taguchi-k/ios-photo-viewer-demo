//
//  FavoritePhotoListViewController.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/26.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

final class FavoritePhotoListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    fileprivate let dataSource = FavoritePhotoListProvider()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
    }

    // MARK: - fileprivate
    fileprivate func reloadData() {
        dataSource.add(favoritePhotos: FavoritePhotoDao.findAll())
        collectionView.reloadData()
    }

    // MARK: - Private
    private func setup() {
        collectionView.dataSource = dataSource
        dataSource.delegate = self
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension FavoritePhotoListViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return dataSource.cellSize(collectionView: collectionView)
    }
}

// MARK: - FavoritePhotoListProviderDelegate
extension FavoritePhotoListViewController: FavoritePhotoListProviderDelegate {

    func didDeleteItem() {
        reloadData()
    }
}
