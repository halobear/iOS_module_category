//
//  UIImage+Common.h
//  WeddingToB
//
//  Created by 蒋柯 on 15/11/9.
//  Copyright © 2015年 ymonke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

typedef NS_ENUM(NSUInteger, GradientType) {
    GradientTypeTopToBottom = 0,//从上到小
    GradientTypeLeftToRight = 1,//从左到右
    GradientTypeUpleftToLowright = 2,//左上到右下
    GradientTypeUprightToLowleft = 3,//右上到左下
};


@interface UIImage (Common)

+(UIImage *)imageWithColor:(UIColor *)aColor;
+(UIImage *)imageWithColor:(UIColor *)aColor withFrame:(CGRect)aFrame;
-(UIImage*)scaledToSize:(CGSize)targetSize;
-(UIImage*)scaledToSize:(CGSize)targetSize highQuality:(BOOL)highQuality;
-(UIImage*)scaledToMaxSize:(CGSize )size;
+ (UIImage *)gradientColorImageFromColors:(NSArray*)colors gradientType:(GradientType)gradientType imgSize:(CGSize)imgSize;

//生成二维码图片
+(UIImage *)generateTwoCodeImage:(NSString *)code width:(CGFloat)width height:(CGFloat)height;
//生成条形码图片
+(UIImage *)generateBarCodeImage:(NSString *)code width:(CGFloat)width height:(CGFloat)height;
//生成整个屏幕图片
+(UIImage *)getImageWithFullScreenshot;
//生成二维码
-(UIImage*)createCodeImage:(NSString*)url;

+(UIImage *)createViewImage:(UIView *)shareView;


+ (void) imageForAssetUrl: (NSString *) assetUrl
                  success: (void(^)(UIImage *)) successBlock
                     fail: (void(^)(void)) failBlock;

#pragma mark 参数view即我们要截取的控件以及控件上的所有视图
+ (UIImage *)imageFromView:(UIView *)view;

@end
