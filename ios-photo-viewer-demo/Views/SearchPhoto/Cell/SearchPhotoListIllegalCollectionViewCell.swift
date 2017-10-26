//
//  SearchPhotoListIllegalCollectionViewCell.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/25.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

final class SearchPhotoListIllegalCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var messageLabel: UILabel!

    var message = "" {
        didSet {
            messageLabel.text = message
        }
    }
}
