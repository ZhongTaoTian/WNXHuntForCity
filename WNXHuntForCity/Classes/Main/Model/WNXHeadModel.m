//
//  WNXHeadViewModel.m
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/2.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import "WNXHeadModel.h"

@implementation WNXHeadModel

+ (instancetype)headModelWithDict:(NSDictionary *)dict
{
    WNXHeadModel *headModel = [[WNXHeadModel alloc] init];
    headModel.title = dict[@"title"];
    headModel.headColor = dict[@"headColor"];
    headModel.subTitle = dict[@"subTitle"];

    return headModel;
}

@end
