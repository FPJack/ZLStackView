//
//  ZLImageView.m
//  GMListKit
//
//  Created by admin on 2026/4/22.
//

#import "ZLImageView.h"
#import "ZLButton.h"
#import "ZLLayout.h"
@interface ZLImageView()
@property (nonatomic,assign)BOOL isCircle;
@property (nonatomic,copy)void (^activeStyleBlock)(id );
@property (nonatomic,copy)void (^inactiveStyleBlock)(id );

@end
@implementation ZLImageView

- (ZLImageView * _Nonnull (^)(id _Nonnull))img {
    return ^(id img) {
        self.image = ZLImageFromObj(img);
        return self;
    };
}
- (ZLImageView * _Nonnull (^)(id _Nonnull))hlImg {
    return ^(id img) {
        self.highlightedImage = ZLImageFromObj(img);
        return self;
    };
}
- (ZLImageView * _Nonnull (^)(BOOL))highlight {
    return ^(BOOL highlighted) {
        self.highlighted = highlighted;
        return self;
    };
}
- (ZLImageView * _Nonnull (^)(UIViewContentMode))mode {
    return ^(UIViewContentMode mode) {
        self.contentMode = mode;
        return self;
    };
}
- (instancetype)aspectFit {
    return self.mode(UIViewContentModeScaleAspectFit);
}
- (instancetype)aspectFill {
    return self.mode(UIViewContentModeScaleAspectFill);
}
- (ZLImageView * _Nonnull (^)(CGFloat))corner {
    return ^(CGFloat corner) {
        self.layer.cornerRadius = corner;
        self.layer.masksToBounds = corner > 0;
        return self;
    };
}
- (ZLImageView * _Nonnull (^)(BOOL))circle {
    return ^(BOOL isCircle) {
        if (isCircle == self.isCircle) {
            return self;
        }
        if (isCircle) {
            self.isCircle = isCircle;
            [self setNeedsLayout];
        }else {
            self.layer.cornerRadius = 0;
            self.layer.masksToBounds = NO;
        }
        return self;
    };
}
- (ZLImageView * _Nonnull (^)(CACornerMask))corners {
    return ^(CACornerMask corners) {
        self.layer.maskedCorners = (CACornerMask)corners;
        return self;
    };
}
- (void)updateCircel {
    if (self.isCircle) {
        self.layer.cornerRadius = MIN(self.bounds.size.width, self.bounds.size.height) / 2.0;
        self.layer.masksToBounds = YES;
    }
}
- (ZLImageView * _Nonnull (^)(CGFloat, id _Nonnull))border {
    return ^(CGFloat width, id color) {
        self.layer.borderWidth = width;
        self.layer.borderColor = ZLColorFromObj(color).CGColor;
        return self;
    };
}
- (ZLImageView * _Nonnull (^)(id _Nonnull))bgColor {
    return ^(id color) {
        self.backgroundColor = ZLColorFromObj(color);
        return self;
    };
}

- (ZLImageView * _Nonnull (^)(BOOL))visibility {
    return ^(BOOL visible) {
        self.hidden = !visible;
        return self;
    };
}
- (ZLImageView * _Nonnull (^)(CGFloat))alphaValue {
    return ^(CGFloat alpha) {
        self.alpha = alpha;
        return self;
    };
}
- (ZLImageView * _Nonnull (^)(id  _Nullable,id _Nullable))url {
    return ^(id url,id placeholder) {
        NSURL *urlObj = nil;
        if ([url isKindOfClass:NSURL.class]) urlObj = url;
        if ([url isKindOfClass:NSString.class]) urlObj = [NSURL URLWithString:url];
        if (!url) return self;
        SEL sel = @selector(sd_setImageWithURL:placeholderImage:);
        if ([self respondsToSelector:sel]) {
            [self performSelector:sel withObject:url withObject:ZLImageFromObj(placeholder)];
        }
        return self;
    };
}
- (ZLImageView * _Nonnull (^)(BOOL))userActive {
    return ^(BOOL active) {
        self.userInteractionEnabled = active;
        if (active && self.activeStyleBlock) {
            self.activeStyleBlock(self);
        } else if (!active && self.inactiveStyleBlock) {
            self.inactiveStyleBlock(self);
        }
        return self;
    };
}
- (ZLImageView * _Nonnull (^)(void (^ _Nonnull)(ZLImageView * _Nonnull)))activeStyle {
    return ^(void (^activeStyle)(ZLImageView *imgView)) {
        if (self.userInteractionEnabled && activeStyle) {
            activeStyle(self);
        }
        self.activeStyleBlock = activeStyle;
        return self;
    };
}
- (ZLImageView * _Nonnull (^)(void (^ _Nonnull)(ZLImageView * _Nonnull)))inactiveStyle {
    return ^(void (^inactiveStyle)(ZLImageView *imgView)) {
        if (!self.userInteractionEnabled && inactiveStyle) {
            inactiveStyle(self);
        }
        self.inactiveStyleBlock = inactiveStyle;
        return self;
    };
}
- (ZLImageView * _Nonnull (^)(void (^ _Nonnull)(ZLImageView * _Nonnull)))tapAction {
    return ^(void (^tapAction)(ZLImageView *imgView)) {
        if (tapAction) {
            self.userInteractionEnabled = YES;
            self.zl_layout.tapAction(^(UIView * _Nonnull view) {
                if (tapAction) tapAction(self);
            });
        } else {
            self.userInteractionEnabled = NO;
        }
        return self;
    };
}

- (ZLImageView * _Nonnull (^)(ZLImageView * _Nullable __autoreleasing * _Nullable))assignToPtr {
    return ^(ZLImageView **ptr) {
        if (ptr) *ptr = self;
        return self;
    };
}


- (ZLImageView * _Nonnull (^)(void (^ _Nonnull)(ZLImageView * _Nonnull)))then {
    return ^(void (^then)(ZLImageView *imgView)) {
        if (then) then(self);
        return self;
    };
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateCircel];
}

- (ZLImageView * _Nonnull (^)(CGFloat))height {
    return ^(CGFloat height) {
        self.zl_layout.height(height);
        return self;
    };
}
- (ZLImageView * _Nonnull (^)(CGFloat))width {
    return ^(CGFloat width) {
        self.zl_layout.width(width);
        return self;
    };
}
- (ZLImageView * _Nonnull (^)(CGFloat, CGFloat))size {
    return ^(CGFloat width, CGFloat height) {
        self.zl_layout.size(width, height);
        return self;
    };
}


@end
