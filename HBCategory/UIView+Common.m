//
//  UIView+Common.m
//  Coding_iOS
//
//  Created by 王 原闯 on 14-8-6.
//  Copyright (c) 2014年 Coding. All rights reserved.
//

#import "UIView+Common.h"
#define kTagBadgeView  1000
#define kTagLineView 1007
#import <objc/runtime.h>

CGPoint CGRectGetCenter(CGRect rect)
{
    CGPoint pt;
    pt.x = CGRectGetMidX(rect);
    pt.y = CGRectGetMidY(rect);
    return pt;
}

CGRect CGRectMoveToCenter(CGRect rect, CGPoint center)
{
    CGRect newrect = CGRectZero;
    newrect.origin.x = center.x-CGRectGetMidX(rect);
    newrect.origin.y = center.y-CGRectGetMidY(rect);
    newrect.size = rect.size;
    return newrect;
}

@implementation UIView (Common)
static char LoadingViewKey, BlankPageViewKey;
- (void)layoutButtonWithEdgeInsetsStyle:(GLButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space image:(UIImage*)image btn:(UIButton*)btn{
    /**
     *  知识点：titleEdgeInsets是title相对于其上下左右的inset，跟tableView的contentInset是类似的，
     *  如果只有title，那它上下左右都是相对于button的，image也是一样；
     *  如果同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。
     */
    
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = image.size.width;
    CGFloat imageHeight = image.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = btn.titleLabel.intrinsicContentSize.width;
        labelHeight = btn.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = btn.titleLabel.frame.size.width;
        labelHeight = btn.titleLabel.frame.size.height;
    }
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    
    switch (style) {
        case GLButtonEdgeInsetsStyleTop:
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
        }
            break;
        case GLButtonEdgeInsetsStyleLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
            break;
        case GLButtonEdgeInsetsStyleBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
        }
            break;
        case GLButtonEdgeInsetsStyleRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
        }
            break;
        default:
            break;
    }
    
    // 4. 赋值
    btn.titleEdgeInsets = labelEdgeInsets;
    btn.imageEdgeInsets = imageEdgeInsets;
}

-(void)addGradualColor:(NSArray*)colorArr startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint{
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = self.bounds;
    gl.startPoint = startPoint;
    gl.endPoint = endPoint;
    gl.cornerRadius = self.layer.cornerRadius;
    gl.colors = @[(__bridge id)((UIColor*)colorArr.lastObject).CGColor,(__bridge id)((UIColor*)colorArr.firstObject).CGColor];
    [self.layer addSublayer:gl];
}

-(void)changeRoundingCorners:(UIView *)view size:(CGFloat)size{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(size, size)]; // UIRectCornerBottomRight通过这个设置
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = view.bounds;
    maskLayer.path = maskPath.CGPath;
    view.layer.mask = maskLayer;
}

- (void)renYiYuanJiao:(UIView *)view size:(CGSize)size left:(BOOL)left right:(BOOL)right bottomLeft:(BOOL)bottomLeft bottomRight:(BOOL)bottomRight {
    
    UIRectCorner Left = 0;
    
    UIRectCorner Right = 0;
    
    UIRectCorner BottomLeft = 0;
    
    UIRectCorner BottomRight = 0;
    
    if (left) {
        
        Left = UIRectCornerTopLeft;
        
    }
    
    if (right) {
        
        Right = UIRectCornerTopRight;;
        
    }
    
    if (bottomLeft) {
        
        BottomLeft = UIRectCornerBottomLeft;
        
    }
    
    if (bottomRight) {
        
        BottomRight = UIRectCornerBottomRight;
        
    }
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:Left|Right|BottomLeft|BottomRight cornerRadii:size];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    
    maskLayer.frame = view.bounds;
    
    maskLayer.path = maskPath.CGPath;
    
    view.layer.mask = maskLayer;
    
}

- (CGPoint) origin
{
    return self.frame.origin;
}

