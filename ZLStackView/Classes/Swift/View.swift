//
//  View.swift
//  ZLStackView
//
//  Created by admin on 2026/6/3.
//

import UIKit

open class View: ZLView,CreatableView {

    @available(*, unavailable)
    open override var onInit: (@escaping (ZLBaseView<AnyObject>) -> Void) -> ZLView {
        super.onInit
    }
    @discardableResult
    public func onInit(_ block: @escaping (ZLBaseView<AnyObject>) -> Void) -> Self {
        super.onInit(block) as! Self
    }
    
    @available(*, unavailable)
    open override var userActive: (Bool) -> ZLView {
        super.userActive
    }
    @discardableResult
    public func userActive(_ active: Bool) -> Self {
        super.userActive(active) as! Self
    }
    @available(*, unavailable)
    open override var visibility: (Bool) -> ZLView {
        super.visibility
    }
    @discardableResult
    public func visibility(_ visible: Bool) -> Self {
        super.visibility(visible) as! Self
    }
    
    @available(*, unavailable)
    open override var alphaValue: (CGFloat) -> ZLView {
        super.alphaValue
    }
    @discardableResult
    public func alpha(_ alpha: CGFloat) -> Self {
        super.alphaValue(alpha) as! Self
    }
    
    @available(*, unavailable)
    open override var bgColor: (Any) -> ZLView {
        super.bgColor
    }
    @discardableResult
    public func bgColor(_ color: Any) -> Self {
         super.bgColor(color) as! Self
    }
    
    @available(*, unavailable)
    open override var corner: (CGFloat) -> ZLView {
        super.corner
    }
    @discardableResult
    public func corner(_ radius: CGFloat) -> Self {
        super.corner(radius) as! Self
    }
    
    @available(*, unavailable)
    open override var cornerRadii: (CGFloat, CGFloat, CGFloat, CGFloat) -> ZLView {
        super.cornerRadii
    }
    
    @discardableResult
    public func cornerRadii(_ topLeft: CGFloat, _ topRight: CGFloat, _ bottomLeft: CGFloat, _ bottomRight: CGFloat) -> Self {
        super.cornerRadii(topLeft, topRight, bottomLeft, bottomRight) as! Self
    }
    @available(*, unavailable)
    open override var circle: (Bool) -> ZLView {
        super.circle
    }
    @discardableResult
    public func circle(_ circle: Bool) -> Self {
        super.circle(circle) as! Self
    }
    
    
    @available(*, unavailable)
    open override var borderColor: (Any) -> ZLView {
        super.borderColor
    }
    
    @available(*, unavailable)
    open override var borderWidth: (CGFloat) -> ZLView {
        super.borderWidth
    }
    
