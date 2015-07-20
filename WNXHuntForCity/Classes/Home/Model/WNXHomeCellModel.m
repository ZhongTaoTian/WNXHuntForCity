//
//  WNXHomeCellModel.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/7/20.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  首页cell的模型

#import "WNXHomeCellModel.h"
#import <MJExtension.h>

@implementation WNXHomeCellModel

+ (instancetype)cellModelWithDict:(NSDictionary *)dict
{
    WNXHomeCellModel *model = [[self alloc] init];
    [model setKeyValues:dict];
    return model;
}

@end
