//
//  WNXSelecButton.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/7/5.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import "WNXSelecButton.h"

@implementation WNXSelecButton

- (void)setHighlighted:(BOOL)highlighted{}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGRect rect = CGRectMake(contentRect.origin.x + 2, contentRect.origin.y + 2, contentRect.size.width - 4, contentRect.size.height - 4);
    
    return rect;
}

@end
