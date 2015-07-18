//
//  WNXSearchHeadView.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/15.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  搜索页tableView的headView

#import <UIKit/UIKit.h>

@interface WNXSearchHeadView : UIView

/** headView的文字lable */
@property (nonatomic, strong) UILabel *headTextLabel;

+ (instancetype)headView;

@end
