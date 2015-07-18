//
//  WNXUnLoginView.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/15.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  当未登录的时候弹出的view，在需要用户登录才可以操作的事件里做判断是否登录,如果没有登陆,弹出这个view，用新浪或者微信SDK登录
//  当用户已经登录了弹出相应的操作

#import <UIKit/UIKit.h>

@interface WNXUnLoginView : UIView

/**
 *  显示未登录view
 *
 *  @param superView 在哪个view上显示
 */
- (void)showUnLoginViewToView:(UIView *)superView;

+ (instancetype)unLoginView;

@end
