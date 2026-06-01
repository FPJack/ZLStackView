# ZLStackView


> 一个基于 AutoLayout 的高性能、强 DSL、API 友好的 **StackView** 替代方案。同时提供 **Objective-C 链式 API** 与 **Swift `@resultBuilder` DSL**，弥补 `UIStackView` 的能力短板（弹性间距、min/max spacing、按 view 单独配置 align/flex、嵌套 ScrollView 自适应等），并且通过纯 AutoLayout 一次性构建约束，避免 `UIStackView` 在动态布局时的多次回流。

---

## 目录

- [特性](#特性)
- [示例工程](#示例工程)
- [环境要求](#环境要求)
- [安装](#安装)
- [核心概念](#核心概念)
  - [主轴 / 纵轴](#主轴--纵轴)
  - [`ZLAlign`（纵轴对齐）](#zlalign纵轴对齐)
  - [`ZLJustify`（主轴分布）](#zljustify主轴分布)
  - [`ZLFlexItem`（单个 item 的布局配置）](#zlflexitem单个-item-的布局配置)
- [Objective-C 使用](#objective-c-使用)
  - [基础用法](#基础用法)
  - [链式 API 全集](#链式-api-全集)
  - [按 view 单独配置](#按-view-单独配置)
  - [插入间距 / Spacer](#插入间距--spacer)
  - [外观样式 & 布局便捷方法](#外观样式--布局便捷方法)
  - [`ZLLayout` 通用约束链式 API](#zllayout-通用约束链式-api)
  - [`wrapScrollView` 自适应滚动](#wrapscrollview-自适应滚动)
- [Swift 使用](#swift-使用)
  - [`VStackView` / `HStackView` DSL](#vstackview--hstackview-dsl)
  - [`ZLFlexItem` Swift 链式属性](#zlflexitem-swift-链式属性)
  - [DSL 字面量](#dsl-字面量)
  - [完整示例](#完整示例)
- [API 速查表](#api-速查表)
  - [`ZLStackView` 链式 API](#zlstackview-链式-api)
  - [`ZLFlexItem` 链式 API](#zlflexitem-链式-api)
- [常见问题](#常见问题)
- [作者](#作者)
- [License](#license)

---

## 特性

- ✅ **纯 AutoLayout 实现**：底层一次性构建约束，没有 `UIStackView` 的隐藏 view，性能更好。
- ✅ **完整链式 API**：所有属性都有 block 形式的链式调用，OC 写起来也非常优雅。
- ✅ **Swift DSL**：基于 `@resultBuilder` 的 `VStackView { ... }` / `HStackView { ... }` 语法。
- ✅ **min/max spacing / 弹性间距 / Spacer**：原生 `UIStackView` 难以实现的能力一行搞定。
- ✅ **每个 item 单独配置**：`align` / `flex` / `min/max size` / `start/endSpacing` 等都支持「针对单个 view」覆盖。
- ✅ **flex 权重**：类似 flex-box 的 `flex: 1`，按比例分配剩余空间（需要 `justifyContent = .fill`）。
- ✅ **`ZLJustify` 主轴分布**：`fill / fillEqually / start / center / end / spaceBetween / spaceAround / spaceEvenly`。
- ✅ **`wrapScrollView`**：一行代码把 stackView 包成自适应高度的 `UIScrollView`。
- ✅ **外观便捷**：`bgColor / corner / corners / border / shadow / addTo / edgesZero / center / size / square ...` 一应俱全。
- ✅ **配套 `ZLLayout`**：通用 view 的约束链式 API，写约束像写 Masonry / SnapKit 一样自然。

---

## 示例工程

克隆仓库后进入 `Example`，先 `pod install`，然后打开 `ZLStackView.xcworkspace` 运行：

```bash
git clone https://github.com/fanpeng/ZLStackView.git
cd ZLStackView/Example
pod install
open ZLStackView.xcworkspace
```

Demo 中包含：

- `ZLStackViewDemoVC` —— Objective-C 链式 API 用法。
- `ZLSwiftViewController` —— Swift `@resultBuilder` DSL 用法。
- `FrameBenchmarkVC` / `MasonryBenchmarkVC` / `UIStackViewBenchmarkVC` / `ZLStackViewBenchmarkVC` —— 与 Frame / Masonry / UIStackView 的性能对比。

---

## 环境要求

- iOS **10.0+**
- Xcode **12+**
- Swift **5.4+**（因使用 `@resultBuilder`）

---

## 安装

### CocoaPods

```ruby
pod 'ZLStackView'
```

然后执行：

```bash
pod install
```

在 Objective-C 中引入：

```objc
#import <ZLStackView/ZLStackView.h>
```

在 Swift 中：

```swift
import ZLStackView
```

---

## 核心概念

### 主轴 / 纵轴

| Axis | 主轴 (Main Axis) | 纵轴 (Cross Axis) |
| ---- | ---------------- | ----------------- |
| 水平 | 横向 (x)         | 纵向 (y)          |
| 垂直 | 纵向 (y)         | 横向 (x)          |

- `justifyContent` 控制 **主轴** 排列方式。
- `alignment` 控制 **纵轴** 排列方式。
- `ZLFlexItem.align` 让单个 view 在 **纵轴** 上覆盖 stack 的 `alignment`。
- `ZLFlexItem.flex` 让单个 view 在 **主轴** 上按权重瓜分剩余空间（要求 `justifyContent = ZLJustifyFill`）。

### `ZLAlign`（纵轴对齐）

```objc
typedef NS_ENUM(NSInteger, ZLAlign) {
    ZLAlignCenter, // 居中
    ZLAlignStart,  // 顶部 / 左侧
    ZLAlignEnd,    // 底部 / 右侧
    ZLAlignFill,   // 拉伸铺满
};
```

### `ZLJustify`（主轴分布）

```objc
typedef NS_ENUM(NSInteger, ZLJustify) {
   ZLJustifyFill,          // 默认。按内容/flex 填满
   ZLJustifyFillEqually,   // 每个 item 主轴尺寸相等
   ZLJustifyStart,         // 全部靠主轴起点
   ZLJustifyCenter,        // 整体居中
   ZLJustifyEnd,           // 全部靠主轴终点
   ZLJustifySpaceBetween,  // 两端紧贴，中间间距相等
   ZLJustifySpaceAround,   // 两端间距是中间的一半
   ZLJustifySpaceEvenly,   // 所有间距相等
};
```

### `ZLFlexItem`（单个 item 的布局配置）

每个加入 stack 的 `UIView` 都对应一个 `ZLFlexItem`，可通过 `view.zl_flex`（OC）或 `view.flex`（Swift）拿到。它负责描述该 view 自己的：

- **间距**：`startSpacing` / `endSpacing` / `spacing` / `minSpacing` / `maxSpacing` / `isFlexSpace`
- **主轴权重**：`flexValue`
- **纵轴对齐**：`alignSelf`
- **尺寸**：`width` / `height` / `minWidth` / `maxWidth` / `minHeight` / `maxHeight` / `size`

---

## Objective-C 使用

### 基础用法

```objc
#import <ZLStackView/ZLStackView.h>

// 垂直方向
ZLStackView *stack = VStackView();      // 等价于 [ZLStackView vertical]
stack.spacing = 10;
stack.alignment = ZLAlignFill;
stack.justifyContent = ZLJustifyStart;
stack.insets = UIEdgeInsetsMake(12, 16, 12, 16);

[stack addArrangedSubview:label];
[stack addArrangedSubview:button];

[self.view addSubview:stack];
// ... 自行添加约束，或用下方的链式 API
```

### 链式 API 全集

```objc
ZLStackView
    .vertical
    .inset(10, 16, 10, 16)        // 内边距
    .space(12)                    // 默认 spacing
    .bgColor(@"#FFFFFF")          // 支持 UIColor 或 #hex 字符串
    .corner(8)
    .border(1, @"#E5E5E5")
    .addView(titleLabel)
    .addView(subTitleLabel)
    .insertSpace(20)              // 插入一段固定间距
    .insertMinSpace(10)           // 插入一段最小间距
    .insertMaxSpace(40)           // 插入一段最大间距
    .insertFlexSpace(YES)         // 插入弹性间距（撑开剩余空间）
    .addView(actionButton)
    .addViewIf(hasFooter, footerView)            // 条件添加
    .addViewMake(^UIView *(ZLBaseStackView *s) { // block 构造并添加
        UILabel *l = UILabel.new;
        l.text = @"动态创建";
        return l;
    })
    .addViewLayout(avatar, ^(UIView *v, ZLFlexItem *flex) {
        flex.square(40).align(ZLAlignCenter);     // 在添加时同时配置 FlexItem
    })
    .addTo(self.view)             // addSubview 到父视图
    .edgesZero();                 // 贴满父视图四边
```

### 按 view 单独配置

任何已经加进来的 `arrangedSubview`，都能在父 stack 上「指名」配置：

```objc
stack
    .spacingAfter(20, titleLabel)        // titleLabel 后面的间距
    .minSpacingAfter(10, titleLabel)
    .maxSpacingAfter(40, titleLabel)
    .flexSpacingAfter(YES, titleLabel)   // 该处变弹性间距
    .flexFor(1, leftView)                // 主轴权重
    .flexFor(2, rightView)
    .alignFor(ZLAlignCenter, avatar)     // 单独覆盖纵轴对齐
    .alignStartSpacingFor(8, avatar)     // 纵轴起点方向额外间距
    .alignEndSpacingFor(8, avatar);      // 纵轴终点方向额外间距
```

或者直接通过 `view.zl_flex`：

```objc
avatar.zl_flex
    .square(40)
    .align(ZLAlignCenter)
    .start(8)         // 等价于 startSpacing
    .end(8);          // 等价于 endSpacing
```

### 插入间距 / Spacer

| 链式 API                | 含义                                                |
| ----------------------- | --------------------------------------------------- |
| `insertSpace(10)`       | 固定 10pt                                           |
| `insertMinSpace(10)`    | 最小 10pt（可被撑大）                               |
| `insertMaxSpace(40)`    | 最大 40pt（可被压小）                               |
| `insertFlexSpace(YES)`  | 弹性间距，吃掉所有剩余空间（仅 `ZLJustifyFill` 下） |

> Swift 侧对应有 `Spacer()` / `Spacer.min(_)` / `Spacer.max(_)` / `Spacer.value(_)` 以及 `Int` 字面量。

### 外观样式 & 布局便捷方法

```objc
stack
    .bgColor(@"#F8F8F8")
    .corner(12)
    .corners(kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner)   // iOS 11+
    .border(1, UIColor.lightGrayColor)
    .borderColor(@"#DDDDDD")
    .borderWidth(0.5)
    .shColor(@"#000000")
    .shOffset(0, 2)
    .shOpacity(0.2)
    .shRadius(6)
    .masksToBounds(NO)
    .visibility(YES)
    .alphaValue(1.0)
    .userActive(YES)
    .tapAction(^(ZLBaseStackView *v){ NSLog(@"tapped"); })

    // 父视图布局
    .addTo(self.view)
    .top(20).leading(16).trailing(-16)
    // 或直接：
    // .edge(20, 16, 20, 16)
    // .edgesZero()
    // .centerOffset(0, -20)
    // .size(200, 80)
    // .square(60)
    .assignToPtr(&_stack);   // 把当前实例赋值给指针
```

### `ZLLayout` 通用约束链式 API

对于任意 `UIView`，可以使用 `view.zl_layout` 完成约束链式书写：

```objc
[self.view addSubview:card];
card.zl_layout
    .top(20)
    .leadingTo(self.view.safeAreaLayoutGuide.leadingAnchor, 16)
    .trailingTo(self.view.safeAreaLayoutGuide.trailingAnchor, -16)
    .height(120);

avatar.zl_layout
    .square(48)
    .centerYTo(card.centerYAnchor, 0)
    .leadingTo(card.leadingAnchor, 12);
```

支持的语义包括：`top / leading / bottom / trailing / centerX / centerY / center / centerOffset / width / height / minWidth / maxWidth / minHeight / maxHeight / size / square / edges / edgesZero / allEdges`，每个还有 `*To` / `*GreaterThanOrTo` / `*LessThanOrTo` 版本对应 `==` / `>=` / `<=`。

```objc
// 取最后一次添加的约束做动画
NSLayoutConstraint *c = card.zl_layout.height(200).constraint;
[UIView animateWithDuration:0.25 animations:^{
    c.constant = 80;
    [self.view layoutIfNeeded];
}];
```

### `wrapScrollView` 自适应滚动

```objc
ZLScrollView *scroll = [stack wrapScrollView];
scroll.zl_layout.addTo(self.view).edgesZero();
// scroll 的 contentSize 会跟随 stack 自适应：
// 垂直 stack 内容超出时纵向滚动，水平 stack 同理。
```

---

## Swift 使用

### `VStackView` / `HStackView` DSL

```swift
import ZLStackView

VStackView {
    titleLabel
    10                     // Int 字面量 → 固定 spacing
    subTitleLabel
    Spacer()               // 弹性占位
    actionButton
}
.spacing(8)
.alignment(.fill)
.justifyContent(.fill)
.inset(12, 16, 12, 16)
.bgColor(UIColor.white)
.corner(12)
.border(1, UIColor.lightGray)
.addTo(view)
.edgesZero()
```

`HStackView` 用法完全一致，只是主轴方向是水平。

### `ZLFlexItem` Swift 链式属性

通过 `someView.flex.xxx().yyy()...` 即可链式配置该 view 在 stack 中的所有布局参数：

| 链式方法              | 作用                                                          |
| --------------------- | ------------------------------------------------------------- |
| `.spacing(_:)`        | 设置该 item 之后的固定间距（覆盖 stack 的 `spacing`）         |
| `.startSpacing(_:)`   | 该 item 起始端额外间距                                        |
| `.endSpacing(_:)`     | 该 item 末端额外间距                                          |
| `.minSpacing(_:)`     | 该 item 之后的最小间距                                        |
| `.maxSpacing(_:)`     | 该 item 之后的最大间距                                        |
| `.spacing(flexible:)` | 该 item 之后是否为弹性间距（撑开剩余空间）                    |
| `.flex(_:)`           | 主轴权重，按比例分配剩余空间（要求 `justifyContent = .fill`）|
| `.align(_:)`          | 纵轴对齐方式 `.start / .center / .end / .fill`                |
| `.width(_:)`          | 固定宽度                                                      |
| `.height(_:)`         | 固定高度                                                      |
| `.minWidth(_:)`       | 最小宽度                                                      |
| `.maxWidth(_:)`       | 最大宽度                                                      |
| `.minHeight(_:)`      | 最小高度                                                      |
| `.maxHeight(_:)`      | 最大高度                                                      |
| `.size(_, _)`         | 同时设置宽高                                                  |
| `.square(_:)`         | 宽高相等                                                      |

### DSL 字面量

DSL 内部可直接写：

| 写法                         | 等价于                                |
| ---------------------------- | ------------------------------------- |
| `20` (`Int` / `Float` / `Double`) | `.insertSpacing(20)` 固定间距     |
| `30.minSpacing`              | `.insertSpacing(min: 30)`             |
| `60.maxSpacing`              | `.insertSpacing(max: 60)`             |
| `Spacer()`                   | `.insertSpacing(flexible: true)`      |
| `Spacer(value: 12)`          | `.insertSpacing(12)`                  |
| `Spacer.min(10)`             | `.insertSpacing(min: 10)`             |
| `Spacer.max(40)`             | `.insertSpacing(max: 40)`             |

### 完整示例

```swift
import UIKit
import ZLStackView

final class DemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        VStackView {
            // 顶部：头像 + 标题区 + 按钮
            HStackView {
                UIImageView(image: UIImage(named: "avatar")).flex
                    .square(48)
                    .align(.center)

                10

                VStackView {
                    UILabel().flex.height(20).align(.fill)
                    
                    4
                    
                    UILabel().flex.height(16).align(.fill)
                }
                .flex.flex(1).align(.fill)

                UIButton(type: .system).flex.size(60, 28).align(.center)
                
            }
            .spacing(8)
            .alignment(.center)

            12

            // 描述
            UILabel().flex.align(.fill).minHeight(20)

            // 操作区：左右按钮，中间弹性
            HStackView {
                UIButton(type: .system).flex.flex(1).align(.fill)
                Spacer()
                UIButton(type: .system).flex.flex(1).align(.fill)
            }
            .height(40)
            .alignment(.fill)
            .justifyContent(.fill)
        }
        .spacing(8)
        .alignment(.fill)
        .justifyContent(.fill)
        .inset(16, 16, 16, 16)
        .bgColor(UIColor.white)
        .corner(12)
        .border(1, UIColor(white: 0.9, alpha: 1))
        .addTo(view)
        .top(80)
        .leading(16)
        .trailing(16)
    }
}
```

---

## API 速查表

### `ZLStackView` 链式 API

| 链式属性 / 方法                                                                       | 含义                                       |
| ------------------------------------------------------------------------------------- | ------------------------------------------ |
| `+ vertical` / `+ horizontal`                                                         | 创建垂直 / 水平 stack                      |
| `inset(top, leading, bottom, trailing)`                                               | 内边距                                     |
| `hInset(leading, trailing)` / `vInset(top, bottom)`                                   | 水平 / 垂直内边距                          |
| `space(s)`                                                                            | 默认 spacing                               |
| `insertSpace(s)` / `insertMinSpace(s)` / `insertMaxSpace(s)` / `insertFlexSpace(b)`   | 插入间距（固定 / 最小 / 最大 / 弹性）      |
| `addView(v)`                                                                          | 追加 view                                  |
| `addViewIf(c, v)`                                                                     | 条件追加                                   |
| `addViewMake(block)` / `addViewMakeIf(c, block)`                                      | block 构造并追加                           |
| `addViewLayout(v, block)`                                                             | 追加同时配置 `ZLFlexItem`                  |
| `spacingAfter(s, v)` / `minSpacingAfter(s, v)` / `maxSpacingAfter(s, v)` / `flexSpacingAfter(b, v)` | 针对某个 view 后面的间距          |
| `flexFor(n, v)`                                                                       | 设置 v 的主轴权重                          |
| `alignFor(a, v)` / `alignStartSpacingFor(s, v)` / `alignEndSpacingFor(s, v)`          | 单独覆盖 v 的纵轴对齐                      |
| `bgColor / corner / corners / border / borderColor / borderWidth`                     | 外观样式                                   |
| `shColor / shOffset / shOpacity / shRadius / masksToBounds`                           | 阴影 & 裁剪                                |
| `visibility / alphaValue / userActive / tapAction`                                    | 显隐、透明度、可交互、点击事件             |
| `top / leading / bottom / trailing`                                                   | 与父视图的边距约束                         |
| `centerX / centerY / centerOffset`                                                    | 居中                                       |
| `width / height / size / square`                                                      | 尺寸                                       |
| `edge / edgesZero / addTo / addToFull / addSubview`                                   | 父子关系 & 贴边                            |
| `assignToPtr(&var)`                                                                   | 把当前对象赋值给一个指针                   |
| `wrapScrollView`                                                                      | 包一层 `ZLScrollView` 自适应滚动           |

### `ZLFlexItem` 链式 API

| 属性                      | block 链式 (OC)         | Swift 链式                        |
| ------------------------- | ----------------------- | --------------------------------- |
| `startSpacing`            | `.start(s)`             | `.startSpacing(s)`                |
| `endSpacing`              | `.end(s)`               | `.endSpacing(s)`                  |
| `spacing`                 | `.space(s)`             | `.spacing(s)`                     |
| `minSpacing`              | `.minSpace(s)`          | `.minSpacing(s)`                  |
| `maxSpacing`              | `.maxSpace(s)`          | `.maxSpacing(s)`                  |
| `isFlexSpace`             | `.flexSpace(YES)`       | `.spacing(flexible: true)`        |
| `flexValue`               | `.flex(n)`              | `.flex(n)`                        |
| `alignSelf`               | `.align(ZLAlignCenter)` | `.align(.center)`                 |
| `width`                   | `.w(v)`                 | `.width(v)`                       |
| `height`                  | `.h(v)`                 | `.height(v)`                      |
| `minWidth` / `maxWidth`   | `.minW(v)` / `.maxW(v)` | `.minWidth(v)` / `.maxWidth(v)`   |
| `minHeight` / `maxHeight` | `.minH(v)` / `.maxH(v)` | `.minHeight(v)` / `.maxHeight(v)` |
| `size`                    | —                       | `.size(w, h)`                     |
| `square`                  | `.square(wh)`           | `.square(wh)`                     |

> 便捷实例方法：`alignStart` / `alignCenter` / `alignEnd` / `alignFill`。

---

## 常见问题

**Q1：为什么我设置了 `flex` 却没有按比例分配？**
A：请确保 stack 的 `justifyContent = ZLJustifyFill`（默认即此），并且 stack 在主轴方向有明确尺寸（外部约束或 `height` / `width`）。

**Q2：弹性间距 `insertFlexSpace` / `Spacer()` 不生效？**
A：仅在 `ZLJustifyFill` 模式下生效，且 stack 主轴方向需要有足够空间被「撑开」。

**Q3：item 自身有 intrinsicContentSize（如 `UILabel`），又给了 `width`，谁优先？**
A：`ZLFlexItem` 通过约束实现宽高，会以约束优先（即 `width(...)` 会赢）。如不希望被 hugging/compression 影响，可手动调整 priority。

**Q4：在 Swift DSL 中如何把整个 stack 作为子节点放进另一个 stack？**
A：直接把 `VStackView { ... }` 当作 view 放进去即可；如果想链式配置它的 `flex`，使用 `someStack.flex.flex(1).align(.fill).view`，最后 `.view` 取回底层 view。

**Q5：iOS 9 能用吗？**
A：podspec 限制 iOS 10+，因为大量使用了 layout anchor / safeArea 等 API。

---

## 作者

**fanpeng** · 2551412939@qq.com

欢迎提 issue / PR。

---

## License

ZLStackView is available under the **MIT** license. See the [LICENSE](LICENSE) file for more info.
