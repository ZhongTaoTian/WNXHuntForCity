//
//  WNXHomeModel.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/20.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WNXHomeCellModel.h"

@interface WNXHomeModel : NSObject

//headView的颜色
@property (nonatomic, copy) NSString *color;
/** headView的title */
@property (nonatomic, copy) NSString *tag_name;
/** headView的subTitle */
@property (nonatomic, copy) NSString *section_count;
/** cell模型 */
@property (nonatomic, strong) NSArray *body;

+ (instancetype)homeModelWithDict:(NSDictionary *)dict;

@end
