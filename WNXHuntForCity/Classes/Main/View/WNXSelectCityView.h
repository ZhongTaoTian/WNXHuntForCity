//
//  WNXSelectCityView.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/6/30.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WNXCityButton, WNXMenuButton;
typedef void(^cictyChange)(NSString *cictyName);

@interface WNXSelectCityView : UIView

//修改城市时调用，当按钮被点击时调用
@property (nonatomic, strong)cictyChange changeCictyName;

//根据传入按钮初始化selectView
+ (instancetype)selectCityViewWithCictyButton:(WNXCityButton *)cicytBtn;

//+ (instancetype)sharedSeletCityViewWithCictyButton:(WNXCityButton *)cicytBtn;

/**
 *  显示selectView
 *
 *  @param superView    添加到哪个父控件
 *  @param belowSubview 在哪个子控件后面
 */
- (void)showSelectViewToView:(UIView *)superView belowSubview:(UIView *)belowSubview;

/**
 *  销毁selectView
 */
- (void)hideSelectView;

@end
