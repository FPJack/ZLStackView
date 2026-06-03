//
//  Button.swift
//  ZLStackView
//
//  Created by admin on 2026/6/3.
//

import UIKit
open class Button: ZLButton {
    @discardableResult
    public func axis(_ axis: ZLButtonAxis) -> Self {
        self.axis = axis
        return self
    }
    
    ///文字图片展示顺序
    @discardableResult
    public func order(_ order: ZLButtonOrder) -> Self {
        self.layoutOrder = order
        return self
    }
    
    @discardableResult
    public func vertical(align: ZLButtonAlign) -> Self {
        self.verticalAlign = align
        return self
    }
    
    @discardableResult
    public func horizontal(align: ZLButtonAlign) -> Self {
        self.horizontalAlign = align
        return self
    }
    
    @available(*, unavailable)
    open override var imageTouchOnly: (Bool) -> ZLButton {
        return super.imageTouchOnly
    }
    
    @discardableResult
    public func imageTouchOnly(_ imageTouchOnly: Bool) -> Self {
        super.imageTouchOnly(imageTouchOnly) as! Self
    }
    
    @available(*, unavailable)
    open override var touchAreaEdge: (CGFloat, CGFloat, CGFloat, CGFloat) -> ZLButton {
        return super.touchAreaEdge
    }
    