- (void) setOrigin: (CGPoint) aPoint
{
    CGRect newframe = self.frame;
    newframe.origin = aPoint;
    self.frame = newframe;
}

-(CGFloat)originX
{
    return self.frame.origin.x;
}

-(void)setOriginX:(CGFloat)originX
{
    CGRect frame = self.frame;
    frame.origin.x = originX;
    self.frame = frame;

}

-(CGFloat)originY
{
    return self.frame.origin.y;
}


-(void)setOriginY:(CGFloat)originY
{
    CGRect frame = self.frame;
    frame.origin.y = originY;
    self.frame = frame;

}

- (CGSize) size
{
    return self.frame.size;
}

- (void) setSize: (CGSize) aSize
{
    CGRect newframe = self.frame;
    newframe.size = aSize;
    self.frame = newframe;
}

// Query other frame locations
- (CGPoint) bottomRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint) bottomLeft
{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint) topRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y;
    return CGPointMake(x, y);
}


// Retrieve and set height, width, top, bottom, left, right
- (CGFloat) height
{
    return self.frame.size.height;
}

- (void) setHeight: (CGFloat) newheight
{
    CGRect newframe = self.frame;
    newframe.size.height = newheight;
    self.frame = newframe;
}

- (CGFloat) width
{
    return self.frame.size.width;
}

- (void) setWidth: (CGFloat) newwidth
{
    CGRect newframe = self.frame;
    newframe.size.width = newwidth;
    self.frame = newframe;
}

- (CGFloat) top
{
    return self.frame.origin.y;
}

- (void) setTop: (CGFloat) newtop
{
    CGRect newframe = self.frame;
    newframe.origin.y = newtop;
    self.frame = newframe;
}

- (CGFloat) left
{
    return self.frame.origin.x;
}

- (void) setLeft: (CGFloat) newleft
{
    CGRect newframe = self.frame;
    newframe.origin.x = newleft;
    self.frame = newframe;
}

- (CGFloat) bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void) setBottom: (CGFloat) newbottom
{
    CGRect newframe = self.frame;
    newframe.origin.y = newbottom - self.frame.size.height;
    self.frame = newframe;
}

- (CGFloat) right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void) setRight: (CGFloat) newright
{
    CGFloat delta = newright - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta ;
    self.frame = newframe;
}



-(void)setCenterX:(CGFloat)centerX
{
    CGPoint tempP =self.center;
    tempP.x = centerX;
    self.center = tempP;
}

-(CGFloat)centerX
{
    return self.center.x;
}

-(void)setCenterY:(CGFloat)centerY
{
    CGPoint tempP = self.center;
    tempP.y = centerY;
    self.center = tempP;
}

-(CGFloat)centerY
{
    return self.center.y;
}


// Move via offset
- (void) moveBy: (CGPoint) delta
{
    CGPoint newcenter = self.center;
    newcenter.x += delta.x;
    newcenter.y += delta.y;
    self.center = newcenter;
}

// Scaling
- (void) scaleBy: (CGFloat) scaleFactor
{
    CGRect newframe = self.frame;
    newframe.size.width *= scaleFactor;
    newframe.size.height *= scaleFactor;
    self.frame = newframe;
}

// Ensure that both dimensions fit within the given size by scaling down
- (void) fitInSize: (CGSize) aSize
{
    CGFloat scale;
    CGRect newframe = self.frame;
    
    if (newframe.size.height && (newframe.size.height > aSize.height))
    {
        scale = aSize.height / newframe.size.height;
        newframe.size.width *= scale;
        newframe.size.height *= scale;
    }
    
    if (newframe.size.width && (newframe.size.width >= aSize.width))
    {
        scale = aSize.width / newframe.size.width;
        newframe.size.width *= scale;
        newframe.size.height *= scale;
    }
    
    self.frame = newframe;	
}

//获取当前控制器
- (UIViewController *)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

