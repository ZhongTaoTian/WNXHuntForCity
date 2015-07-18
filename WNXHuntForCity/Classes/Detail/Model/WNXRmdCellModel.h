//
//  WNXRmdCellModel.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/11.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  推荐每个对应的cell的模型，城觅服务器返回的数据真心乱

#import <Foundation/Foundation.h>

@interface WNXRmdCellModel : NSObject

//文字
@property (nonatomic, copy) NSString *ch;
//图片地址str
@property (nonatomic, copy) NSString *pic;

/** 记录文字cell的高度 */
@property (nonatomic, assign) CGFloat cellHeight;

+ (instancetype)rmdCellModelWithDict:(NSDictionary *)dict;

@end
