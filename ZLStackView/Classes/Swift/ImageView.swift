//
//  ImageView.swift
//  ZLStackView
//
//  Created by admin on 2026/6/3.
//

import UIKit

open class ImageView: ZLImageView,CreatableView {
    
    @available(*, unavailable)
    open override var img: (Any?) -> ZLImageView {
        super.img
    }
    
    @available(*, unavailable)
    open override var hlImg: (Any?) -> ZLImageView {
        super.hlImg
    }
    
    @available(*, unavailable)
    open override var highlight: (Bool) -> ZLImageView {
        super.highlight
    }
    
    @available(*, unavailable)
    open override var mode: (UIViewContentMode) -> ZLImageView {
        super.mode
    }
    
    @available(*, unavailable)
    open override var corner: (CGFloat) -> ZLImageView {
        super.corner
    }
    @discardableResult
    public func corner(_ radius: Float) -> Self {
        super.corner(CGFloat(radius)) as! Self
    }
    
    @available(*, unavailable)
    open override var corners: (CACornerMask) -> ZLImageView {
        super.corners
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    public func corners(_ corners: CACornerMask) -> Self {
        super.corners(corners) as! Self
    }
    
    @available(*, unavailable)
    open override var circle: (Bool) -> ZLImageView {
        super.circle
    }
    @discardableResult
    public func circle(_ circle: Bool) -> Self {
        super.circle(circle) as! Self
    }
    
    @available(*, unavailable)
    open override var border: (CGFloat, Any?) -> ZLImageView {
        super.border
    }
    @discardableResult
    public func border(_ width: Float? = nil, _ color: Any? = nil) -> Self {
        if let width = width {
            layer.borderWidth = CGFloat(width);
        }
        if let color = color {
            self.layer.borderColor = ZLColorFromObj(color as? NSObject)?.cgColor;
        }
        return self
    }
    
    @available(*, unavailable)
    open override var bgColor: (Any?) -> ZLImageView {
        super.bgColor
    }
    
    @discardableResult
    public func bgColor(_ color: Any?) -> Self {
        return super.bgColor(color) as! Self
    }
    
    @available(*, unavailable)
    open override var visibility: (Bool) -> ZLImageView {
        super.visibility
    }
    @available(*, unavailable)
    open override var alphaValue: (CGFloat) -> ZLImageView {
        super.alphaValue
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
    open override var userActive: (Bool) -> ZLImageView {
        super.userActive
    }
    @available(*, unavailable)
    open override var inactiveStyle: (@escaping (ZLImageView) -> Void) -> ZLImageView {
        super.inactiveStyle
    }
    @available(*, unavailable)
    open override var activeStyle: (@escaping (ZLImageView) -> Void) -> ZLImageView {
        super.activeStyle
    }
    
    @discardableResult
    public func userActive(_ active: Bool) -> Self {
        super.userActive(active) as! Self
    }
    @discardableResult
    public func inactiveStyle(_ style: @escaping (ZLImageView) -> Void) -> Self {
        super.inactiveStyle(style) as! Self
    }
    @discardableResult
    public func activeStyle(_ activeStyle: @escaping (ZLImageView) -> Void) -> Self {
        super.activeStyle(activeStyle) as! Self
    }
    
    @available(*, unavailable)
    open override var tapAction: (@escaping (ZLImageView) -> Void) -> ZLImageView {
        super.tapAction
    }
    
    @discardableResult
    public func tapAction(_ action: @escaping (ZLImageView) -> Void) -> Self {
        super.tapAction(action) as! Self
    }
    
    @available(*, unavailable)
    open override var then: (@escaping (ZLImageView) -> Void) -> ZLImageView {
        super.then
    }
    
    @discardableResult
    public func then(_ then: @escaping (ZLImageView) -> Void) -> Self {
        super.then(then) as! Self
    }
    
    @available(*, unavailable)
    open override var height: (CGFloat) -> ZLImageView {
        super.height
    }
    @available(*, unavailable)
    open override var width: (CGFloat) -> ZLImageView {
        super.width
    }
    @available(*, unavailable)
    open override var size: (CGFloat, CGFloat) -> ZLImageView {
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
    
    @available(*, unavailable)
    open override var url: (Any?, Any?) -> ZLImageView {
        super.url
    }
    @discardableResult
    public func url(_ url: Any?, _ placeholder: Any? = nil) -> Self{
        super.url(url, placeholder) as! Self
    }
}
