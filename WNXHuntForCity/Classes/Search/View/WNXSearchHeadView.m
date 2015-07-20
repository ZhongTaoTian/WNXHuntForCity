//
//  WNXSearchHeadView.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/7/15.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  搜索页tableView的headView

#import "WNXSearchHeadView.h"

@implementation WNXSearchHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = WNXColor(230, 230, 230);
        
        //添加顶部文字label
        self.headTextLabel = [[UILabel alloc] init];
        self.headTextLabel.textColor = [UIColor lightGrayColor];
        self.headTextLabel.font = [UIFont systemFontOfSize:20];
        self.headTextLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.headTextLabel];
    }
    
    return self;
}

+ (instancetype)headView
{
    WNXSearchHeadView *head = [[self alloc] init];
    
    return head;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //重新布局headView的子控件
    self.headTextLabel.frame = CGRectMake(20, 0, self.bounds.size.width - 20, self.bounds.size.height);
}

@end
