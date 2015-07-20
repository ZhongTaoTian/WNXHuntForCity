//
//  WNXHomeCellModel.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/20.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WNXHomeCellModel : NSObject

/** cellTitle */
@property (nonatomic, copy) NSString *section_title;
/** 图片地址 */
@property (nonatomic, copy) NSString *imageURL;
/** 浏览次数 */
@property (nonatomic, copy) NSString *fav_count;
/** 底部名称 */
@property (nonatomic, copy) NSString *poi_name;

+ (instancetype)cellModelWithDict:(NSDictionary *)dict;

@end
