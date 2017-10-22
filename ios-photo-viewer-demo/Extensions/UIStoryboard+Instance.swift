//
//  UIStoryboard+Instance.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/22.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

extension UIStoryboard {

    /// Storyboardからインスタンスを取得する
    class func viewController<T: UIViewController>(storyboardName: String,
                                                   identifier: String) -> T? {

        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(
            withIdentifier: identifier) as? T
    }
}
