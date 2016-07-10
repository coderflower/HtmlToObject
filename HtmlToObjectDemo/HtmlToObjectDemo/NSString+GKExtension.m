//
//  NSString+GKExtension.m
//  爱鲜蜂
//
//  Created by 花菜ChrisCai on 2016/7/2.
//  Copyright © 2016年 花菜ChrisCai. All rights reserved.
//

#import "NSString+GKExtension.h"

#import <MobileCoreServices/MobileCoreServices.h>
@implementation NSString (GKExtension)

#pragma mark -
#pragma mark - 计算label文字高度
- (CGSize)gk_sizeWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth
{
    CGRect bounds = [self boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return bounds.size;
}

#pragma mark -
#pragma mark - 字符串截取
- (NSString *)gk_rangeFromeStartString:(NSString *)startString toEndString:(NSString *)endString
{
    NSRange range = [self rangeOfString:startString];
    NSString *string;
    if (range.location != NSNotFound) {
        string = [self substringFromIndex:range.location + range.length];
    }
    
    range = [string rangeOfString:endString];
    if (range.location != NSNotFound) {
        string = [string substringToIndex:range.location];
    }
    return  string;
}

#pragma mark -
#pragma mark - 获取沙盒全路径

- (NSString *)gk_docDir
{
    
    NSString *newStr = [self lastPathComponent];
    
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    NSString *docFile = [docPath stringByAppendingPathComponent:newStr];
    return docFile;
}

#pragma mark -
#pragma mark - 获取caches文件全路径
- (NSString *)gk_cachesDir
{
    
    NSString *newStr = [self lastPathComponent];
    
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    
    NSString *cachesFile = [cachesPath stringByAppendingPathComponent:newStr];
    
    return cachesFile;
    
}

- (NSString *)gk_tempDir
{
    
    NSString *newStr = [self lastPathComponent];
    
    NSString *tepPath = NSTemporaryDirectory();
    
    NSString *tepFile = [tepPath stringByAppendingPathComponent:newStr];
    
    return tepFile;
}

#pragma mark -
#pragma mark - 获取文件类型
+ (NSString *)gk_mimeTypeForFileAtPath:(NSString *)path
{
    if (![[[NSFileManager alloc] init] fileExistsAtPath:path]) {
        return nil;
    }
    
    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge CFStringRef)[path pathExtension], NULL);
    CFStringRef MIMEType = UTTypeCopyPreferredTagWithClass (UTI, kUTTagClassMIMEType);
    CFRelease(UTI);
    if (!MIMEType) {
        return @"application/octet-stream";
    }
    return (__bridge NSString *)(MIMEType);
}

- (NSString *)gk_cleanDecimalPointAndZero
{
    NSMutableString *c = [NSMutableString string];
    NSInteger offset = self.length - 1;
    while (offset > 0) {
        c =[[self substringWithRange:NSMakeRange(offset, 1)] mutableCopy];
        if ([c isEqualToString:@"0"]|| [c isEqualToString:@"."]) {
            offset--;
        }else {
            break;
        }
    }
    return [self substringToIndex:offset + 1];
}

- (BOOL)isValidateMobile {
    
    NSString * phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate * phonePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phonePredicate evaluateWithObject:self];
}

- (BOOL)isValidateEmail {
    
    NSString * emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate * emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailPredicate evaluateWithObject:self];
}

- (BOOL)isValidateLicensePlate {
    
    NSString * licensePlateRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate * licensePlatePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",licensePlateRegex];
    return [licensePlatePredicate evaluateWithObject:self];
}

- (BOOL)isValidateCarModels {
    
    NSString * carModelsRegex = @"^[\u4E00-\u9FFF]+$";
    NSPredicate * carModelsPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carModelsRegex];
    return [carModelsPredicate evaluateWithObject:self];
}

- (BOOL)isValidateUserName {
    
    NSString * userNameRegex = @"^[A-Za-z0-9]{6,20}+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    return [userNamePredicate evaluateWithObject:self];
}

- (BOOL)isValidatePassword {
    
    NSString * passWordRegex = @"^[a-zA-Z0-9]{6,20}+$";
    NSPredicate * passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:self];
}

- (BOOL)isValidateNickname {
    
    NSString * nicknameRegex = @"^[\u4e00-\u9fa5]{4,8}$";
    NSPredicate * nicknamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [nicknamePredicate evaluateWithObject:self];
}

- (BOOL)isValidateIdentityCard {
    
    BOOL flag;
    if (self.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString * identityCardregex = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate * identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",identityCardregex];
    return [identityCardPredicate evaluateWithObject:self];
}
@end
