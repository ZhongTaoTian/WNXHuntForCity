//
//  WNXHeadViewModel.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/2.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  HeadView的模型属性

#import <Foundation/Foundation.h>

@interface WNXHeadModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIColor *headColor;
@property (nonatomic, copy) NSString *subTitle;

+ (instancetype)headModelWithDict:(NSDictionary *)dict;

@end
