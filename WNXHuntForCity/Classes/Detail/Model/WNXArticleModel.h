//
//  WNXArticleModel.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/9.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WNXArticleModel : NSObject

/** 浏览次数 */
@property (nonatomic, assign) NSInteger *viewcount;
/** 推荐tableviewcell的数据 */
@property (nonatomic, strong) NSArray *newcontent;
/** 推荐headViewtitle */
@property (nonatomic, copy) NSString *art_title;
/** 作者信息 */
@property (nonatomic, strong) NSDictionary *author_info;



@end
