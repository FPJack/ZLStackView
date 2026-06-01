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
        view.backgroundColor = .white

        // MARK: - VStackView Demo: 覆盖 ZLFlexItem 全部链式属性
        // 每个 item 用一句链式调用配置 ZLFlexItem 的所有相关属性
        VStackView {
            // 1) startSpacing / endSpacing / spacing —— 控制单个 item 前后/分隔间距
            UIView().flex
                .startSpacing(8)            // 距上一个 item 起始额外间距
                .endSpacing(8)              // 距下一个 item 末尾额外间距
                .width(120)                 // 固定宽度
                .height(30)                 // 固定高度
                .align(.center)             // 自身对齐方式（横轴）

            // 用 Int 字面量插入固定 spacing
            10

            // 2) minSpacing / maxSpacing —— 限定与下一个 item 之间的间距范围
            UISwitch().flex
                .minHeight(20)              // 最小高度
                .maxHeight(80)              // 最大高度
                .align(.start)              // 左对齐

            // 用 .minSpacing / .maxSpacing 数值字面量插入弹性区间间距
            30.minSpacing
            60.maxSpacing

            // 3) flex —— 弹性权重（VStack 中表示高度比例，需要 justifyContent = .fill）
            UIView().flex
                .flex(1)                    // 权重 1
                .align(.fill)               // 横轴铺满
                .minHeight(40)

            UIView().flex
                .flex(2)                    // 权重 2
                .align(.fill)
                .minHeight(40)

            // 4) spacing(flexible:) —— 该 item 之后的间距为弹性
            UILabel().flex
                .spacing(flexible: true)
                .size(180, 24)              // 同时设置宽高
                .align(.end)                // 右对齐

            // Spacer 弹性占位
            Spacer()

            // 5) size / square —— 一次设置宽高
            UIView().flex
                .square(50)                 // 宽高相等
                .align(.center)
        }
      
        .spacing(6)                          // 默认 spacing
//        .alignment(.fill)                    // 横轴对齐
//        .justifyContent(.fill)               // 主轴分布（flex / 弹性 spacing 生效需要 fill）
        .inset(12, 12, 12, 12)               // 内边距
        .bgColor(UIColor(white: 0.92, alpha: 1))
        .corner(8)
        .border(1, UIColor.gray)
        .addTo(view)
        .top(80)
        .leading(16)
        .trailing(-16)
        if true {
            return
        }

        // MARK: - HStackView Demo: 覆盖 ZLFlexItem 全部链式属性
        HStackView {
            // 1) startSpacing / endSpacing / spacing
            UIView().flex
                .startSpacing(6)
                .endSpacing(6)
                .spacing(4)
                .width(40)
                .height(30)
                .align(.center)             // HStack 中 align 控制纵向对齐

            10

            // 2) minSpacing / maxSpacing + 尺寸约束
            UISwitch().flex
                .minSpacing(10)
                .maxSpacing(40)
                .minWidth(40)
                .maxWidth(120)
                .minHeight(20)
                .maxHeight(60)
                .align(.start)              // 顶部对齐

            20.minSpacing
            50.maxSpacing

            // 3) flex —— HStack 中表示宽度比例
            UIView().flex
                .flex(1)
                .align(.fill)               // 纵向铺满
                .minWidth(20)

            UIView().flex
                .flex(2)
                .align(.fill)
                .minWidth(20)

            // 4) spacing(flexible:) + size
            UILabel().flex
                .spacing(flexible: true)
                .size(40, 24)
                .align(.end)                // 底部对齐

            Spacer()

            // 5) square 等边
            UIView().flex
                .square(28)
                .align(.center)
        }
        .horizontal()
        .spacing(4)
//        .alignment(.fill)
//        .justifyContent(.fill)
        .inset(8, 12, 8, 12)
        .bgColor(UIColor(white: 0.95, alpha: 1))
        .corner(8)
        .border(1, UIColor.lightGray)
        .height(80)
        .addTo(view)
        .leading(16)
        .trailing(16)
        .top(520)

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

