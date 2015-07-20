//
//  WNXCustomNaviView.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/6.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  自定义导航条

#import <UIKit/UIKit.h>
#import "WNXHomeModel.h"

@protocol WNXCustomNaviViewDelegate <NSObject>

/** 返回按钮和分享按钮的点击事件 */
- (void)customNaviViewBackButtonClick:(UIButton *)sender;
- (void)customNaviViewSharedButtonClick:(UIButton *)sender;

@end

@interface WNXCustomNaviView : UIView

@property (nonatomic, strong) WNXHomeModel *headModel;

@property (nonatomic, weak) id <WNXCustomNaviViewDelegate> delegate;

@end
