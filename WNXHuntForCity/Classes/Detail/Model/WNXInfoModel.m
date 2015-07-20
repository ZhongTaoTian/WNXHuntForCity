//
//  WNXInfoModel.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/7/19.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import "WNXInfoModel.h"

@implementation WNXInfoModel

+ (instancetype)infoModelWithDict:(NSDictionary *)dict
{
    WNXInfoModel *model = [[self alloc] init];
    model.title = dict[@"title"];
    model.subTitle = dict[@"subTitle"];
    model.isShowImage = [dict[@"isShowImage"] integerValue];
    return model;
}

@end
