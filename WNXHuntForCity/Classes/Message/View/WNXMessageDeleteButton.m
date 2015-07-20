//
//  WNXMessageDeleteButton.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/7/14.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  消息页面点击按钮底部弹出的删除全部消息按钮

#import "WNXMessageDeleteButton.h"

@implementation WNXMessageDeleteButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:WNXGolbalGreen];
        [self setTitle:@"清除全部消息" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.hidden = YES;
    }
    
    return self;
}

- (void)showDeleteBtn
{
    self.hidden = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, -self.bounds.size.height);
    }];
}

- (void)hideDeleteBtn
{
    [UIView animateWithDuration:0.3 animations:^{
        self.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}


@end
