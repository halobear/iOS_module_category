//
//  UIImageView+Common.h
//  Teamwork
//
//  Created by monkey on 16/3/31.
//  Copyright © 2016年 刘～丹. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Common)

- (void)doCircleFrame;
- (void)doNotCircleFrame;
- (void)doBorderWidth:(CGFloat)width color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius;

@end
