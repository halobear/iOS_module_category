//
//  UIView+Common.h
//  Coding_iOS
//
//  Created by 王 原闯 on 14-8-6.
//  Copyright (c) 2014年 Coding. All rights reserved.
//

#import <UIKit/UIKit.h>
#import<QuartzCore/QuartzCore.h>
//#import "WDActivityIndicatorView.h"
#import "HBDefines.h"

@class EaseLoadingView, EaseBlankPageView;

typedef NS_ENUM(NSInteger, EaseBlankPageType)
{
    EaseBlankPageTypeView = 0,
    EaseBlankPageTypeOrder,//订单
    EaseBlankPageTypeRecharge, //充值记录
    EaseBlankPageTypeClaim, //理赔记录
    EaseBlankPageTypeAddress, //收货地址
    EaseBlankPageTypeCost, //消费记录



};

@interface UIView (Common)

typedef NS_ENUM(NSUInteger, GLButtonEdgeInsetsStyle) {
    GLButtonEdgeInsetsStyleTop, // image在上，label在下
    GLButtonEdgeInsetsStyleLeft, // image在左，label在右
    GLButtonEdgeInsetsStyleBottom, // image在下，label在上
    GLButtonEdgeInsetsStyleRight // image在右，label在左
};

- (void)renYiYuanJiao:(UIView *)view size:(CGSize)size left:(BOOL)left right:(BOOL)right bottomLeft:(BOOL)bottomLeft bottomRight:(BOOL)bottomRight;
-(void)changeRoundingCorners:(UIView *)view size:(CGFloat)size;
-(void)addGradualColor:(NSArray*)colorArr startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;
- (void)layoutButtonWithEdgeInsetsStyle:(GLButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space image:(UIImage*)image btn:(UIButton*)btn;

@property CGPoint origin;
@property CGSize size;

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;

@property (nonatomic, assign) CGFloat originX;
@property (nonatomic, assign) CGFloat originY;


@property CGFloat height;
@property CGFloat width;

@property CGFloat top;
@property CGFloat left;

@property CGFloat bottom;
@property CGFloat right;

@property CGFloat centerX;
@property CGFloat centerY;

- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;

- (UIViewController *)viewController;


//- (void)addBadgeTip:(NSString *)badgeValue withCenterPosition:(CGPoint)center;
//- (void)addBadgeTip:(NSString *)badgeValue;
//- (void)removeBadgeTips;
//-(void)setCenterX:(CGFloat)centerX;
//-(void)setCenterY:(CGFloat)centerY;
- (void)setY:(CGFloat)y;
- (void)setX:(CGFloat)x;
- (void)setHeight:(CGFloat)height;
- (void)setWidth:(CGFloat)width;
- (void)setSize:(CGSize)size;
- (void)addGradientLayerWithColors:(NSArray *)cgColorArray;
- (void)addGradientLayerWithColors:(NSArray *)cgColorArray locations:(NSArray *)floatNumArray startPoint:(CGPoint )aPoint endPoint:(CGPoint)endPoint;
- (void)addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown;
- (void)addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown andColor:(UIColor *)color;
- (void)addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown withLeftSpadding:(float)left withRightSpadding:(float)right;
- (void)addLineUp:(BOOL)hasUp withUpSpadding:(float)up andDown:(BOOL)hasDown  withDownSpadding:(float)dowm;
- (void)removeViewWithTag:(NSInteger)tag;


+ (CGRect)frameWithOutNavTab;
+ (CGRect)frameWithOutNav;
+ (UIViewAnimationOptions)animationOptionsForCurve:(UIViewAnimationCurve)curve;
+ (UIView *)lineViewWithPointYY:(CGFloat)pointY;
+ (UIView *)lineViewWithPointYY:(CGFloat)pointY andColor:(UIColor *)color;


#pragma mark LoadingView
@property (strong, nonatomic) EaseLoadingView *loadingView;
- (void)beginLoading;
- (void)endLoading;

#pragma mark BlankPageView
@property (strong, nonatomic) EaseBlankPageView *blankPageView;
- (void)configBlankPage:(EaseBlankPageType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void(^)(id sender))block;
- (void)configTableBlankPage:(EaseBlankPageType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void (^)(id sender))block;

@end

@interface EaseLoadingView : UIView

@property (strong, nonatomic) UIImageView *loopView, *monkeyView;
@property (assign, nonatomic, readonly) BOOL isLoading;
@property (strong, nonatomic) UIActivityIndicatorView *mWDActivityIndicatorView;

- (void)startAnimating;
- (void)stopAnimating;

@end

@interface EaseBlankPageView : UIView
@property (strong, nonatomic) UIImageView *monkeyView;
@property (strong, nonatomic) UILabel *tipLabel;
@property (strong, nonatomic) UIButton *reloadButton;
@property (copy, nonatomic) void(^reloadButtonBlock)(id sender);
- (void)configWithType:(EaseBlankPageType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void(^)(id sender))block;
@end

