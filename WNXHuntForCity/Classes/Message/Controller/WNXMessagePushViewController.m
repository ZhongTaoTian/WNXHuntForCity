//
//  WNXMessagePushViewController.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/7/14.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  点击消息push出的控制器

#import "WNXMessagePushViewController.h"

@interface WNXMessagePushViewController ()

@end

@implementation WNXMessagePushViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = WNXBackgroundGrayColor;
    
    [self.tableView removeFromSuperview];
    self.conditionView = nil;
    
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"EXP_getNilData_6P"]];
    CGPoint center = self.view.center;
    center.y = center.y - 150;
    imageV.center = center;
    [self.view addSubview:imageV];
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont boldSystemFontOfSize:20];
    label.text = @"没有找到相关推荐";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor grayColor];
    
    CGFloat W = 300;
    CGFloat H = 100;
    CGFloat X = (WNXAppWidth - W) / 2;
    CGFloat y = center.y + 50;
    label.frame = CGRectMake(X, y, W, H);
    [self.view addSubview:label];
    
}




@end
