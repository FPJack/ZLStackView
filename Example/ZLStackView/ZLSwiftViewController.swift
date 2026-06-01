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
    
    var testView: UIView {
        let view = UILabel()
        view.text = "Test View"
        view.textAlignment = .center
        view.textColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        view.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        return view
    }
    
    var swView: UIView {
        UISwitch()
    }
    
    var activityIndicator: UIView {
        if #available(iOS 13.0, *) {
            let view = UIActivityIndicatorView(activityIndicatorStyle: .medium)
            view.startAnimating()
            return view
        } else {
            // Fallback on earlier versions
            let view = UIActivityIndicatorView(activityIndicatorStyle: .gray)
            view.startAnimating()
            return view
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        VStackView {

            testView.flex.width(120).height(20)
            
            5

            testView.flex.minHeight(30)

            10

            testView.flex.flex(1).align(.fill).minHeight(20)
            
            20.minSpacing

            testView.flex.flex(2).align(.fill)
            
            10.minSpacing
            50.maxSpacing
            
            testView.flex.size(180, 24).align(.start).startSpacing(20)
            
            10
            
            if Bool.random() {
                swView
            }else {
                activityIndicator
            }
            
            10

            testView.flex.size(180, 24).align(.end).endSpacing(20)

            Spacer()

            testView
        }
        .height(300)
        .inset(12, 12, 12, 12)               // 内边距
        .bgColor(UIColor(white: 0.92, alpha: 1))
        .corner(8)
        .border(1, UIColor.gray)
        .addTo(view)
        .top(100)
        .leading(16)
        .trailing(-16)
      

        HStackView {

            testView.flex.height(30)

            10
            
            testView.flex.align(.start)

            20.minSpacing

            testView.flex.flex(1).align(.fill)
                
            5
            
            testView.flex.flex(2).align(.fill)

            5
            
            testView.flex.align(.end)

            Spacer()

            testView.flex.square(28).align(.center)
        }
        .horizontal()
        .spacing(4)
        .inset(8, 12, 8, 12)
        .bgColor(UIColor(white: 0.95, alpha: 1))
        .corner(8)
        .border(1, UIColor.lightGray)
        .height(80)
        .addTo(view)
        .leading(16)
        .trailing(-16)
        .top(450)

     
    }
}

