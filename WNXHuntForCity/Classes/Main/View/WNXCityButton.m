//
//  WNXCityButton.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/6/30.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import "WNXCityButton.h"

@implementation WNXCityButton

- (void)setHighlighted:(BOOL)highlighted{}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat imageX = self.bounds.size.width / 2 + 20;
    self.imageView.frame = CGRectMake(imageX, self.imageView.frame.origin.y, self.imageView.frame.size.width, self.imageView.bounds.size.height);
    
    CGFloat titleX = self.bounds.size.width / 2 - 20;
    self.titleLabel.frame = CGRectMake(titleX, self.titleLabel.frame.origin.y, self.titleLabel.frame.size.width, self.titleLabel.bounds.size.height);
}

@end