    @discardableResult
    public func touchAreaEdge(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> Self {
        super.touchAreaEdge(top, left, bottom, right) as! Self
    }
    
    @available(*, unavailable)
    open override var debounce: (TimeInterval) -> ZLButton {
        super.debounce
    }
    
    @discardableResult
    public func debounce(_ debounce: TimeInterval) -> Self {
        super.debounce(debounce) as! Self
    }
    
    @available(*, unavailable)
    open override var spacing: (CGFloat) -> ZLButton {
        super.spacing
    }
    
    @discardableResult
    public func spacing(_ spacing: CGFloat) -> Self {
        super.spacing(spacing) as! Self
    }
    
    @available(*, unavailable)
    open override func flexSpacing() -> Self {
        super.flexSpacing()
    }
    
    @discardableResult
    public func flexibleSpacing(_ flexible: Bool) -> Self {
        super.flexibleSpacing = flexible
        return self
    }
    
    @available(*, unavailable)
    open override var insets: (CGFloat, CGFloat, CGFloat, CGFloat) -> ZLButton {
        super.insets
    }
    
    @available(*, unavailable)
    open override var hInset: (CGFloat, CGFloat) -> ZLButton {
        super.hInset
    }
    
    @available(*, unavailable)
    open override var vInset: (CGFloat, CGFloat) -> ZLButton {
        super.vInset
    }
    
    ///内边距
    public func insets(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> Self {
        super.insets(top, left, bottom, right) as! Self
    }
    
    
    @available(*, unavailable)
    open override var titSize: (CGFloat, CGFloat) -> ZLButton {
        super.titSize
    }
    
    @discardableResult
    public func titSize(_ width: CGFloat, _ height: CGFloat) -> Self {
        super.titSize(width, height) as! Self
    }
    
    @available(*, unavailable)
    open override var imageSize: (CGFloat, CGFloat) -> ZLButton {
        super.imageSize
    }
    
    @discardableResult
    public func imageSize(_ width: CGFloat, _ height: CGFloat) -> Self {
        super.imageSize(width, height) as! Self
    }
    
    @available(*, unavailable)
    open override var image: (Any) -> ZLButton {
        super.image
    }
    
    @discardableResult
    public func image(_ image: Any) -> Self {
        super.image(image) as! Self
    }
    
    @available(*, unavailable)
    open override var systemImage: (Any) -> ZLButton {
        super.systemImage
    }
    @discardableResult
    public func systemImage(_ systemImage: Any) -> Self {
        super.systemImage(systemImage) as! Self
    }
    
    @available(*, unavailable)
    open override var selectImage: (Any) -> ZLButton {
        super.selectImage
    }
    @discardableResult
    public func selectImage(_ selectImage: Any) -> Self {
        super.selectImage(selectImage) as! Self
    }
    
    @available(*, unavailable)
    open override var bgImage: (Any) -> ZLButton {
        super.bgImage
    }
    @discardableResult
    public func bgImage(_ bgImage: Any) -> Self {
        super.bgImage(bgImage) as! Self
    }
    
    @available(*, unavailable)
    open override var selectBgImage: (Any) -> ZLButton {
        super.selectBgImage
    }
    @discardableResult
    public func selectBgImage(_ selectBgImage: Any) -> Self {
        super.selectBgImage(selectBgImage) as! Self
    }
    
    @available(*, unavailable)
    open override var title: (String) -> ZLButton {
        super.title
    }
    @discardableResult
    public func title(_ title: String) -> Self {
        super.title(title) as! Self
    }
    
    @available(*, unavailable)
    open override var titleAlign: (NSTextAlignment) -> ZLButton {
        super.titleAlign
    }
    @discardableResult
    public func titleAlign(_ titleAlign: NSTextAlignment) -> Self {
        super.titleAlign(titleAlign) as! Self
    }
    
    @available(*, unavailable)
    open override var selectTitle: (String) -> ZLButton {
        super.selectTitle
    }

    
    @available(*, unavailable)
    open override var systemFont: (CGFloat) -> ZLButton {
        super.systemFont
    }
    @available(*, unavailable)
    open override var systemFontColor: (CGFloat, Any) -> ZLButton {
        super.systemFontColor
    }
    @available(*, unavailable)
    open override var systemTitleFontColor: (String, CGFloat, Any) -> ZLButton {
        super.systemTitleFontColor
    }
    
    @available(*, unavailable)
    open override var mediumFont: (CGFloat) -> ZLButton {
        super.mediumFont
    }
    
    @available(*, unavailable)
    open override var mediumFontColor: (CGFloat, Any) -> ZLButton {
        super.mediumFontColor
    }
    
    @available(*, unavailable)
    open override var mediumTitleFontColor: (String, CGFloat, Any) -> ZLButton {
        super.mediumTitleFontColor
    }
    
    @available(*, unavailable)
    open override var semiboldFont: (CGFloat) -> ZLButton {
        super.semiboldFont
    }
    @available(*, unavailable)
    open override var boldFont: (CGFloat) -> ZLButton {
        super.boldFont
    }
    
    @discardableResult
    public func title(_ title: String?,
                      color: Any? = nil,
                      fontSize: Float? = nil,
                      weight: UIFont.Weight = .regular,
                      lines: Int? = nil,
                      maxWidth: Float? = nil) -> Self {
        setTitle(title, for: .normal)
        if let fontSize = fontSize {
            titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontSize), weight: weight )
        }
        if let color = color {
            setTitleColor(color as? UIColor, for: .normal)
        }
        if let lines = lines {
            titleLabel?.numberOfLines = lines
        }
        if let maxWidth = maxWidth {
            titleLabel?.preferredMaxLayoutWidth = CGFloat(maxWidth)
        }
        return self
    }
    
    @available(*, unavailable)
    open override var titleColor: (Any) -> ZLButton {
        super.titleColor
    }
    
    @available(*, unavailable)
    public override var selectTitleColor: (Any) -> ZLButton {
        super.selectTitleColor
    }
    
    @discardableResult
    public func title(_ title: String? ,color: Any? = nil,for: UIControl.State = .normal) -> Self {
        setTitleColor(ZLColorFromObj(color as? NSObject), for: `for`)
        setTitle(title, for: `for`)
        return self
    }
    
    @available(*, unavailable)
    open override var titleMaxWidth: (CGFloat) -> ZLButton {
        super.titleMaxWidth
    }
    
    @available(*, unavailable)
    open override var titleLines: (Int) -> ZLButton {
        super.titleLines
    }
    
    @available(*, unavailable)
    open override var bgColor: (Any) -> ZLButton {
        super.bgColor
    }
    
    @discardableResult
    public func bgColor(_ bgColor: Any) -> Self {
        super.bgColor(bgColor) as! Self
    }
    
    @available(*, unavailable)
    open override var imgInsets: (CGFloat, CGFloat) -> ZLButton {
        super.imgInsets
    }
    
