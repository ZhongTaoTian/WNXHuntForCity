//
//  WNXConditionView.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/7.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  选择查询条件的View (分类，地区，排序，地图)

#import <UIKit/UIKit.h>
@class WNXMenuButton, WNXConditionView;

//选择查询按钮类型
typedef NS_ENUM(NSInteger, WNXConditionButtonType) {
    WNXConditionButtonTypeClassify = 10,
    WNXConditionButtonTypeArea = 11,
    WNXConditionButtonTypeSort = 12,
    WNXConditionButtonTypeMap = 13,
    WNXConditionButtonTypeList = 14
};

@protocol WNXConditionViewDelegate <NSObject>

@optional
//代理方法，按钮点击出发
/** 点击前三个按钮触发代理事件 */
- (void)conditionView:(WNXConditionView *)view didButtonClickFrom:(WNXConditionButtonType)from to:(WNXConditionButtonType)to;

/** 点击了地图按钮，显示地图 */
- (void)conditionViewdidSelectedMap:(WNXConditionView *)view;

/** 点击了列表按钮 移除地图View */
- (void)conditionViewdidSelectedList:(WNXConditionView *)view;

/** 取消选择按钮 */
- (void)conditionViewCancelSelectButton:(WNXConditionView *)view;

@end

@interface WNXConditionView : UIView

@property (nonatomic, weak) id <WNXConditionViewDelegate> delegate;

/**
 *  取消所有按钮的选中状态
 */
- (void)cancelSelectedAllButton;

@end
