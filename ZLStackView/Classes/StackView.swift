//
//  StackView.swift
//  ZLStackView
//
//  Created by admin on 2026/5/28.
//

import UIKit

public protocol FlexType {}
extension ZLFlexItem: FlexType {}
extension UIView: FlexType {}


public extension ZLLayout {
    @discardableResult
    func centerX(offset: CGFloat) -> Self {
        centerX(offset) as! Self
    }
    @discardableResult
    func centerX(to: NSLayoutXAxisAnchor, offset: CGFloat) -> Self{
        centerXTo(to,offset) as! Self
    }
    @discardableResult
    func centerXGreaterThanOr(to: NSLayoutXAxisAnchor, offset: CGFloat) -> Self{
        centerXLessThanOrTo(to,offset) as! Self
    }
    
    @discardableResult
    func centerXLessThanOr(to: NSLayoutXAxisAnchor, offset: CGFloat) -> Self{
        centerXLessThanOrTo(to,offset) as! Self
    }
}


extension ZLFlexItem {
    @discardableResult
    public func spacing(_ space: CGFloat) -> Self {
        self.spacing = space
        return self
    }
    @discardableResult
    public func startSpacing(_ space: CGFloat) -> Self {
        self.startSpacing = space
        return self
    }
    @discardableResult
    public func endSpacing(_ space: CGFloat) -> Self {
        self.endSpacing = space
        return self
    }
    @discardableResult
    public func minSpacing(_ space: CGFloat) -> Self {
        self.minSpacing = space
        return self
    }
    @discardableResult
    public func maxSpacing(_ space: CGFloat) -> Self {
        self.maxSpacing = space
        return self
    }
    @discardableResult
    public func spacing(flexible: Bool) -> Self {
        self.isFlexSpace = flexible
        return self
    }
    @discardableResult
    public func flex(_ flex: Int) -> Self {
        self.flexValue = flex
        return self
    }
    @discardableResult
    public func align(_ align: ZLAlign) -> Self {
        self.alignSelf = align
        return self
    }
    @discardableResult
    public func height(_ height: CGFloat) -> Self {
        self.height = height
        return self
    }
    
    @discardableResult
    public func width(_ width: CGFloat) -> Self {
        self.width = width
        return self
    }
    @discardableResult
    public func minHeight(_ minHeight: CGFloat) -> Self {
        self.minHeight = minHeight
        return self
    }
    @discardableResult
    public func maxHeight(_ maxHeight: CGFloat) -> Self {
        self.maxHeight = maxHeight
        return self
    }
    @discardableResult
    public func minWidth(_ minWidth: CGFloat) -> Self {
        self.minWidth = minWidth
        return self
    }
    @discardableResult
    public func maxWidth(_ maxWidth: CGFloat) -> Self {
        self.maxWidth = maxWidth
        return self
    }
    @discardableResult
    public func size(_ width: CGFloat, _ height: CGFloat) -> Self {
        self.size = CGSize(width: width, height: height)
        return self
    }
    @discardableResult
    public func square(_ wh: CGFloat) -> Self {
        self.size = CGSize(width: wh, height: wh)
        return self
    }
}

///DSL协议
public protocol StackViewDSL {}
extension UIView: StackViewDSL {}
extension Float: StackViewDSL {}
extension Int: StackViewDSL {}
extension Double: StackViewDSL {}
public enum Spacer {
    case normal
    case min(Float)
    case max(Float)
    case value(Float)

    public init() {
        self = .normal
    }
    public init(value: Float) {
        self = .value(value)
    }
}
extension Spacer: StackViewDSL {}


public protocol SpacerType {
    var minSpacing: Spacer {get}
    var maxSpacing: Spacer {get}
}

extension Int: SpacerType {
    public var minSpacing: Spacer {
        Spacer.min(Float(self))
    }
    public var maxSpacing: Spacer {
        Spacer.max(Float(self))
    }
}
extension Float: SpacerType {
    public var minSpacing: Spacer {
        Spacer.min(self)
    }
    public var maxSpacing: Spacer {
        Spacer.max(self)
    }
}
extension Double: SpacerType {
    public var minSpacing: Spacer {
        Spacer.min(Float(self))
    }
    public var maxSpacing: Spacer {
        Spacer.max(Float(self))
    }
}

extension ZLFlexItem: StackViewDSL {}


