//
//  ZLImageView.h
//  GMListKit
//
//  Created by admin on 2026/4/22.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
#define ZLImgView [ZLImageView new]
@interface ZLImageView : UIImageView
@property (readonly) ZLImageView* (^img)(id _Nullable image);
///高亮图片
@property (readonly) ZLImageView* (^hlImg)(id _Nullable highlightImage);
///设置高亮状态
@property (readonly) ZLImageView* (^highlight)(BOOL highlighted);
@property (readonly) ZLImageView* (^mode)(UIViewContentMode mode);
- (instancetype)aspectFill;

- (instancetype)aspectFit;

@property (readonly) ZLImageView* (^corner)(CGFloat radius);

@property (readonly) ZLImageView* (^corners)(CACornerMask corners);

@property (readonly) ZLImageView* (^circle)(BOOL isCircel);

@property (readonly) ZLImageView* (^border)(CGFloat width, id _Nullable color);
@property (readonly) ZLImageView* (^bgColor)(id _Nullable color);
@property (readonly) ZLImageView* (^visibility)(BOOL visible);

@property (readonly) ZLImageView* (^alphaValue)(CGFloat alpha);

@property (readonly) ZLImageView* (^url)(id _Nullable url,id _Nullable placeholder);

@property (readonly) ZLImageView* (^assignToPtr)(ZLImageView *_Nullable* _Nullable ptr);


///设置高度
@property (readonly) ZLImageView* (^height)(CGFloat height);
///设置宽度
@property (readonly) ZLImageView* (^width)(CGFloat width);
///同时设置宽高
@property (readonly) ZLImageView* (^size)(CGFloat width,CGFloat height);

///设置userinteractionEnabled
@property (readonly) ZLImageView* (^userActive)(BOOL userInteractionEnabled);
///可点击情况下进行相应配置 userActive(YES) 触发回调
@property (readonly) ZLImageView* (^activeStyle)(void (^)(ZLImageView* view));
///不可点击情况下配置userActive(NO) 触发回调
@property (readonly) ZLImageView* (^inactiveStyle)(void (^)(ZLImageView* view));

///立即触发block回调，适用于需要在初始化时立即配置样式的场景
@property (readonly) ZLImageView* (^then)(void (^)(ZLImageView* view));
///点击事件
@property (readonly) ZLImageView* (^tapAction)(void(^)(ZLImageView*view));

@end


NS_ASSUME_NONNULL_END
