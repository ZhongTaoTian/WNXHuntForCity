//
//  WNXDetailRnmdTableHeadView.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/9.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  用于详情页推荐tableview的headView,用来展示作者以及浏览人数的view，点击后回push到作者的详情页

#import <UIKit/UIKit.h>

@interface WNXDetailRnmdTableHeadView : UIView

/** 临时记录自己的导航控制器 ￥￥￥注意这儿必须用weak,如果用strong就循环引用了￥￥￥￥ */
@property (weak, nonatomic) UINavigationController *superNC;

+ (instancetype)detailRnmdTableHeadView;

@end