    @discardableResult
    public func imgInsets(_ horizontal: Float, _ vertical: Float) -> Self {
        super.imgInsets(CGFloat(horizontal), CGFloat(vertical)) as! Self
    }
    
    @available(*, unavailable)
    open override var titInsets: (CGFloat, CGFloat) -> ZLButton {
        super.titInsets
    }
    
    @discardableResult
    public func titInsets(_ horizontal: Float, _ vertical: Float) -> Self {
        super.titInsets(CGFloat(horizontal), CGFloat(vertical)) as! Self
        
    }
    
    @available(*, unavailable)
    open override var tapAction: (@escaping (ZLButton) -> Void) -> ZLButton {
        super.tapAction
    }
    
    @discardableResult
    public func tapAction(_ tapAction: @escaping (ZLButton) -> Void) -> Self {
        super.tapAction(tapAction) as! Self
    }
    
    @available(*, unavailable)
    open override var addTargetSel: (Any, Selector) -> ZLButton {
        super.addTargetSel
    }
    
    @discardableResult
    public func addTarget(_ target: Any, _ action: Selector) -> Self {
        super.addTargetSel(target, action) as! Self
    }
    
    @available(*, unavailable)
    open override var imageMode: (UIViewContentMode) -> ZLButton {
        super.imageMode
    }
    
    @discardableResult
    public func imageMode(_ imageMode: UIViewContentMode) -> Self {
        super.imageMode(imageMode) as! Self
    }
    
    @available(*, unavailable)
    open override var visibility: (Bool) -> ZLButton {
        super.visibility
    }
    
    @discardableResult
    public func hidden(_ hidden: Bool) -> Self {
        super.visibility(!hidden) as! Self
    }
    
    @available(*, unavailable)
    open override var alphaValue: (CGFloat) -> ZLButton {
        super.alphaValue
    }
    
    @discardableResult
    public func alpha(_ alpha: CGFloat) -> Self {
        self.alpha = alpha
        return self
    }
    
    @available(*, unavailable)
    open override var userActive: (Bool) -> ZLButton {
        super.userActive
    }
    
    @discardableResult
    public func userActive(_ userActive: Bool) -> Self {
        super.userActive(userActive) as! Self
    }
    
    @available(*, unavailable)
    open override var select: (Bool) -> ZLButton {
        super.select
    }
    
    @discardableResult
    public func select(_ select: Bool) -> Self {
        super.select(select) as! Self
    }
    
    @available(*, unavailable)
    open override var corner: (CGFloat) -> ZLButton {
        super.corner
    }
    
    @discardableResult
    public func corner(_ corner: CGFloat) -> Self {
        super.corner(corner) as! Self
    }
    
    @available(*, unavailable)
    open override var cornerRadii: (CGFloat, CGFloat, CGFloat, CGFloat) -> ZLButton {
        super.cornerRadii
    }
    
    @discardableResult
    public func cornerRadii(_ topLeft: CGFloat, _ topRight: CGFloat, _ bottomLeft: CGFloat, _ bottomRight: CGFloat) -> Self {
        super.cornerRadii(topLeft, topRight, bottomLeft, bottomRight) as! Self
    }
    
    @available(*, unavailable)
    open override var circle: (Bool) -> ZLButton {
        super.circle
    }
    
    @discardableResult
    public func circle(_ circle: Bool) -> Self {
        super.circle(circle) as! Self
    }
    
    @available(*, unavailable)
    open override var imageCorner: (CGFloat) -> ZLButton {
        super.imageCorner
    }
    @discardableResult
    public func imageCorner(_ imageCorner: CGFloat) -> Self {
        super.imageCorner(imageCorner) as! Self
    }
    
    @available(*, unavailable)
    open override var borderColor: (Any) -> ZLButton {
        super.borderColor
    }
    
    @available(*, unavailable)
    open override var borderWidth: (CGFloat) -> ZLButton {
        super.borderWidth
    }
    
    @available(*, unavailable)
    open override var border: (CGFloat, Any) -> ZLButton {
        super.border
    }
    
