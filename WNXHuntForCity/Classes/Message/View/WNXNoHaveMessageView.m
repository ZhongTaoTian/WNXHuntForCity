//
//  WNXNoHaveMessageView.m
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/15.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  没有消息时候显示的view

#import "WNXNoHaveMessageView.h"

@implementation WNXNoHaveMessageView

- (void)awakeFromNib
{
    self.backgroundColor = WNXColor(239, 239, 244);
}

+ (instancetype)noHaveMessageView
{
    WNXNoHaveMessageView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    view.frame = CGRectMake((WNXAppWidth - 200) / 2, 150, 200, 210);
    return view;
}

@end