//badge
//- (void)addBadgeTip:(NSString *)badgeValue withCenterPosition:(CGPoint)center{
//    if (!badgeValue || !badgeValue.length) {
//        [self removeBadgeTips];
//    }else{
//        UIView *badgeV = [self viewWithTag:kTagBadgeView];
//        if (badgeV && [badgeV isKindOfClass:[UIBadgeView class]]) {
//            [(UIBadgeView *)badgeV setBadgeValue:badgeValue];
//            badgeV.hidden = NO;
//        }else{
//            badgeV = [UIBadgeView viewWithBadgeTip:badgeValue];
//            badgeV.tag = kTagBadgeView;
//            [self addSubview:badgeV];
//        }
//        [badgeV setCenter:center];
//    }
//}
//- (void)addBadgeTip:(NSString *)badgeValue{
//    if (!badgeValue || !badgeValue.length) {
//        [self removeBadgeTips];
//    }else{
//        UIView *badgeV = [self viewWithTag:kTagBadgeView];
//        if (badgeV && [badgeV isKindOfClass:[UIBadgeView class]]) {
//            [(UIBadgeView *)badgeV setBadgeValue:badgeValue];
//        }else{
//            badgeV = [UIBadgeView viewWithBadgeTip:badgeValue];
//            badgeV.tag = kTagBadgeView;
//            [self addSubview:badgeV];
//        }
//        CGSize badgeSize = badgeV.frame.size;
//        CGSize selfSize = self.frame.size;
//        CGFloat offset = 2.0;
//        [badgeV setCenter:CGPointMake(selfSize.width- (offset+badgeSize.width/2),
//                                      (offset +badgeSize.height/2))];
//    }
//}
//- (void)removeBadgeTips{
//    NSArray *subViews =[self subviews];
//    if (subViews && [subViews count] > 0) {
//        for (UIView *aView in subViews) {
//            if (aView.tag == kTagBadgeView && [aView isKindOfClass:[UIBadgeView class]]) {
//                aView.hidden = YES;
//            }
//        }
//    }
//}

//set frame
- (void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
//- (void)setHeight:(CGFloat)height{
//    CGRect frame = self.frame;
//    frame.size.height = height;
//    self.frame = frame;
//}
//- (void)setWidth:(CGFloat)width{
//    CGRect frame = self.frame;
//    frame.size.width = width;
//    self.frame = frame;
//}
//- (void)setSize:(CGSize)size{
//    CGRect frame = self.frame;
//    frame.size.width = size.width;
//    frame.size.height = size.height;
//    self.frame = frame;
//}
- (void)addGradientLayerWithColors:(NSArray *)cgColorArray{
    [self addGradientLayerWithColors:cgColorArray locations:nil startPoint:CGPointMake(0.0, 0.5) endPoint:CGPointMake(1.0, 0.5)];
}

- (void)addGradientLayerWithColors:(NSArray *)cgColorArray locations:(NSArray *)floatNumArray startPoint:(CGPoint )startPoint endPoint:(CGPoint)endPoint{
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = self.bounds;
    if (cgColorArray && [cgColorArray count] > 0) {
        layer.colors = cgColorArray;
    }else{
        return;
    }
    if (floatNumArray && [floatNumArray count] == [cgColorArray count]) {
        layer.locations = floatNumArray;
    }
    layer.startPoint = startPoint;
    layer.endPoint = endPoint;
    [self.layer addSublayer:layer];
}




+ (CGRect)frameWithOutNavTab{
    CGRect frame = kScreen_Bounds;
    frame.size.height -= (20+44+49);//减去状态栏、导航栏、Tab栏的高度
    return frame;
}
+ (CGRect)frameWithOutNav{
    CGRect frame = kScreen_Bounds;
    frame.size.height -= (20+44);//减去状态栏、导航栏的高度
    return frame;
}

+ (UIViewAnimationOptions)animationOptionsForCurve:(UIViewAnimationCurve)curve
{
    switch (curve) {
        case UIViewAnimationCurveEaseInOut:
            return UIViewAnimationOptionCurveEaseInOut;
            break;
        case UIViewAnimationCurveEaseIn:
            return UIViewAnimationOptionCurveEaseIn;
            break;
        case UIViewAnimationCurveEaseOut:
            return UIViewAnimationOptionCurveEaseOut;
            break;
        case UIViewAnimationCurveLinear:
            return UIViewAnimationOptionCurveLinear;
            break;
    }
    
    return kNilOptions;
}

+ (UIView *)lineViewWithPointYY:(CGFloat)pointY{
    return [UIView lineViewWithPointYY:pointY andColor:kLineColor_gray];
}

+ (UIView *)lineViewWithPointYY:(CGFloat)pointY andColor:(UIColor *)color{
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, pointY, kScreen_Width, 0.5)];
    lineView.backgroundColor = color;
    return lineView;
}

