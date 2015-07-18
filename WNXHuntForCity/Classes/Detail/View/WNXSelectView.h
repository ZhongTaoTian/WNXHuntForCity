//
//  WNXSelectView.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/5.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  用来处理详情页选着哪一个tableView的View，有两种情况，如果服务器返回的数据中评论为空，就有3个tableView
//  如果返回的评论时空就显示俩个view

#import <UIKit/UIKit.h>

@class WNXSelectView;

@protocol WNXSelectViewDelegate <NSObject>

@optional
//当按钮点击时通知代理
- (void)selectView:(WNXSelectView *)selectView didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to;

- (void)selectView:(WNXSelectView *)selectView didChangeSelectedView:(NSInteger)to;

@end

@interface WNXSelectView : UIView

/** 用来确定是否显示评论列表的 默认是NO，只显示俩个button, 如果是YES就显示3个button */
@property(nonatomic, assign) BOOL isShowComment;

@property(nonatomic, weak) id <WNXSelectViewDelegate> delegate;

+ (instancetype)selectViewWithisShowComment:(BOOL)isShowComment;

//提供给外部一个可以滑动底部line的方法
- (void)lineToIndex:(NSInteger)index;

@end
