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
        
        view.backgroundColor = .orange
        
        StackView{
            UISwitch()
            
            2
            
            UISwitch()
            
            2
            
            UISwitch()
            
            2
            
            UIView()
                .flex
                .width(100)
                .height(100)
            
            UISwitch()
            3
        }.vertical().addTo(view)
        .centerOffset(0,0)
        if true {
            return
        }
        
        StackView
            .vertical()
            .inset(10, 10, 10, 10)
            .hInset(10, 10)
            .spacing(10)
            .spacing(10, after: view)
            .spacing(flexible: true, after: view)
            .minSpacing(10, after: view)
            .maxSpacing(10, after: view)
            .insertSpacing(10)
            .insertSpacing(max: 10)
            .insertSpacing(min: 10)
            .insertSpacing(flexible: true)
            .flex(2, for: view)
            .addView(if: true, UISwitch().flex
                .spacing(50)
                .startSpacing(10)
                .endSpacing(10)
                .flex(3)
                     
                .align(.center)
                )
            .addView(if: true, using: { _ in
                let view = UISwitch()
                view.isOn = true
                return view
            })
            .addView(using: { stackview in
               return UISwitch()
            })
            .align(.center, for: view)
            .startSpacing(10, for: view)
            .addTo(view)
            .centerOffset(0,0)
        ;
        
        
        
        print(VStackView,VStackView)
    }
}

