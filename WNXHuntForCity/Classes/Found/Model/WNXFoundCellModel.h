//
//  WNXFoundCellModel.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/7.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  发现 cell的模型

#import <Foundation/Foundation.h>

@interface WNXFoundCellModel : NSObject

/** 图片名 */
@property (nonatomic, copy) NSString *icon;

/** 标题 */
@property (nonatomic, copy) NSString *title;

/** 副标题 */
@property (nonatomic, copy) NSString *subTitle;

+ (instancetype)foundCellModelWihtDict:(NSDictionary *)dict;

@end
