//
//  WNXShowViewController.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/2.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WNXMapViewController.h"

@class WNXConditionView, WNXRenderBlurView;

@interface WNXShowViewController : UIViewController

/** 显示的tableView */
@property (nonatomic, strong) UITableView *tableView;

/** 顶部的选着条件按钮的View */
@property (nonatomic, strong) WNXConditionView *conditionView;

/** 用来放当前模糊的imageView */
@property (nonatomic, strong) WNXRenderBlurView *blurImageView;

/** 地图的控制器 */
@property (nonatomic, strong) WNXMapViewController *mapVC;

@end
