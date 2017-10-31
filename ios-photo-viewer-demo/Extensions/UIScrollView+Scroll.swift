//
//  UIScrollView+Scroll.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/25.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

extension UIScrollView {

    /// 最下セルまでスクロールしたか？
    func isScrollEnd() -> Bool {
        return self.contentOffset.y >= self.contentSize.height - self.bounds.height
    }

    /// Bottomまでスクロールする
    ///
    /// - Parameter animated: デフォルト値: true
    func scrollToBottom(animated: Bool = true) {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
        setContentOffset(bottomOffset, animated: animated)
    }

    /// Topまでスクロールする
    ///
    /// - Parameter animated: デフォルト値: true
    func scrollToTop(animated: Bool = true) {
        setContentOffset(CGPoint.zero, animated: animated)
    }
}
