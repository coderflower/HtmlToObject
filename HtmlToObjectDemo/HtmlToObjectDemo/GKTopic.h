//
//  GKTopic.h
//  HtmlToObjectDemo
//
//  Created by 花菜ChrisCai on 2016/7/10.
//  Copyright © 2016年 花菜ChrisCai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GKTopic : NSObject
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *avatarImageUrl;

+ (NSArray *)topics;
@end
