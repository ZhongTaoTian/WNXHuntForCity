//
//  WNXUserInfoView.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/15.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WNXUserInfoView : UIView

//便利构造方法
+ (instancetype)userInfoView;

//传入userInfoViewY轴滚动的距离,内部计算顶部的头像位置
- (void)userInfViewScrollOffsetY:(CGFloat)offsetY;

@end
