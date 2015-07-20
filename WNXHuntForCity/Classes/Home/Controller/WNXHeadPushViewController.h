//
//  WNXHeadPushViewController.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/2.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import "WNXShowViewController.h"

#import "WNXHomeModel.h"

@interface WNXHeadPushViewController : WNXShowViewController

//headModel用来设置导航条的属性，在推荐页面push来时直接把headModel正向传值传来,需要注意这里重写set方法赋值的时
//当前控制器的navigationController是空的,无法修改导航条的属性
@property (nonatomic, strong) WNXHomeModel *headModel;

@end
