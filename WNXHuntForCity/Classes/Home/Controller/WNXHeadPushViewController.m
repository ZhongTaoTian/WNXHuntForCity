//
//  WNXHeadPushViewController.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/7/2.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  点击推荐页的headView推出的控制器

#import "WNXHeadPushViewController.h"
#import "WNXCustomNaviView.h"
#import "WNXConditionView.h"
#import "WNXUnLoginView.h"

@interface WNXHeadPushViewController () <WNXCustomNaviViewDelegate>

/** 冒充导航条的View */
@property (nonatomic, strong) WNXCustomNaviView *naviView;

@end

@implementation WNXHeadPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化UI
    [self setUI];

    //初始化山寨导航条
    [self setNavigitionItem];
}

- (void)setNavigitionItem
{
    //初始化导航条
    self.naviView = [[WNXCustomNaviView alloc] initWithFrame:CGRectMake(0, 0, WNXAppWidth, 64)];
    self.naviView.headModel = self.headModel;
    self.naviView.delegate = self;
    [self.view addSubview:self.naviView];
    
}

- (void)setUI
{
    //不需要系统自动处理顶部内容伸缩
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //设置tableView的背景色
    self.tableView.backgroundColor = WNXColor(51, 52, 53);
    
    //设置tableView的frame把系统
    self.tableView.frame = CGRectMake(0, 64, WNXAppWidth, WNXAppHeight - 64);
    
    CGRect cRect = self.conditionView.frame;
    cRect.origin.y = cRect.origin.y + 64;
    self.conditionView.frame = cRect;
}

//设置导航条
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //隐藏系统的导航条，由于需要自定义的动画，自定义一个view来代替导航条
    [self.navigationController setNavigationBarHidden:YES animated:YES];

    /**
     这里我尝试了设置navigationBar的背景色，设置navigationBar的setTintColor:
     设置navigationBar.layer的背景色 以及根据颜色画出navigationBar的背景图片4种办法都无法达到原生的效果
     最后采用将navigationBar隐藏，自己放一个View了冒充导航条
     */
    
}

#pragma mark - WNXCustomNaviViewDelegate
- (void)customNaviViewBackButtonClick:(UIButton *)sender
{
    //返回上个页面
    [self.navigationController popViewControllerAnimated:YES];
}

//点击了分享按钮
- (void)customNaviViewSharedButtonClick:(UIButton *)sender
{
    WNXUnLoginView *sharedView = [WNXUnLoginView unLoginView];
    [sharedView showUnLoginViewToView:self.view];
}

@end