    @discardableResult
    public func border(_ borderColor: Any? = nil, _ borderWidth: Float? = nil) -> Self {
        if let borderColor = borderColor {
           _ = super.borderColor(borderColor)
        }
        if let borderWidth = borderWidth {
           _ = super.borderWidth(CGFloat(borderWidth))
        }
        return self
    }
    
    @available(*, unavailable)
    open override var shColor: (Any) -> ZLButton {
        super.shColor
    }
    
    @available(*, unavailable)
    open override var shOffset: (CGFloat, CGFloat) -> ZLButton {
        super.shOffset
    }
    
    @available(*, unavailable)
    open override var shOpacity: (CGFloat) -> ZLButton {
        super.shOpacity
    }
    @available(*, unavailable)
    open override var shRadius: (CGFloat) -> ZLButton {
        super.shRadius
    }
    
    @discardableResult
    public func shadow(color: Any? = nil,
                       offsetX: Float? = nil,
                       offsetY: Float? = nil,
                       opacity: Float? = nil,
                       radius: Float? = nil) -> Self {
        if let color = color {
            _ = super.shColor(color)
        }
        if let offsetX = offsetX, let offsetY = offsetY {
            _ = super.shOffset(CGFloat(offsetX), CGFloat(offsetY))
        }
        if let opacity = opacity {
            _ = super.shOpacity(CGFloat(opacity))
        }
        if let radius = radius {
            _ = super.shRadius(CGFloat(radius))
        }
        return self
    }
    
    @available(*, unavailable)
    open override var masksToBounds: (Bool) -> ZLButton {
        super.masksToBounds
    }
    
    @discardableResult
    public func masksToBounds(_ masksToBounds: Bool) -> Self {
        super.masksToBounds(masksToBounds) as! Self
    }
    
    @available(*, unavailable)
    open override var gradColors: ([Any]) -> ZLButton {
        super.gradColors
    }
    
    @available(*, unavailable)
    open override var gradDirection: (CGPoint, CGPoint) -> ZLButton {
        
        super.gradDirection
    }
    
    @discardableResult
    public func gradient(colors: [Any]? = nil,
                         startPoint: CGPoint? = nil,
                         endPoint: CGPoint? = nil) -> Self {
        if let colors = colors {
           _ = super.gradColors(colors)
        }
        if let startPoint = startPoint, let endPoint = endPoint {
           _ = super.gradDirection(startPoint, endPoint)
        }
        return self
    }
    
    @available(*, unavailable)
    open override var activeStyle: (@escaping (ZLButton) -> Void) -> ZLButton {
        super.activeStyle
    }
    
    @discardableResult
    public func activeStyle(_ activeStyle: @escaping (ZLButton) -> Void) -> Self {
        super.activeStyle(activeStyle) as! Self
    }
    
    @available(*, unavailable)
    open override var inactiveStyle: (@escaping (ZLButton) -> Void) -> ZLButton {
        super.inactiveStyle
    }
    
    @discardableResult
    public func inactiveStyle(_ inactiveStyle: @escaping (ZLButton) -> Void) -> Self {
        super.inactiveStyle(inactiveStyle) as! Self
    }
    
    @available(*, unavailable)
    open override var then: (@escaping (ZLButton) -> Void) -> ZLButton {
        super.then
    }
    
    @discardableResult
    public func then(_ then: @escaping (ZLButton) -> Void) -> Self {
        super.then(then) as! Self
    }
    
    @available(*, unavailable)
    open override var height: (CGFloat) -> ZLButton {
        super.height
    }
    @available(*, unavailable)
    open override var width: (CGFloat) -> ZLButton {
        super.width
    }
    @available(*, unavailable)
    open override var size: (CGFloat, CGFloat) -> ZLButton {
        super.size
    }
    
    @discardableResult
    public func size(w: Float? = nil, h: Float? = nil) -> Self {
        if let width = w {
            _ = super.width(CGFloat(width))
        }
        if let height = h {
            _ = super.height(CGFloat(height))
        }
        return self
    }
}

public var VButton: Button {
    let button = Button()
    button.axis = .vertical
    return button
}

public var HButton: Button {
    let button = Button()
    button.axis = .horizontal
    return button
}



