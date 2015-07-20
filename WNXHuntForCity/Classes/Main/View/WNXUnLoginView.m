//
//  WNXUnLoginView.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/7/15.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  当未登录的时候弹出的view

#import "WNXUnLoginView.h"
#import "WNXPromptView.h"

/** 未登录view的高度 */
static const CGFloat unLoginViewHeight = 250;
/** 未登录view弹出和收起的动画时间 */
static const CGFloat unLoginViewShowAndHideDuration = 0.3;

@interface WNXUnLoginView ()

/** 用户头像 */
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
/** 背部的遮盖按钮 */
@property (nonatomic, strong) UIButton *maxCoverBtn;
/** 记录父视图的bouns */
@property (nonatomic, assign) CGRect superViewBouns;

/** 提醒View */
@property (nonatomic, strong) WNXPromptView *prompView;

@end

@implementation WNXUnLoginView

- (void)awakeFromNib
{
    self.backgroundColor = [UIColor whiteColor];
    self.iconImageView.layer.masksToBounds = YES;
    self.iconImageView.layer.cornerRadius = self.iconImageView.bounds.size.height / 2;
    
    _maxCoverBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _maxCoverBtn.frame = [UIScreen mainScreen].bounds;
    [_maxCoverBtn setBackgroundColor:[UIColor blackColor]];
    [_maxCoverBtn setAlpha:0.3];
    [_maxCoverBtn addTarget:self action:@selector(coverClick) forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)sinaLoginBtnClick:(UIButton *)sender {
    [self showPromptViewToView];
}

- (IBAction)WeixinLoginBtnClick:(UIButton *)sender {
    [self showPromptViewToView];
}

- (void)showPromptViewToView
{
        [self.prompView hidePromptViewToView];
        self.prompView = nil;
        self.prompView = [WNXPromptView promptView];
        [_prompView showPromptViewToView:self.superview];
}

+ (instancetype)unLoginView
{
    WNXUnLoginView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    return view;
}



//显示未登录view
- (void)showUnLoginViewToView:(UIView *)superView
{
    [superView addSubview:self.maxCoverBtn];
    
    self.superViewBouns = superView.bounds;
    
    self.frame = CGRectMake(0, superView.bounds.size.height, superView.bounds.size.width, unLoginViewHeight);
    
    [superView addSubview:self];
    
    [UIView animateWithDuration:unLoginViewShowAndHideDuration animations:^{
        self.frame = CGRectMake(0, superView.bounds.size.height - unLoginViewHeight, superView.bounds.size.width, unLoginViewHeight);
    }];
}

//遮盖被点击了,收回view
- (void)coverClick
{
    [UIView animateWithDuration:unLoginViewShowAndHideDuration animations:^{
        self.frame = CGRectMake(0, self.superViewBouns.size.height, self.superViewBouns.size.width, unLoginViewHeight);
    } completion:^(BOOL finished) {
        [self.maxCoverBtn removeFromSuperview];
        [self removeFromSuperview];
        [self.prompView hidePromptViewToView];
    }];
}

@end
