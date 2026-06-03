//
//  Label.swift
//  ZLStackView
//
//  Created by admin on 2026/6/3.
//

import UIKit

open class Label: ZLLabel {
    
    @available(*, unavailable)
    open override var insets: (CGFloat, CGFloat, CGFloat, CGFloat) -> ZLLabel {
        super.insets
    }
    
    @available(*, unavailable)
    open override var hInset: (CGFloat, CGFloat) -> ZLLabel {
        super.hInset
    }
    @available(*, unavailable)
    open override var vInset: (CGFloat, CGFloat) -> ZLLabel {
        super.vInset
    }
    
    @discardableResult
    public func insets(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> Self {
        super.insets(top, left, bottom, right) as! Self
    }
    
    @available(*, unavailable)
    open override var txt: (String) -> ZLLabel {
        super.txt
    }
    @available(*, unavailable)
    open override var color: (Any) -> ZLLabel {
        super.color
    }
    @available(*, unavailable)
    open override var textAlign: (NSTextAlignment) -> ZLLabel {
        super.textAlign
    }
    @available(*, unavailable)
    open override var systemFont: (CGFloat) -> ZLLabel {
        super.systemFont
    }
    @available(*, unavailable)
    open override var systemFontColor: (CGFloat, Any) -> ZLLabel {
        super.systemFontColor
    }
    @available(*, unavailable)
    open override var systemTextFontColor: (String, CGFloat, Any) -> ZLLabel {
        super.systemTextFontColor
    }
    @available(*, unavailable)
    open override var mediumFont: (CGFloat) -> ZLLabel {
        super.mediumFont
    }
    @available(*, unavailable)
    open override var mediumFontColor: (CGFloat, Any) -> ZLLabel {
        super.mediumFontColor
    }
    @available(*, unavailable)
    open override var mediumTextFontColor: (String, CGFloat, Any) -> ZLLabel {
        super.mediumTextFontColor
    }
    
    @available(*, unavailable)
    open override var semiboldFont: (CGFloat) -> ZLLabel {
        super.semiboldFont
    }
    @available(*, unavailable)
    open override var boldFont: (CGFloat) -> ZLLabel {
        super.boldFont
    }
    @available(*, unavailable)
    open override var txtMaxWidth: (CGFloat) -> ZLLabel {
        super.txtMaxWidth
    }
    @available(*, unavailable)
    open override var lines: (Int) -> ZLLabel {
        super.lines
    }
    @available(*, unavailable)
    open override var bgColor: (Any) -> ZLLabel {
        super.bgColor
    }
    @available(*, unavailable)
    open override var visibility: (Bool) -> ZLLabel {
        super.visibility
    }
    @available(*, unavailable)
    open override var alphaValue: (CGFloat) -> ZLLabel {
        super.alphaValue
    }
    @discardableResult
    public func text(_ title: String?,
                      color: Any? = nil,
                      fontSize: Float? = nil,
                      weight: UIFont.Weight = .regular,
                      lines: Int? = nil,
                      maxWidth: Float? = nil) -> Self {
        if let text = text {
            self.text = text
        }
        if let fontSize = fontSize {
            font = UIFont.systemFont(ofSize: CGFloat(fontSize), weight: weight )
        }
        if let color = color {
            textColor = ZLColorFromObj(color as? NSObject)
        }
        if let lines = lines {
            numberOfLines = lines
        }
        if let maxWidth = maxWidth {
            preferredMaxLayoutWidth = CGFloat(maxWidth)
        }
        return self
    }
    
    @discardableResult
    public func textAlign(_ align: NSTextAlignment) -> Self {
        textAlignment = align
        return self
    }
    
    @discardableResult
    public func bgColor(_ color: Any) -> Self {
        return super.bgColor(color) as! Self
    }
    
    @discardableResult
    public func hidden(_ hidden: Bool) -> Self {
        return super.visibility(!hidden) as! Self
    }
    @discardableResult
    public func alpha(_ alpha: CGFloat) -> Self {
        return super.alphaValue(alpha) as! Self
    }
    
    @available(*, unavailable)
    open override var userActive: (Bool) -> ZLLabel {
        super.userActive
    }
    @available(*, unavailable)
    open override var inactiveStyle: (@escaping (ZLLabel) -> Void) -> ZLLabel {
        super.inactiveStyle
    }
    
    @discardableResult
    public func userActive(_ active: Bool) -> Self {
        super.userActive(active) as! Self
    }
    @discardableResult
    public func inactiveStyle(_ style: @escaping (ZLLabel) -> Void) -> Self {
        super.inactiveStyle(style) as! Self
    }
    
    @available(*, unavailable)
    open override var corner: (CGFloat) -> ZLLabel {
        super.corner
    }
    @discardableResult
    public func corner(_ radius: CGFloat) -> Self {
        super.corner(radius) as! Self
    }
    @available(*, unavailable)
    open override var corners: (CACornerMask) -> ZLLabel {
        super.corners
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    public func corners(_ corners: CACornerMask) -> Self {
        super.corners(corners) as! Self
    }
    
    @available(*, unavailable)
    open override var attributeTxt: (NSAttributedString) -> ZLLabel {
        super.attributeTxt
    }
    @available(*, unavailable)
    open override var attributeTxtBK: (@escaping (ZLLabel) -> NSAttributedString) -> ZLLabel {
        super.attributeTxtBK
    }
    
    @discardableResult
    public func attributeText(_ attrText: NSAttributedString) -> Self {
        super.attributeTxt(attrText) as! Self
    }
    @discardableResult
    public func attributeText(_ attrText: @escaping (ZLLabel) -> NSAttributedString) -> Self {
        super.attributeTxtBK(attrText) as! Self
    }
    
    @available(*, unavailable)
    open override var borderColor: (Any) -> ZLLabel {
        super.borderColor
    }
    
    @available(*, unavailable)
    open override var borderWidth: (CGFloat) -> ZLLabel {
        super.borderWidth
    }
    
    @available(*, unavailable)
    open override var border: (CGFloat, Any) -> ZLLabel {
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
    open override var masksToBounds: (Bool) -> ZLLabel {
        super.masksToBounds
    }
    
    @discardableResult
    public func masksToBounds(_ masksToBounds: Bool) -> Self {
        super.masksToBounds(masksToBounds) as! Self
    }
    
    @available(*, unavailable)
    open override var tapAction: (@escaping (ZLLabel) -> Void) -> ZLLabel {
        super.tapAction
    }
    
    @discardableResult
    public func tapAction(_ action: @escaping (ZLLabel) -> Void) -> Self {
        super.tapAction(action) as! Self
    }
    
    @available(*, unavailable)
    open override var then: (@escaping (ZLLabel) -> Void) -> ZLLabel {
        super.then
    }
    
    @discardableResult
    public func then(_ then: @escaping (ZLLabel) -> Void) -> Self {
        super.then(then) as! Self
    }
    
    @available(*, unavailable)
    open override var height: (CGFloat) -> ZLLabel {
        super.height
    }
    @available(*, unavailable)
    open override var width: (CGFloat) -> ZLLabel {
        super.width
    }
    @available(*, unavailable)
    open override var size: (CGFloat, CGFloat) -> ZLLabel {
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
