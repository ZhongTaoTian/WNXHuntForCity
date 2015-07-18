//
//  WNXPromptView.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/12.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  提醒用的View

#import <UIKit/UIKit.h>

@interface WNXPromptView : UIView

- (void)showPromptViewToView:(UIView *)superView;

- (void)hidePromptViewToView;

+ (instancetype)promptView;

@end
