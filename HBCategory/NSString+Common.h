//
//  NSString+Common.h
//  WeddingToB
//
//  Created by 蒋柯 on 15/11/9.
//  Copyright © 2015年 ymonke. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

char pinyinFirstLetter(unsigned short hanzi);

@interface NSString (Common)


- (NSString *)md5Str;  //MD5加密
- (NSString *)emotionSpecailName; //特殊表情判断
- (NSString *)replaceOccurrencesOfString; //去除掉首尾的空白字符和换行字符
- (NSString *)timeFormatted:(NSString *)totalSeconds;
+ (NSString *)getCurrentTimeSp;  //当前时间戳
- (NSString *)firstCharactor:(NSString *)aString;
+ (NSString *)deviceModelName;
+ (NSString *)getTransactionID;
+ (NSString *)getNowTimeTimestamp;
+ (NSString *)createdTimeStr:(NSString *)time;
+ (NSString *)getMD5WithData:(NSData *)data;
- (NSString *)addSeparatorForPriceString:(NSString*)piceStr;//价格添加逗号
- (NSString *)cutBeyondTextInLength:(NSInteger)maxLenth;//递归计算符合规定的文本长度
- (NSString *)getpercentage:(NSInteger)currentPrice allPrice:(NSInteger)allPrice;//计算百分比

//文字宽高计算
- (CGSize)getSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
- (CGSize)getSizeWithFont:(UIFont *)font WithLineSpacing:(CGFloat)lineSpacing constrainedToSize:(CGSize)size;
- (CGFloat)getHeightWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
- (CGFloat)getWidthWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
//图片高度计算
+ (CGFloat)getImageHeightWithOrigin_w:(CGFloat)origin_w origin_h:(CGFloat)origin_h current_w:(CGFloat)current_w;

//自适应位置宽度
- (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;
-(CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width lineHeight:(CGFloat)lineHeight linSpace:(CGFloat)lineSpace;

+ (long)getCurrentTimeChangeSecond:(NSString *)date;

- (BOOL)isContainsEmoji;
- (BOOL)isEmpty;
- (BOOL)boolOnlyOneLinesWithHeight:(CGFloat )height WithLineSpacing:(CGFloat)lineSpacing constrainedToSize:(CGSize)size;
- (BOOL)isValidMobileNumber; //手机号验证
- (BOOL)isValidVerifyCode; //验证码验证
- (BOOL)validateEmail;
+ (BOOL)is_exists_folderName:(NSString*)folderName fileName:(NSString*)fileName;//判断该字体url是否存在 filePath:文件夹路径 fileName：文件名
+ (BOOL)DownloadInvitation_Fonts_url:(NSString*)fonts_url fileName:(NSString*)fileName folderName:(NSString*)folderName;//下载字体 fonts_url：字体url fileName:字体文件名 folderName：存放字体的文件夹名

- (NSArray *)getAllRangeOfString:(NSString *)searchString;

//字典转字符串
+ (NSString *)dictionaryToJSONString:(NSDictionary *)dictionary;
//数组转字符串
+ (NSString *)arrayToJSONString:(NSArray *)array;
//** 字符串转字典 */
+ (NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString;
//image转化为base64字符串
+ (NSString *)image2DataURL:(UIImage *)image;
//获取文件路径 folderName：存放字体的文件夹名
+ (NSString *)getDocumentPath_folderName:(NSString*)folderName;

+(NSAttributedString *)getAttributedStringWithString:(NSString *)string lineSpace:(CGFloat)lineSpace;
+(NSAttributedString *)getAttributedStringWithString:(NSString *)string color:(UIColor*)color font:(UIFont*)font colorRange:(NSRange)colorRange fontRange:(NSRange)fontRange;
+(NSAttributedString *)getAttributedStringWithString:(NSString *)string color:(UIColor*)color font:(UIFont*)font colorRange:(NSRange)colorRange fontRange:(NSRange)fontRange lineSpace:(CGFloat)lineSpace;
+(NSAttributedString *)getAttributedStringWithString:(NSString *)string color:(UIColor*)color font:(UIFont*)font colorRange:(NSRange)colorRange fontRange:(NSRange)fontRange textspace:(CGFloat)space;

/******TencentIm*****/
// 将str加密成本地保存的文件名
+ (NSString *)md5String:(NSString *)str;
- (NSString *)md5;
- (NSString*)firstPinYin;

//是否为空
+ (BOOL)isEmpty:(NSString *)string;

/**
 compare two version
 @param sourVersion *.*.*.*
 @param desVersion *.*.*.*
 @returns No,sourVersion is less than desVersion; YES, the statue is opposed
 */
+ (BOOL)compareVerison:(NSString *)sourVersion withDes:(NSString *)desVersion;

//当前字符串是否只包含空白字符和换行符
- (BOOL)isWhitespaceAndNewlines;

//去除字符串前后的空白,不包含换行符
- (NSString *)trim;

//去除字符串中所有空白
- (NSString *)removeWhiteSpace;
- (NSString *)removeNewLine;

/*!
 @brief     大写第一个字符
 @return    格式化后的字符串
 */
- (NSString *)capitalize;

//以给定字符串开始,忽略大小写
- (BOOL)startsWith:(NSString *)str;
//以指定条件判断字符串是否以给定字符串开始
- (BOOL)startsWith:(NSString *)str Options:(NSStringCompareOptions)compareOptions;


//以给定字符串结束，忽略大小写
- (BOOL)endsWith:(NSString *)str;
//以指定条件判断字符串是否以给定字符串结尾
- (BOOL)endsWith:(NSString *)str Options:(NSStringCompareOptions)compareOptions;

//包含给定的字符串, 忽略大小写
- (BOOL)containsString:(NSString *)str;
//以指定条件判断是否包含给定的字符串
- (BOOL)containsString:(NSString *)str Options:(NSStringCompareOptions)compareOptions;

//判断字符串是否相同，忽略大小写
- (BOOL)equalsString:(NSString *)str;

- (NSString *)emjoiText;

#pragma mark Hashing
#if kSupportGTM64
- (NSString *)base64Encoding;
#endif

- (NSString *)valueOfLabel:(NSString *)label;
- (NSString *)substringAtRange:(NSRange)rang;

// 是否带有表情府
- (NSUInteger)utf8Length;

- (CGSize)textSizeIn:(CGSize)size font:(UIFont *)font;
- (CGSize)textSizeIn:(CGSize)size font:(UIFont *)font breakMode:(NSLineBreakMode)breakMode;
- (CGSize)textSizeIn:(CGSize)size font:(UIFont *)font breakMode:(NSLineBreakMode)breakMode align:(NSTextAlignment)alignment;

@end
