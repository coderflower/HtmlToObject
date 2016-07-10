//
//  GKTopic.m
//  HtmlToObjectDemo
//
//  Created by 花菜ChrisCai on 2016/7/10.
//  Copyright © 2016年 花菜ChrisCai. All rights reserved.
//

#import "GKTopic.h"
#import "NSString+GKExtension.h"
@implementation GKTopic
+ (NSArray *)topics {
    // 加载html
    NSString * html = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"v2ex" ofType:@"html"] encoding:NSUTF8StringEncoding error:nil];
    
    NSMutableArray *topics = [NSMutableArray array];
    // 设置从哪里开始截取
    NSString * matchingBegin = @"cell from_";
    // 设置截取到哪里
    NSString * mathcingEnd = @"</div>";
    
    NSRange lastRange = NSMakeRange(0, 0);
    
    // 循环截取
    while ((lastRange = [html rangeOfString:matchingBegin options:0 range:NSMakeRange(lastRange.location, html.length - lastRange.location)]).location != NSNotFound) {
        NSRange endRange = [html rangeOfString:mathcingEnd options:0 range:NSMakeRange(lastRange.location, html.length - lastRange.location)];
        if (endRange.location != NSNotFound) {
            // 获取区间内字符串
            NSString *topicString = [html substringWithRange:NSMakeRange(lastRange.location, endRange.location - lastRange.location)];
            // 标签处理
            GKTopic * topic = [self topicWithString:topicString];
            [topics addObject:topic];
            lastRange = endRange;
        }else {
            break;
        }
    }
    return topics;
}

+ (GKTopic *)topicWithString:(NSString *)string {
    GKTopic *topic = [[GKTopic alloc]init];
    // 查找发帖作者
    topic.author = [string gk_rangeFromeStartString:@"<a href=\"/member/" toEndString:@"\">"];
    // 查找用户头像地址
    topic.avatarImageUrl = [string gk_rangeFromeStartString:@"<img src=\"" toEndString:@"\" class=\"avatar\""];
    // 查找帖子id：如：<a href="/t/291493">，帖子id是291493
    topic.id = [string gk_rangeFromeStartString:@"<a href=\"/t/" toEndString:@"\">"];
    // 查找帖子标题
    NSString *fromStr = [NSString stringWithFormat:@"t/%@\">",topic.id];
    topic.title = [string gk_rangeFromeStartString:fromStr toEndString:@"</a>"];
    return topic;
}
@end
