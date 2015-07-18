//
//  WNXHotButton.m
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/17.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import "WNXHotButton.h"

@implementation WNXHotButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib
{
    [self setUp];
}

- (void)setUp
{
    
}

//- (CGRect)titleRectForContentRect:(CGRect)contentRect
//{
//    return CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
//}

@end
