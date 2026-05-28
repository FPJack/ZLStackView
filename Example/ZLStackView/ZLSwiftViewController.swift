//
//  ZLSwiftViewController.swift
//  ZLStackView_Example
//
//  Created by admin on 2026/5/28.
//  Copyright © 2026 fanpeng. All rights reserved.
//

import UIKit
import ZLStackView
class ZLSwiftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView()
        ZLStackView.horizontal()
//            .addView(if: true, view: UIView())
            .addView(if: true) {  stackView in
                return view
            }
            .addView(view) {  _, __ in
                
            }
            .addView { stackView in
                return view
            }
            .justifyEnd()
            .spacing(10, after: view)
            .minSpacing(0, after: view)
            .maxSpacing(0, after: view)
            .flex(2, for: view)
            .flexibleSpacing(true, after: view)
            .align(.center, for: view)
            .alignStartSpacing(10, for: view)
            .alignEndSpacing(10, for: view)
            
        

    }
}