@resultBuilder
public struct StackViewBuilder {
    public static func buildBlock(
        _ components: [StackViewDSL]...
    ) -> [StackViewDSL] {
        components.flatMap { $0 }
    }

    public static func buildExpression(
        _ expression: StackViewDSL
    ) -> [StackViewDSL] {
        [expression]
    }

    public static func buildOptional(
        _ component: [StackViewDSL]?
    ) -> [StackViewDSL] {
        component ?? []
    }

    public static func buildEither(
        first component: [StackViewDSL]
    ) -> [StackViewDSL] {
        component
    }

    public static func buildEither(
        second component: [StackViewDSL]
    ) -> [StackViewDSL] {
        component
    }
}
open class StackView: ZLStackView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    public init(@StackViewBuilder builder: () -> [StackViewDSL]) {
        super.init(frame: .zero)
        addViews(builder: builder)
    }
   @discardableResult
   public func callAsFunction(
           @StackViewBuilder builder: () -> [StackViewDSL]
       ) -> StackView {
           addViews(builder: builder)
           return self
    }
    func addViews(builder: () -> [StackViewDSL]) {
        let arr = builder()
        arr.forEach { component in
            if let view = component as? UIView {
                addView(view)
            }else if let item = component as? Int {
                insertSpacing(CGFloat(item))
            }else if let item = component as? ZLFlexItem {
                addView(item)
            }else if let item = component as? Spacer {
                switch item {
                case .normal:
                    insertSpacing(flexible: true)
                case .min(let value):
                    insertSpacing(min: CGFloat(value))
                case .max(let value):
                    insertSpacing(max: CGFloat(value))
                case .value(let value):
                    insertSpacing(CGFloat(value))
                }
            }
        }
    }
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @available(*, unavailable)
    open override var inset: (CGFloat, CGFloat, CGFloat, CGFloat) -> ZLStackView {
        super.inset
    }
    public func inset(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> Self {
        super.inset(top, left, bottom, right) as! Self
    }
    
    @available(*, unavailable)
    open override var hInset: (CGFloat, CGFloat) -> ZLStackView {
        super.hInset
    }
    public func hInset(_ leading: CGFloat, _ trailing: CGFloat) -> Self {
        super.hInset(leading, trailing) as! Self
    }
    
    @available(*, unavailable)
    open override var vInset: (CGFloat, CGFloat) -> ZLStackView {
        super.vInset
    }
    @discardableResult
    public func vInset(_ top: CGFloat, _ bottom: CGFloat) -> Self {
        super.vInset(top, bottom) as! Self
    }
    
    @available(*, unavailable)
    open override var space: (CGFloat) -> ZLStackView {
        super.space
    }
    @discardableResult
    public func spacing(_ space: CGFloat) -> Self {
        super.space(space) as! Self
    }
    
    @available(*, unavailable)
    open override var insertSpace: (CGFloat) -> ZLStackView {
        super.insertSpace
    }
    @discardableResult
    public func insertSpacing(_ space: CGFloat) -> Self {
        super.insertSpace(space) as! Self
    }
    
    @available(*, unavailable)
    open override var insertMinSpace: (CGFloat) -> ZLStackView {
        super.insertMinSpace
    }
    @discardableResult
    public func insertSpacing(min: CGFloat) -> Self {
        super.insertMinSpace(min) as! Self
    }
    
    @available(*, unavailable)
    open override var insertMaxSpace: (CGFloat) -> ZLStackView {
        super.insertMaxSpace
    }
    @discardableResult
    public func insertSpacing(max: CGFloat) -> Self {
        super.insertMaxSpace(max) as! Self
    }
    
    
    @available(*, unavailable)
    open override var insertFlexSpace: (Bool) -> ZLStackView {
        super.insertFlexSpace
    }
    @discardableResult
    public func insertSpacing(flexible: Bool) -> Self {
        super.insertFlexSpace(flexible) as! Self
    }
    
    @available(*, unavailable)
    open override var addView: (UIView) -> ZLStackView {
        super.addView
    }
    @discardableResult
    public func addView(_ view: FlexType) -> Self {
        super.addView(getView(view)) as! Self
    }
    private func getView(_ view: FlexType) -> UIView {
        if let view = view as? UIView {
            return view
        }
        if let item = view as? ZLFlexItem{
            return item.view
        }
        fatalError("Invalid view type")
    }
    
    @available(*, unavailable)
    open override var addViewIf: (Bool, UIView) -> ZLStackView {
        super.addViewIf
    }
    @discardableResult
    public func addView(if condition: Bool, _ view: FlexType) -> Self {
        super.addViewIf(condition, getView(view)) as! Self
    }
    
    @available(*, unavailable)
    open override var addViewMakeIf: (Bool, @escaping (ZLBaseStackView<AnyObject>) -> UIView) -> ZLStackView {
        super.addViewMakeIf
    }
    @discardableResult
    public func addView(if condition: Bool, using: @escaping (StackView) -> UIView) -> Self {
        let block = { (stackView: AnyObject) -> UIView in
            let view = using(stackView as! StackView)
            return view
        }
      return super.addViewMakeIf(condition, block) as! Self
    }
    
    @available(*, unavailable)
    open override var addViewLayout: (UIView, @escaping (UIView, ZLFlexItem) -> Void) -> ZLStackView {
        super.addViewLayout
    }
    @discardableResult
    public func addView(_ view: FlexType, layout: @escaping (UIView, ZLFlexItem) -> Void) -> Self {
        super.addViewLayout(getView(view), layout) as! Self
    }
    
    @available(*, unavailable)
    open override var addViewMake: (@escaping (ZLBaseStackView<AnyObject>) -> UIView) -> ZLStackView {
        super.addViewMake
    }
    @discardableResult
    public func addView(using: @escaping (StackView) -> UIView) -> Self {
        let block = { (stackView: AnyObject) -> UIView in
            let view = using(stackView as! StackView)
            return view
        }
       return super.addViewMake(block) as! Self
    }
    
    @available(*, unavailable)
    open override var spacingAfter: (CGFloat, UIView) -> ZLStackView {
        super.spacingAfter
    }
    @discardableResult
    public func spacing( _ space: CGFloat, after: UIView) -> Self {
        super.spacingAfter(space, after) as! Self
    }
    
    @available(*, unavailable)
    open override var minSpacingAfter: (CGFloat, UIView) -> ZLStackView {
        super.minSpacingAfter
    }
    @discardableResult
    public func minSpacing(_ space: CGFloat, after: UIView) -> Self {
        super.minSpacingAfter(space, after) as! Self
    }
    
    @available(*, unavailable)
    open override var maxSpacingAfter: (CGFloat, UIView) -> ZLStackView {
        super.maxSpacingAfter
    }
    @discardableResult
    public func maxSpacing(_ space: CGFloat, after: UIView) -> Self {
        super.maxSpacingAfter(space, after) as! Self
    }
    
    @available(*, unavailable)
    open override var flexFor: (Int, UIView) -> ZLStackView {
        super.flexFor
    }
    @discardableResult
    public func flex(_ flex: Int, for view: UIView) -> Self {
        super.flexFor(flex, view) as! Self
    }
    
    @available(*, unavailable)
    open override var flexSpacingAfter: (Bool, UIView) -> ZLStackView {
        super.flexSpacingAfter
    }
    
    @discardableResult
    public func spacing(flexible: Bool, after view: UIView) -> Self {
        super.flexSpacingAfter(flexible, view) as! Self
    }
    
    @available(*, unavailable)
    open override var alignFor: (ZLAlign, UIView) -> ZLStackView {
        super.alignFor
    }
    
    @discardableResult
    public func align(_ align: ZLAlign, for view: UIView) -> Self {
        super.alignFor(align, view) as! Self
    }
    
    @available(*, unavailable)
    open override var alignStartSpacingFor: (CGFloat, UIView) -> ZLStackView {
        super.alignStartSpacingFor
    }
    
    @discardableResult
    public func startSpacing(_ space: CGFloat, for view: UIView) -> Self {
        super.alignStartSpacingFor(space, view) as! Self
    }
    
    @available(*, unavailable)
    open override var alignEndSpacingFor: (CGFloat, UIView) -> ZLStackView {
        super.alignEndSpacingFor
    }
    @discardableResult
    public func endSpacing(_ space: CGFloat, for view: UIView) -> Self {
        super.alignEndSpacingFor(space, view) as! Self
    }
    
    @available(*, unavailable)
    open override var assignToPtr: (AutoreleasingUnsafeMutablePointer<ZLBaseStackView<AnyObject>?>?) -> ZLStackView {
        super.assignToPtr
    }
    
    @discardableResult
    public func assignTo(_ ptr: AutoreleasingUnsafeMutablePointer<ZLBaseStackView<AnyObject>?>?) -> Self {
        super.assignToPtr(ptr) as! Self
    }
    
    @discardableResult
    public func hidden(_ hidden: Bool) -> Self {
        self.isHidden = hidden
        return self
    }
    
    @discardableResult
    public func alpha(_ alpha: CGFloat) -> Self {
        self.alpha = alpha
        return self
    }
    
    @available(*, unavailable)
    open override var userActive: (Bool) -> ZLStackView {
        super.userActive
    }
    
    @discardableResult
    public func userActive(_ active: Bool) -> Self {
       return super.userActive(active) as! Self
    }
    
    @available(*, unavailable)
    open override var bgColor: (Any) -> ZLStackView {
        super.bgColor
    }
    
    @discardableResult
    public func bgColor(_ color: Any) -> Self {
        backgroundColor = color as? UIColor
        return self
    }
    
    @available(*, unavailable)
    open override var corner: (CGFloat) -> ZLStackView {
        super.corner
    }
    @discardableResult
    public func corner(_ radius: CGFloat) -> Self {
        super.corner(radius) as! Self
    }
    
//    @available(*, unavailable)
//    open override var corners: (CACornerMask) -> ZLStackView {
//        if #available(iOS 11.0, *) {
//            super.corners
//        } else {
//            // Fallback on earlier versions
//        }
//    }
    
    @available(iOS 11.0, *)
    @discardableResult
    public func corners(_ corners: CACornerMask) -> Self {
        super.corners(corners) as! Self
    }
    
    @available(*, unavailable)
    open override var borderColor: (Any) -> ZLStackView {
        super.borderColor
    }
    @discardableResult
    public func borderColor(_ color: Any) -> Self {
        super.borderColor(color) as! Self
    }
    
    @available(*, unavailable)
    open override var borderWidth: (CGFloat) -> ZLStackView {
        super.borderWidth
    }
    @discardableResult
    public func borderWidth(_ width: CGFloat) -> Self {
        super.borderWidth(width) as! Self
    }
    
    @available(*, unavailable)
    open override var border: (CGFloat, Any) -> ZLStackView {
        super.border
    }
    @discardableResult
    public func border(_ width: CGFloat, _ color: Any) -> Self {
        super.border(width, color) as! Self
    }
    
    @available(*, unavailable)
    open override var shColor: (Any) -> ZLStackView {
        super.shColor
    }
    
    @discardableResult
    public func shColor(_ color: Any) -> Self {
        super.shColor(color) as! Self
    }
    
    @available(*, unavailable)
    open override var shOffset: (CGFloat, CGFloat) -> ZLStackView {
        super.shOffset
    }
    
    @discardableResult
    public func shOffset(_ x: CGFloat, _ y: CGFloat) -> Self {
        super.shOffset(x, y) as! Self
    }
    
    @available(*, unavailable)
    open override var shOpacity: (CGFloat) -> ZLStackView {
        super.shOpacity
    }
    @discardableResult
    public func shOpacity(_ opacity: CGFloat) -> Self {
        super.shOpacity(opacity) as! Self
    }
    
    @available(*, unavailable)
    open override var shRadius: (CGFloat) -> ZLStackView {
        fatalError("")
    }
    @discardableResult
    public  func shRadius(_ radius: CGFloat) -> Self {
        super.shRadius(radius) as! Self
    }
    
    @available(*, unavailable)
    open override var masksToBounds: (Bool) -> ZLStackView {
        super.masksToBounds
    }
    @discardableResult
    public func masksToBounds(_ masks: Bool) -> Self {
        super.masksToBounds(masks) as! Self
    }
    
    @available(*, unavailable)
    open override var centerX: (CGFloat) -> ZLStackView {
        super.centerX
    }
    @discardableResult
    public func centerX(_ offset: CGFloat) -> Self {
        super.centerX(offset) as! Self
    }
    
    @available(*, unavailable)
    open override var centerY: (CGFloat) -> ZLStackView {
        super.centerY
    }
    @discardableResult
    public func centerY(_ offset: CGFloat) -> Self {
        super.centerY(offset) as! Self
    }
    
    @available(*, unavailable)
    open override var centerOffset: (CGFloat, CGFloat) -> ZLStackView {
        super.centerOffset
    }
    @discardableResult
    public func centerOffset(_ x: CGFloat, _ y: CGFloat) -> Self {
        super.centerOffset(x, y) as! Self
    }
    
    @available(*, unavailable)
    open override var top: (CGFloat) -> ZLStackView {
        super.top
    }
    @discardableResult
    public func top(_ offset: CGFloat) -> Self {
        super.top(offset) as! Self
    }
    
    @available(*, unavailable)
    open override var leading: (CGFloat) -> ZLStackView {
        super.leading
    }
    @discardableResult
    public func leading(_ offset: CGFloat) -> Self {
        super.leading(offset) as! Self
    }
    
    
    @available(*, unavailable)
    open override var bottom: (CGFloat) -> ZLStackView {
        super.bottom
    }

    @discardableResult
    public func bottom(_ offset: CGFloat) -> Self {
        super.bottom(offset) as! Self
    }


    @available(*, unavailable)
    open override var trailing: (CGFloat) -> ZLStackView {
        super.trailing
    }

    @discardableResult
    public func trailing(_ offset: CGFloat) -> Self {
        super.trailing(offset) as! Self
    }


    /// 设置高度
    @available(*, unavailable)
    open override var height: (CGFloat) -> ZLStackView {
        super.height
    }

    @discardableResult
    public func height(_ value: CGFloat) -> Self {
        super.height(value) as! Self
    }


    /// 设置宽度
    @available(*, unavailable)
    open override var width: (CGFloat) -> ZLStackView {
        super.width
    }

    @discardableResult
    public func width(_ value: CGFloat) -> Self {
        super.width(value) as! Self
    }


    /// 同时设置宽高
    @available(*, unavailable)
    open override var size: (CGFloat, CGFloat) -> ZLStackView {
        super.size
    }

    @discardableResult
    public func size(_ width: CGFloat, _ height: CGFloat) -> Self {
        super.size(width, height) as! Self
    }


    /// 设置宽高相等
    @available(*, unavailable)
    open override var square: (CGFloat) -> ZLStackView {
        super.square
    }

    @discardableResult
    public func square(_ wh: CGFloat) -> Self {
        super.square(wh) as! Self
    }


    /// 贴紧父视图四边(参数布局)
    @available(*, unavailable)
    open override var edge: (CGFloat, CGFloat, CGFloat, CGFloat) -> ZLStackView {
        super.edge
    }

    @discardableResult
    public func edge(
        _ top: CGFloat,
        _ leading: CGFloat,
        _ bottom: CGFloat,
        _ trailing: CGFloat
    ) -> Self {
        super.edge(top, leading, bottom, trailing) as! Self
    }


    
    /// 贴紧父视图四边(水平参数布局)
    @discardableResult
    public func edgesZero() -> Self {
        super.edgesZero() as! Self
    }


    /// 添加到父视图
    @available(*, unavailable)
    open override var addTo: (UIView) -> ZLStackView {
        super.addTo
    }

    @discardableResult
    public func addTo(_ superview: UIView) -> Self {
        super.addTo(superview) as! Self
    }


    /// 添加到父视图并贴紧四边
    @available(*, unavailable)
    open override var addToFull: (UIView) -> ZLStackView {
        super.addToFull
    }

    @discardableResult
    public func addToFull(_ superview: UIView) -> Self {
        super.addToFull(superview) as! Self
    }


    /// 添加子视图
    @available(*, unavailable)
    open override var addSubview: (UIView) -> ZLStackView {
        super.addSubview
    }

    @discardableResult
    public func addSubview(_ subview: UIView) -> Self {
        super.addSubview(subview) as! Self
    }
    
    @discardableResult
    public func alignment(_ alignment: ZLAlign) -> Self {
        self.alignment = alignment
        return self
    }
    
    @discardableResult
    public func justifyContent(_ justify: ZLJustify) -> Self {
        self.justifyContent = justify
        return self
    }
}

open class VStackView: StackView {
    
    @available(*, unavailable)
    open override class func horizontal() -> Self {
        super.horizontal()
    }
    
    @available(*, unavailable)
    open override var axis: ZLStackViewAxis {
         get { .horizontal }
        set { super.axis = newValue}
     }
}

open class HStackView: StackView {
    
    @available(*, unavailable)
    open override class func vertical() -> Self {
        super.vertical()
    }
    
    @available(*, unavailable)
    open override var axis: ZLStackViewAxis {
         get { .horizontal }
        set { super.axis = newValue}
     }
}

//public var VStackView: StackView {
//    return StackView.vertical()
//}
//public var HStackView: StackView {
//    return StackView.horizontal()
//}


