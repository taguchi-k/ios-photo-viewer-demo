//
//  SVProgressHUD+kt.swift
//  ios-photo-viewer-demo
//
//  Created by Kentaro on 2017/10/25.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import SVProgressHUD

public extension SVProgressHUD {

    /// ユーザー操作に関する状態
    enum ManipulationType {
        /// ユーザー操作可能
        case permit
        /// ユーザー操作禁止
        case prohibited
    }

    /// 独自メソッド定義（独自メソッドはkt経由で使う）
    enum kt {

        /// マスクのタイプを指定してインジケータを表示する
        /// - デフォルトはユーザー操作禁止・文言なし
        ///
        /// - Parameter manipulationType: ユーザー操作に関する状態 (default: .prohibited)
        /// - Parameter message: インジケータに表示する文字列 (default: nil)
        static func show(manipulationType: ManipulationType = .prohibited,
                         message: String? = nil) {

            SVProgressHUD.setDefaultStyle(.dark)

            switch manipulationType {
            case .permit:
                SVProgressHUD.setDefaultMaskType(.none)
            case .prohibited:
                SVProgressHUD.setDefaultMaskType(.black)
            }

            if let message = message {
                SVProgressHUD.show(withStatus: message)
            } else {
                SVProgressHUD.show()
            }
        }
    }
}
