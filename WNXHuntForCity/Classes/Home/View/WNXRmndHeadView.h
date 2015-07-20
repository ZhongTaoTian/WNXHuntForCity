//
//  WNXRmndHeadView.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/2.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WNXHomeModel.h"

@interface WNXRmndHeadView : UIView

//headView的模型，重写set方法
@property (nonatomic, strong) WNXHomeModel *headMode;
//便利构造方法
+ (instancetype)headViewWith:(WNXHomeModel *)headModel;

@end
