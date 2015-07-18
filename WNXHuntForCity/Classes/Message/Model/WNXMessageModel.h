//
//  WNXMessageModel.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/14.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WNXMessageModel : NSObject

@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *message;

/* cell的高度 */
@property (nonatomic, assign) CGFloat cellHeight;

+ (instancetype)messageWithDict:(NSDictionary *)dict;

@end
