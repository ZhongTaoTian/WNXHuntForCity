//
//  WNXBeenAndCollectView.m
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/11.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  去过和收藏的view

#import "WNXBeenAndCollectView.h"
#import "WNXMenuButton.h"
#import "WNXUnLoginView.h"

@interface WNXBeenAndCollectView ()
@property (weak, nonatomic) IBOutlet WNXMenuButton *beenButton;
@property (weak, nonatomic) IBOutlet WNXMenuButton *collectButton;


@end

@implementation WNXBeenAndCollectView

- (void)awakeFromNib
{
    [self.beenButton addTarget:self action:@selector(beenButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.collectButton addTarget:self action:@selector(collectButtonClick) forControlEvents:UIControlEventTouchUpInside];
}

+ (instancetype)beenAndCollectView
{
    WNXBeenAndCollectView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].lastObject;
    
    return view;
}

- (void)beenButtonClick
{
  [self showPromptViewToView];
}

- (void)collectButtonClick
{
    [self showPromptViewToView];
}

- (void)showPromptViewToView
{
    WNXUnLoginView *unLogin = [WNXUnLoginView unLoginView];
    [unLogin showUnLoginViewToView:self.superview];
}

@end
