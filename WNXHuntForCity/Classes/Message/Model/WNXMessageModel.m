//
//  WNXMessageModel.m
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/14.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import "WNXMessageModel.h"
#import <MJExtension.h>

@implementation WNXMessageModel

+ (instancetype)messageWithDict:(NSDictionary *)dict
{
    WNXMessageModel *model = [[self alloc] init];
    [model setKeyValues:dict];
    
    return model;
}

@end
