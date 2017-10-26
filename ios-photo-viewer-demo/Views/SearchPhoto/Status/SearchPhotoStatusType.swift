//
//  SearchPhotoStatusType.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/25.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

/// SearchPhotoStatusによるView表示protocol
protocol SearchPhotoStatusType {

    /// パラメータからセルを返す
    ///
    /// - Parameters:
    ///   - collectionView:
    ///   - indexPath:
    ///   - photos: 写真モデル
    /// - Returns: セル
    func create(collectionView: UICollectionView,
                indexPath: IndexPath,
                photos: [Photo]) -> UICollectionViewCell

    /// セクション毎のアイテム数を返す
    ///
    /// - Parameter photos: 写真モデル
    /// - Returns: アイテム数
    func numberOfItemsInSection(photos: [Photo]) -> Int

    /// 表示するメッセージを返す
    ///
    /// - Returns: メッセージ
    func message() -> String

    /// セルサイズを返す
    ///
    /// - Parameter collectionView:
    /// - Returns: セルサイズ
    func cellSize(collectionView: UICollectionView) -> CGSize
}

extension SearchPhotoStatusType where Self: NSObject {

    func create(collectionView: UICollectionView,
                indexPath: IndexPath,
                photos: [Photo]) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SearchPhotoListIllegalCollectionViewCell.className,
            for: indexPath) as! SearchPhotoListIllegalCollectionViewCell
        cell.messageLabel.text = message()

        return cell
    }

    func numberOfItemsInSection(photos: [Photo]) -> Int {
        return 1
    }

    func cellSize(collectionView: UICollectionView) -> CGSize {
        return collectionView.frame.size
    }
}
