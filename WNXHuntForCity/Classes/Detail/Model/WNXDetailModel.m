//
//  WNXDetailModel.m
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/9.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  详情页的数据模型

#import "WNXDetailModel.h"
#import "WNXArticleModel.h"
#import <MJExtension.h>

@implementation WNXDetailModel

+ (instancetype)detailModelWith:(NSDictionary *)dict
{
    WNXDetailModel *detail = [[self alloc] init];

    [detail setKeyValues:dict];

    return detail;
}


@end
