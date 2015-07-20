//
//  WNXUserInfoDetailViewController.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/7/16.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import "WNXUserInfoDetailViewController.h"
#import "WNXUserInfoView.h"

@interface WNXUserInfoDetailViewController () <UIScrollViewDelegate>
/** 底部的scrollView */
@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) WNXUserInfoView *userInfoView;

@end

@implementation WNXUserInfoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    //初始化scrollView
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.alwaysBounceVertical = YES;
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    
    //添加用户详情view到scrollView上
    self.userInfoView = [WNXUserInfoView userInfoView];
    [self.scrollView addSubview:self.userInfoView];
    
    //设置scrollView的内容大小
    self.scrollView.contentSize = CGSizeMake(0, self.userInfoView.bounds.size.height);
    
    //添加title和back按钮
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, WNXAppWidth, 34)];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.text = @"城觅";
    label.font = [UIFont systemFontOfSize:21];
    [self.view addSubview:label];
    
    //添加返回按钮
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(10, 30, 30, 30);
    CGPoint point = backBtn.center;
    point.y = label.center.y;
    backBtn.center = point;
    [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnClicl) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //将scrollView滚动的距离传给userInfoView让顶部的View自动计算反向力的距离
    [self.userInfoView userInfViewScrollOffsetY:scrollView.contentOffset.y];
}

- (void)backBtnClicl
{
    [self.navigationController popViewControllerAnimated:YES];
}



@end
