//
//  WNXFoundCellModel.m
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/7.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  发现 cell的模型

#import "WNXFoundCellModel.h"

@implementation WNXFoundCellModel

//模型便利构造方法
+ (instancetype)foundCellModelWihtDict:(NSDictionary *)dict
{
    WNXFoundCellModel *model = [[WNXFoundCellModel alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

@end
