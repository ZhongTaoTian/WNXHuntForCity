//
//  WNXSearchTextField.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/7/3.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  搜索TextFiled

#import "WNXSearchTextField.h"

@implementation WNXSearchTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.placeholder = @"搜索";
        self.font = [UIFont systemFontOfSize:16];

        UIImage *image = [UIImage imageNamed:@"GroupCell"];
        self.background = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
        self.clearButtonMode = UITextFieldViewModeAlways;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 5;

        //设置文边框左边专属View
        UIImageView *leftView = [[UIImageView alloc] init];
        leftView.bounds = CGRectMake(0, 0, 35, 35);
//        leftView.contentMode = UIViewContentModeCenter;

        leftView.image = [UIImage imageNamed:@"searchm"];
        
        self.leftView = leftView;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    
    return self;
}

@end
