//
//  NSString+GKExtension.h
//  爱鲜蜂
//
//  Created by 花菜ChrisCai on 2016/7/2.
//  Copyright © 2016年 花菜ChrisCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (GKExtension)
/**
 *  根据传进来的字符串计算其高度
 *
 *  @param text     需要计算的文本的内容
 *  @param font     文本所使用的字体
 *  @param maxWidth 最大宽度
 *
 *  @return 文本所占用的尺寸
 */
- (CGSize)gk_sizeWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth;


/**
 *  截取指定范围内的字符串
 *
 *  @param startString 起始位置
 *  @param endString   结束位置
 *
 */
- (NSString *)gk_rangeFromeStartString:(NSString *)startString toEndString:(NSString *)endString;

/**
 *  获取Documents文件夹全路径
 *
 *  @return Documents全路径
 */
- (NSString *)gk_docDir;
/**
 *  获取Caches文件夹全路径
 *
 *  @return Caches全路径
 */
- (NSString *)gk_cachesDir;
/**
 *  获取tmp文件夹全路径
 *
 *  @return tmp全路径
 */
- (NSString *)gk_tempDir;
/**
 *  获取MIMEType
 *
 *  @param path 文件路径
 *
 *  @return MIMEType
 */
+ (NSString *)gk_mimeTypeForFileAtPath:(NSString *)path;
/**
 *  清除字符串小数点末尾的0
 *
 *  @return 新的字符串
 */
- (NSString *)gk_cleanDecimalPointAndZero;


- (BOOL)isValidateMobile;

- (BOOL)isValidateEmail;

- (BOOL)isValidateLicensePlate;

- (BOOL)isValidateCarModels;

- (BOOL)isValidateUserName;

- (BOOL)isValidatePassword;

- (BOOL)isValidateNickname;

- (BOOL)isValidateIdentityCard;

@end