+ (UIView *)lineViewWithPointYY:(CGFloat)pointY andColor:(UIColor *)color andLeft:(float)left andRight:(float)right{
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(left, pointY, kScreen_Width-left-right, 0.5)];
    lineView.backgroundColor = color;
    return lineView;
}

- (void)addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown{
    [self addLineUp:hasUp andDown:hasDown andColor:kLineColor_gray withLeftSpadding:0 withRightSpadding:0];
}

- (void)addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown andColor:(UIColor *)color{
    [self removeViewWithTag:kTagLineView];
    if (hasUp) {
        UIView *upView  = [UIView lineViewWithPointYY:0 andColor:color andLeft:0 andRight:0];
        upView.tag = kTagLineView;
        [self addSubview:upView];
    }
    if (hasDown) {
        UIView *downView = [UIView lineViewWithPointYY:CGRectGetMaxY(self.bounds)-0.5 andColor:color andLeft:0 andRight:0];
        downView.tag = kTagLineView;
        [self addSubview:downView];
    }
}
- (void)addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown withLeftSpadding:(float)left withRightSpadding:(float)right{
    [self addLineUp:hasUp andDown:hasDown andColor:kLineColor_gray withLeftSpadding:left withRightSpadding:right];
}

- (void)addLineUp:(BOOL)hasUp withUpSpadding:(float)up andDown:(BOOL)hasDown  withDownSpadding:(float)dowm{
    [self addLineUp:hasUp andDown:hasDown andColor:kLineColor_gray withUpSpadding:up withDowmSpadding:dowm];
}


- (void)addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown andColor:(UIColor *)color withLeftSpadding:(float)left withRightSpadding:(float)right{
    [self removeViewWithTag:kTagLineView];
    if (hasUp) {
        UIView *upView  = [UIView lineViewWithPointYY:0 andColor:color andLeft:left andRight:right];
        upView.tag = kTagLineView;
        [self addSubview:upView];
    }
    if (hasDown) {
        UIView *downView = [UIView lineViewWithPointYY:CGRectGetMaxY(self.bounds)-0.5 andColor:color andLeft:left andRight:right];
        downView.tag = kTagLineView;
        [self addSubview:downView];
    }
}


- (void)addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown andColor:(UIColor *)color withUpSpadding:(float)up withDowmSpadding:(float)dowm{
    [self removeViewWithTag:kTagLineView];
    if (hasUp) {
        UIView *upView  = [UIView lineViewWithPointYY:0 andColor:color andLeft:up andRight:0];
        upView.tag = kTagLineView;
        [self addSubview:upView];
    }
    if (hasDown) {
        UIView *downView = [UIView lineViewWithPointYY:CGRectGetMaxY(self.bounds)-0.5 andColor:color andLeft:dowm andRight:0];
        downView.tag = kTagLineView;
        [self addSubview:downView];
    }
}

- (void)removeViewWithTag:(NSInteger)tag{
    for (UIView *aView in [self subviews]) {
        if (aView.tag == tag) {
            [aView removeFromSuperview];
        }
    }
}


