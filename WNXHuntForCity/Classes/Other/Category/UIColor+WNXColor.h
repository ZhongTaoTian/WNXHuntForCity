//
//  UIColor+WNXColor.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/2.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (WNXColor)

/**
 返回随机颜色
 */
+ (instancetype)randColor;

/**
 *  将16进制字符串转换成UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
