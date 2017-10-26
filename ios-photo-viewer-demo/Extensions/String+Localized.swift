//
//  String+Localized.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/25.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import Foundation

extension String {

    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