#pragma mark LoadingView
- (void)setLoadingView:(EaseLoadingView *)loadingView{
    [self willChangeValueForKey:@"LoadingViewKey"];
    objc_setAssociatedObject(self, &LoadingViewKey,
                             loadingView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"LoadingViewKey"];
}
- (EaseLoadingView *)loadingView{
    return objc_getAssociatedObject(self, &LoadingViewKey);
}

- (void)beginLoading{
    for (UIView *aView in [self.blankPageContainer subviews]) {
        if ([aView isKindOfClass:[EaseBlankPageView class]] && !aView.hidden) {
            return;
        }
    }
    if (!self.loadingView) {
        EaseLoadingView *view = [[EaseLoadingView alloc] initWithFrame:self.bounds];
        self.loadingView = view;
    }
    [self addSubview:self.loadingView];
    [self.loadingView startAnimating];
}

- (void)endLoading{
    if (self.loadingView) {
        [self.loadingView stopAnimating];
    }
}

#pragma mark BlankPageView
- (void)setBlankPageView:(EaseBlankPageView *)blankPageView{
    [self willChangeValueForKey:@"BlankPageViewKey"];
    objc_setAssociatedObject(self, &BlankPageViewKey,
                             blankPageView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"BlankPageViewKey"];
}

- (EaseBlankPageView *)blankPageView{
    return objc_getAssociatedObject(self, &BlankPageViewKey);
}


- (void)configTableBlankPage:(EaseBlankPageType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void (^)(id))block{
    if (hasData) {
        if (self.blankPageView) {
            self.blankPageView.hidden = YES;
            [self.blankPageView removeFromSuperview];
        }
    }else{
        if (!self.blankPageView) {
            EaseBlankPageView *view = [[EaseBlankPageView alloc] initWithFrame:self.bounds];
            self.blankPageView = view;
        }
        self.blankPageView.hidden = NO;
        [self.tableBlankPageContainer insertSubview:self.blankPageView atIndex:0];
        [self.blankPageView configWithType:blankPageType hasData:hasData hasError:hasError reloadButtonBlock:block];
    }
}


- (void)configBlankPage:(EaseBlankPageType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void (^)(id))block{
    if (hasData) {
        if (self.blankPageView) {
            self.blankPageView.hidden = YES;
            [self.blankPageView removeFromSuperview];
        }
    }else{
        if (!self.blankPageView) {
            EaseBlankPageView *view = [[EaseBlankPageView alloc] initWithFrame:self.bounds];
            self.blankPageView = view;
        }
        self.blankPageView.hidden = NO;
        [self.blankPageContainer insertSubview:self.blankPageView atIndex:0];
        [self.blankPageView configWithType:blankPageType hasData:hasData hasError:hasError reloadButtonBlock:block];
    }
}

//只隐藏tableview
- (UIView *)tableBlankPageContainer{
    UIView *blankPageContainer = self;
    for (UIView *aView in [self subviews]) {
        if ([aView isKindOfClass:[UITableView class]]) {
            blankPageContainer = aView;
            [aView addSubview:self.blankPageView];
            [aView sendSubviewToBack:self.blankPageView];
        }
    }
    return blankPageContainer;
}

//隐藏所有view
- (UIView *)blankPageContainer{
    UIView *blankPageContainer = self;
    for (UIView *aView in [self subviews]) {
        if ([aView isKindOfClass:[UITableView class]]) {
            blankPageContainer = aView;
            [aView addSubview:self.blankPageView];
            [aView sendSubviewToBack:self.blankPageView];
        }else
        {
            aView.hidden = YES;
        }
    }
    return blankPageContainer;
}

@end

@implementation EaseLoadingView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _loopView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image_progressbar"]];
        [_loopView setCenter:self.center];
        [self addSubview:_loopView];
    }
    return self;
}

- (void)startAnimating{
    self.hidden = NO;
    if (_isLoading) {
        return;
    }
    _isLoading = YES;
    [self loadingAnimation];
}

