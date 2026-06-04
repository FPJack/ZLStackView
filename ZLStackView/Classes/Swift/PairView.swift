
import UIKit


public protocol CreatableView: UIView {
    init()
}
open class PairView<F: CreatableView,S: CreatableView>: StackView {
    public lazy var first: F = {
        let view = F()
        addFirst(view)
        return view
    }()
    private func addFirst(_ view: F) {
        super.insertArrangedSubview(view, at: 0)
    }
    public lazy var second: S = {
            let view = S()
            addSecond(view)
            return view
    }()
    private func addSecond(_ view: S) {
        super.addArrangedSubview(view)
    }
    
    
    @discardableResult
    public func minSpacing(_ space: Float) -> Self {
        minSpacing(CGFloat(space), after: first)
        return self
    }
    @discardableResult
    public func maxSpacing(_ space: Float) -> Self {
        maxSpacing(CGFloat(space), after: first)
        return self
    }
    @discardableResult
    public func flexSpacing(_ flexible: Bool = true) -> Self {
        first.flex.isFlexSpace = flexible
        return self
    }
    @discardableResult
    public func firstStart(_ space: Float) -> Self {
        startSpacing(CGFloat(space), for: first)
        return self
    }
    @discardableResult
    public func firstEnd(_ space: Float) -> Self {
        endSpacing(CGFloat(space), for: first)
        return self
    }
    @discardableResult
    public func secondStart(_ space: Float) -> Self {
        startSpacing(CGFloat(space), for: second)
        return self
    }
    @discardableResult
    public func secondEnd(_ space: Float) -> Self {
        endSpacing(CGFloat(space), for: second)
        return self
    }
    
    @discardableResult
    public func firstFlex(_ flex: Int) -> Self {
        setFlex(flex, for: first)
        return self
    }
    @discardableResult
    public func secondFlex(_ flex: Int) -> Self {
        setFlex(flex, for: second)
        return self
    }
    @discardableResult
    public func thenFirst(_ then: @escaping (F) -> Void) -> Self {
        then(first)
        return self
    }
    @discardableResult
    public func thenSecond(_ then: @escaping (S) -> Void) -> Self {
        then(second)
        return self
    }
    
    
    
    @available(*, unavailable)
    open override func addArrangedSubview(_ view: UIView) {
        fatalError("请使用first或second属性添加视图")
    }
    @available(*, unavailable)
    open override func addArrangedSubview(_ view: UIView, layout config: @escaping (UIView, ZLFlexItem) -> Void) {
        fatalError("请使用first或second属性添加视图")
    }
    @available(*, unavailable)
    open override func insertArrangedSubview(_ view: UIView, at stackIndex: UInt) {
         fatalError("请使用first或second属性添加视图")
    }
    @available(*, unavailable)
    open override func removeArrangedSubview(_ view: UIView) {
        fatalError("请使用first或second属性添加视图")
    }
    @available(*, unavailable)
    open override func setCustomSpacing(_ spacing: CGFloat, after arrangedSubview: UIView) {
        fatalError("请使用first或second属性添加视图")
    }
    @available(*, unavailable)
    open override func setCustomMaxSpacing(_ maxSpacing: CGFloat, after arrangedSubview: UIView) {
        fatalError("请使用first或second属性添加视图")
    }
    @available(*, unavailable)
    open override func setCustomMinSpacing(_ minSpacing: CGFloat, after arrangedSubview: UIView) {
        fatalError("请使用first或second属性添加视图")
    }
    
    @available(*, unavailable)
    public override func addView(_ view: any FlexType) -> Self {
        fatalError("请使用first或second属性添加视图")
    
    }
    
    @available(*, unavailable)
    public override func addView(if condition: Bool, _ view: any FlexType) -> Self {
        fatalError("请使用first或second属性添加视图")
    }
    @available(*, unavailable)
    public override func addView(using: @escaping (StackView) -> UIView) -> Self {
        fatalError("请使用first或second属性添加视图")
    }
    @available(*, unavailable)
    override func addViews(with builder: () -> [any StackViewDSL]) {
        fatalError("请使用first或second属性添加视图")
    }
    
    @available(*, unavailable)
    public override func addViews(builder: () -> [any StackViewDSL]) -> Self {
        fatalError("请使用first或second属性添加视图")
    }
    
    @available(*, unavailable)
    public override func addView(_ view: any FlexType, layout: @escaping (UIView, ZLFlexItem) -> Void) -> Self {
        fatalError("请使用first或second属性添加视图")
    }
    @available(*, unavailable)
    public override func addView(if condition: Bool, using: @escaping (StackView) -> UIView) -> Self {
        fatalError("请使用first或second属性添加视图")
    }
}







open class PairLabelView: PairView<Label,Label> {
   
}

open class PairImageView: PairView<ImageView,ImageView> {
    
}

open class PairButtonView: PairView<Button,Button> {
   
}

open class ImgLabelView: PairView<ImageView,Label> {
   
}

open class ImgButtonView: PairView<ImageView,Button> {
    
}

open class ButtonImgView: PairView<Button,ImageView> {
   
}

open class ButtonLabView: PairView<Button,Label> {
    
}

open class LabelImgView: PairView<Label,ImageView> {
   
}

open class LabButtonView: PairView<Label,Button> {
   
}


open class ButtonStackView: PairView<Button,StackView> {
   
}
open class StackViewButton: PairView<StackView,Button> {
   
}
open class PairStackView: PairView<StackView,StackView> {
   
}