    @available(*, unavailable)
    open override var border: (CGFloat, Any) -> ZLView {
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
    open override var shColor: (Any) -> ZLView {
        super.shColor
    }
    
    @available(*, unavailable)
    open override var shOffset: (CGFloat, CGFloat) -> ZLView {
        super.shOffset
    }
    
    @available(*, unavailable)
    open override var shOpacity: (CGFloat) -> ZLView {
        super.shOpacity
    }
    @available(*, unavailable)
    open override var shRadius: (CGFloat) -> ZLView {
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
    open override var masksToBounds: (Bool) -> ZLView {
        super.masksToBounds
    }
    
    @discardableResult
    public func masksToBounds(_ masksToBounds: Bool) -> Self {
        super.masksToBounds(masksToBounds) as! Self
    }
    
    @available(*, unavailable)
    open override var gradColors: ([Any]) -> ZLView {
        super.gradColors
    }
    
    @available(*, unavailable)
    open override var gradDirection: (CGPoint, CGPoint) -> ZLView {
        
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
    open override var activeStyle: (@escaping (ZLBaseView<AnyObject>) -> Void) -> ZLView {
        super.activeStyle
    }
    
    @discardableResult
    public func activeStyle(_ activeStyle: @escaping (ZLBaseView<AnyObject>) -> Void) -> Self {
        super.activeStyle(activeStyle) as! Self
    }
    
    @available(*, unavailable)
    open override var inactiveStyle: (@escaping (ZLBaseView<AnyObject>) -> Void) -> ZLView {
        super.inactiveStyle
    }
    
    @discardableResult
    public func inactiveStyle(_ inactiveStyle: @escaping (ZLBaseView<AnyObject>) -> Void) -> Self {
        super.inactiveStyle(inactiveStyle) as! Self
    }
    
    @available(*, unavailable)
    open override var then: (@escaping (ZLBaseView<AnyObject>) -> Void) -> ZLView {
        super.then
    }
    
    
    
    @available(*, unavailable)
    open override var height: (CGFloat) -> ZLView {
        super.height
    }
    @available(*, unavailable)
    open override var width: (CGFloat) -> ZLView {
        super.width
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
    open override var addTo: (UIView) -> ZLView {
        super.addTo
    }
    @discardableResult
    public func addTo(_ superView: UIView) -> Self {
        super.addTo(superView) as! Self
    }
    
    @available(*, unavailable)
    open override var addToFull: (UIView) -> ZLView {
        super.addToFull
    }
    @discardableResult
    public func addToFull(_ superView: UIView) -> Self {
        super.addToFull(superView) as! Self
    }
    
    @available(*, unavailable)
    open override var addSubview: (UIView) -> ZLView {
        super.addSubview
    }
    @discardableResult
    public func addSubview(_ subView: UIView) -> Self {
        super.addSubview(subView) as! Self
    }
    
    @available(*, unavailable)
    open override var addSubviewLayout: (UIView, @escaping (ZLBaseView<AnyObject>, UIView) -> Void) -> ZLView {
        super.addSubviewLayout
    }
    
    @discardableResult
    public func addSubview(_ subView: UIView, layout: @escaping (ZLBaseView<AnyObject>, UIView) -> Void) -> Self {
        super.addSubviewLayout(subView, layout) as! Self
    }
}

open class WrapperView: ZLWrapperView {
    @available(*, unavailable)
    open override var insets: (CGFloat, CGFloat, CGFloat, CGFloat) -> ZLWrapperView {
        super.insets
    }
    @discardableResult
    public func insets(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> Self {
        super.insets(top, left, bottom, right) as! Self
    }
}





private var storageKey: UInt8 = 0
public extension UIView {
     private var zl_storage: NSMutableDictionary {
             if let dict = objc_getAssociatedObject(self, &storageKey) as? NSMutableDictionary {
                 return dict
             }
             let dict = NSMutableDictionary()
             objc_setAssociatedObject(
                 self,
                 &storageKey,
                 dict,
                 .OBJC_ASSOCIATION_RETAIN_NONATOMIC
             )
             return dict
         }
     
   
     private func getView<T: CreatableView>(_ type: T.Type,key: String) -> T {
         if let v = zl_storage[key] as? T {return v}
         let v = T()
         zl_storage[key] = v
         addSubview(v)
         return v
     }
     ///第一组
     var zl_btn: Button {
          getView(Button.self, key: #function)
     }
     
     var zl_lab: Label {
         getView(Label.self, key: #function)
     }
     var zl_imgView: ImageView {
         getView(ImageView.self, key: #function)
     }
     
     var zl_stackView: StackView {
         getView(StackView.self, key: #function)
     }
    
    
     ///第二组
     var zl_altBtn: Button {
         getView(Button.self, key: #function)

     }
     var zl_altLab: Label {
         getView(Label.self, key: #function)

     }
     var zl_altImgView: ImageView {
         getView(ImageView.self, key: #function)

     }
     var zl_altStackView: StackView {
         getView(StackView.self, key: #function)

     }
     
    
    ///第三组
     var zl_extraBtn: Button {
         getView(Button.self, key: #function)

     }
     var zl_extraLab: Label {
         getView(Label.self, key: #function)

     }
     var zl_extraImgView: ImageView {
         getView(ImageView.self, key: #function)

     }
     var zl_extraStackView: StackView {
         getView(StackView.self, key: #function)

     }
     
     
    
    ///成对view
     var zl_pairLab: PairLabelView {
         getView(PairLabelView.self, key: #function)

     }
     
     var zl_pairImg: PairImageView {
         getView(PairImageView.self, key: #function)

     }
     
     var zl_pairBtn: PairButtonView {
         getView(PairButtonView.self, key: #function)

     }
     
     var zl_pairStackView: PairStackView {
         getView(PairStackView.self, key: #function)

     }
     
     var zl_imgViewLab: ImgLabelView {
         getView(ImgLabelView.self, key: #function)

     }
     
     var zl_imgViewBtn: ImgButtonView {
         getView(ImgButtonView.self, key: #function)

     }
     
     var zl_btnImgView: ButtonImgView {
         getView(ButtonImgView.self, key: #function)

     }
     
     var zl_btnLabel: ButtonLabView {
         getView(ButtonLabView.self, key: #function)

     }
     
     var zl_labelBtn: LabButtonView {
         getView(LabButtonView.self, key: #function)

     }
     
     var zl_labImgView: LabelImgView {
         getView(LabelImgView.self, key: #function)

     }
     
     var zl_wrapView: WrapperView {
         let key = #function
         if let view = zl_storage[key] as? WrapperView {return view}
         let view = WrapperView.wrap(with: self)
         zl_storage[key] = view
         return view
     }
 }

 