- (void)stopAnimating{
//    [self dismissProgressHud];
    self.hidden = YES;
    _isLoading = NO;
}

- (void)loadingAnimation{

//    [self show];
}

@end

@implementation EaseBlankPageView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)configWithType:(EaseBlankPageType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void (^)(id))block{

    if (hasData) {
        [self removeFromSuperview];
        return;
    }
    self.alpha = 1.0;
    static CGFloat contentWidth = 250.0, contentHeight = 300.0;
    CGFloat maxWidth = CGRectGetWidth(self.bounds), maxHeight = CGRectGetHeight(self.bounds);
//    图片
    if (!_monkeyView) {
        _monkeyView = [[UIImageView alloc] initWithFrame:CGRectMake((maxWidth - contentWidth)/2, (maxHeight - contentHeight)/2, contentWidth, 200)];
        _monkeyView.contentMode = UIViewContentModeCenter;
        [self addSubview:_monkeyView];
    }
//    文字
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] initWithFrame:CGRectMake((maxWidth - contentWidth)/2, CGRectGetMaxY(_monkeyView.frame)-60, contentWidth, 50)];
        _tipLabel.backgroundColor = [UIColor clearColor];
        _tipLabel.numberOfLines = 0;
        _tipLabel.font = [UIFont systemFontOfSize:14];
        _tipLabel.textColor = [UIColor lightGrayColor];
        _tipLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_tipLabel];
    }
    
    _reloadButtonBlock = nil;
    if (hasError) {
//        加载失败
        if (!_reloadButton) {
            _reloadButton = [[UIButton alloc] initWithFrame:CGRectMake((maxWidth -160)/2, CGRectGetMaxY(_tipLabel.frame), 160, 60)];
            [_reloadButton setImage:[UIImage imageNamed:@"blankpage_button_reload"] forState:UIControlStateNormal];
            _reloadButton.adjustsImageWhenHighlighted = YES;
            [_reloadButton addTarget:self action:@selector(reloadButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:_reloadButton];
        }
        _reloadButton.hidden = NO;
        _reloadButtonBlock = block;
        [_monkeyView setImage:[UIImage imageNamed:@"blankpage_image_loadFail"]];
        _tipLabel.text = @"貌似出了点差错\n真忧伤呢";
    }else{
//        空白数据
        if (_reloadButton) {
            _reloadButton.hidden = YES;
        }
        NSString *imageName, *tipStr;
        switch (blankPageType) {
            case EaseBlankPageTypeOrder:
            {
                imageName = @"img_remind";
                tipStr = @"您还没有任何订单";
            }
                break;
            case EaseBlankPageTypeRecharge:
            {
                imageName = @"img_remind";
                tipStr = @"您还没有充值记录";
            }
                break;
                
            case EaseBlankPageTypeView:
            {
                imageName = @"img_remind";
                tipStr = @"购物车里面什么都没有\n赶快去买点花吧";
            }
                break;
                
            case EaseBlankPageTypeClaim:
            {
                imageName = @"img_remind";
                tipStr = @"您还没有任何理赔记录";
            }
                break;
                
            case EaseBlankPageTypeAddress:
            {
                imageName = @"img_remind";
                tipStr = @"您还没有收货地址哦\n赶紧来添加吧";
            }
                break;
            case EaseBlankPageTypeCost:
            {
                imageName = @"img_remind";
                tipStr = @"您还没有消费记录";
            }
                break;
            default:
            {
                imageName = @"img_remind";
                tipStr = @"购物车里面什么都没有\n赶快去买点花吧";
            }
                break;
        }
        [_monkeyView setImage:[UIImage imageNamed:imageName]];
        _tipLabel.text = tipStr;
    }
}

- (void)reloadButtonClicked:(id)sender{
    self.hidden = YES;
    [self removeFromSuperview];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (_reloadButtonBlock) {
            _reloadButtonBlock(sender);
        }
    });
}



@end










