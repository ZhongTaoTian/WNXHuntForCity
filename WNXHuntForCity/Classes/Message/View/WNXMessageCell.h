//
//  WNXMessageCell.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/14.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  消息的cell

#import <UIKit/UIKit.h>
#import "WNXMessageCell.h"
@class WNXMessageCell, WNXMessageModel;

@protocol WNXMessageCellDelete <NSObject>
@optional
//cell的删除按钮被点击了
- (void)messageCell:(WNXMessageCell *)cell didClcikDeleteBtnAtIndexPath:(NSIndexPath *)indexPath;
//cell被点击了 push下一级页面
- (void)messageCell:(WNXMessageCell *)cell didClickAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface WNXMessageCell : UITableViewCell

/** messageCell的数据模型 */
@property (nonatomic, strong) WNXMessageModel *model;

@property (nonatomic, weak) id <WNXMessageCellDelete> delegate;

/** 记录自己是那个一cell, 当内部删除按钮被点击或者白色框被点击时通知外部代理哪一个cell被点击了 */
@property (nonatomic, strong) NSIndexPath *indexPath;

//开始编辑,显示删除按钮
- (void)startEdit;

//结束编辑状态
- (void)endEdit;

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath;

@end
