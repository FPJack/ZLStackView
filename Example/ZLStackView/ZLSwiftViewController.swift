//
//  ZLSwiftViewController.swift
//  ZLStackView_Example
//
//  Created by admin on 2026/5/28.
//  Copyright © 2026 fanpeng. All rights reserved.
//

import UIKit
import ZLStackView
@resultBuilder
struct StringBuilder {
    static func buildBlock(_ components: String...) -> String {
        components.joined(separator: "\n")
    }
}
@StringBuilder
func makeText() -> String {
    "Hello"
    "World"
    "Swift"
}

@resultBuilder
struct ArrayBuilder {

    static func buildBlock(
        _ components: [Int]...
    ) -> [Int] {
        components.flatMap { $0 }
    }

    static func buildExpression(
        _ expression: Int
    ) -> [Int] {
        [expression]
    }

    static func buildOptional(
        _ component: [Int]?
    ) -> [Int] {
        component ?? []
    }
    static func buildEither(
        first component: [Int]
    ) -> [Int] {
        component
    }

    static func buildEither(
        second component: [Int]
    ) -> [Int] {
        component
    }
    
    static func buildArray(
        _ components: [[Int]]
    ) -> [Int] {
        components.flatMap { $0 }
    }
    
  
}

@ArrayBuilder
func numbers(flag: Bool) -> [Int] {
    if flag {
        1
    } else {
        2
    }
}

@ArrayBuilder
func test() -> [Int] {

    1

    if true {
        2
    }

    3
}
class ZLSwiftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(makeText())
        view.backgroundColor = .orange
        var flag = false
        let label = UILabel()
        label.text = "kdkdkd"
        label.setContentHuggingPriority(.fittingSizeLevel - 1, for: .vertical)
        label.setContentCompressionResistancePriority(.fittingSizeLevel  - 1, for: .vertical)
        VStackView{
            UISwitch()
            20
            UISwitch()
            40.minSpacing
            UISwitch()
            80.maxSpacing
            UISwitch()
            Spacer()
            UISwitch()
        }.vertical()
         .height(300)
        .bgColor(UIColor.red)
        .addTo(view)
        .centerOffset(0,0)
        
        
        
        VStackView().addViews {
            UILabel()
            UILabel()
            UILabel()
        }
    
        
       
      
        
        return
//        StackView
//            .vertical()
//            .inset(10, 10, 10, 10)
//            .hInset(10, 10)
//            .spacing(10)
//            .spacing(10, after: view)
//            .spacing(flexible: true, after: view)
//            .minSpacing(10, after: view)
//            .maxSpacing(10, after: view)
//            .insertSpacing(10)
//            .insertSpacing(max: 10)
//            .insertSpacing(min: 10)
//            .insertSpacing(flexible: true)
//            .flex(2, for: view)
//            .addView(if: true, UISwitch().flex
//                .spacing(50)
//                .startSpacing(10)
//                .endSpacing(10)
//                .flex(3)
//                     
//                .align(.center)
//                )
//            .addView(if: true, using: { _ in
//                let view = UISwitch()
//                view.isOn = true
//                return view
//            })
//            .addView(using: { stackview in
//               return UISwitch()
//            })
//            .align(.center, for: view)
//            .startSpacing(10, for: view)
//            .addTo(view)
//            .centerOffset(0,0)
//        ;
//        
        
        
//        print(VStackView,VStackView)
    }
}

