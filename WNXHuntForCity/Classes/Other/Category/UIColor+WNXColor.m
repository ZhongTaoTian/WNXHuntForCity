//
//  UIColor+WNXColor.m
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/2.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import "UIColor+WNXColor.h"

@implementation UIColor (WNXColor)

+ (instancetype)randColor
{
    CGFloat r = arc4random_uniform(256);
    CGFloat g = arc4random_uniform(256);
    CGFloat b = arc4random_uniform(256);

//    return WNXColor(r, g, b);分类中不要用宏，便于分类的复用性
    return [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:1];
}

@end
