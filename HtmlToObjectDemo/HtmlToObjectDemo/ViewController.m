//
//  ViewController.m
//  HtmlToObjectDemo
//
//  Created by 花菜ChrisCai on 2016/7/10.
//  Copyright © 2016年 花菜ChrisCai. All rights reserved.
//

#import "ViewController.h"
#import "GKTopic.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray * array = [GKTopic topics];
    GKTopic * topic = array[0];
    NSLog(@"avatarImageUrl == %@",topic.avatarImageUrl);
    NSLog(@"title== %@",topic.title);
    NSLog(@"author == %@",topic.author);
    NSLog(@"id == %@",topic.id);

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
