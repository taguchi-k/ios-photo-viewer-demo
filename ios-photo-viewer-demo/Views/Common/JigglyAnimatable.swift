//
//  JigglyAnimatable.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/26.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

/// ぷるぷるするアニメーション
protocol JigglyAnimatable {
    func animate()
}

extension JigglyAnimatable where Self: UIView {

    func animate() {
        UIView.animate(withDuration: 0.1) {
            self.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
            self.transform = .identity
        }
    }
}
