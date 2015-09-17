//  WNXShowViewController.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/7/2.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.

//  ViewController的基类,封装了返回按钮,选择View,tableView

#import "WNXShowViewController.h"
#import "WNXRmndCell.h"
#import "WNXConditionView.h"
#import "WNXDetailViewController.h"
#import <MJRefresh.h>
#import "WNXRefresgHeader.h"
#import "WNXRenderBlurView.h"
#import "UIImage+Size.h"
#import "WNXHomeCellModel.h"

@interface WNXShowViewController ()<UITableViewDataSource, UITableViewDelegate, WNXConditionViewDelegate, WNXRenderBlurViewDelegate>

/** 数据源 */
@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation WNXShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化UI
    [self setUpUI];
    
    //设置上拉刷新
    [self setHeadRefresh];
}

//懒加载数据
- (NSMutableArray *)datas
{
    if (_datas == nil) {
        _datas = [NSMutableArray array];
        NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"CellDatas" ofType:@"plist"]];
        for (NSDictionary *dict in arr) {
            WNXHomeCellModel *model = [WNXHomeCellModel cellModelWithDict:dict];
            [_datas addObject:model];
        }
    }
    return _datas;
}

- (void)setHeadRefresh
{
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    WNXRefresgHeader *header = [WNXRefresgHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    
    // 隐藏状态
    header.stateLabel.hidden = YES;
    
    // 马上进入刷新状态
    [header beginRefreshing];
    
    // 设置header
    self.tableView.header = header;
}

//下拉加载数据
- (void)loadNewData
{
    //模拟1秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.tableView.header endRefreshing];
    });
}

- (void)setUpUI
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    //解决修改了backButton会导致没有手势滑动返回的问题
    UIButton *rightItemButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightItemButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    rightItemButton.contentMode = UIViewContentModeCenter;
    rightItemButton.frame = CGRectMake(0, 0, 25, 25);
    [rightItemButton addTarget:self action:@selector(leftItemClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightItemButton];
    
    //添加tableView
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WNXAppWidth, WNXAppHeight)
                                                  style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    //添加顶部条件选择view
    self.conditionView = [[WNXConditionView alloc] init];
    
    CGFloat conditionViewW = WNXAppWidth * 0.9;
    CGFloat conditionViewH = conditionViewW * 0.13;
    CGFloat conditionViewX = WNXAppWidth * 0.05;
    CGFloat conditionViewY = 10;
    
    self.conditionView.frame = CGRectMake(conditionViewX, conditionViewY, conditionViewW, conditionViewH);
    self.conditionView.delegate = self;
    [self.view addSubview:self.conditionView];
    
    //初始化地图
    self.mapVC = [[WNXMapViewController alloc] init];
    [self addChildViewController:self.mapVC];
    [self.view insertSubview:self.mapVC.view belowSubview:self.conditionView];
    self.mapVC.view.alpha = 0;
    self.mapVC.view.hidden = YES;
}

//返回上个控制器
- (void)leftItemClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WNXHomeCellModel *model = self.datas[indexPath.row];
    WNXRmndCell *cell = [WNXRmndCell cellWithTableView:self.tableView model:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return WNXRnmdCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //推出详情页 将对应的模型取出并传到详情页的模型里
    WNXDetailViewController *detail = [[WNXDetailViewController alloc] init];
    [self.navigationController pushViewController:detail animated:YES];
}

#pragma mark - WNXConditionViewDelegate
- (void)conditionView:(WNXConditionView *)view didButtonClickFrom:(WNXConditionButtonType)from to:(WNXConditionButtonType)to
{
    //    //渲染当前的tableView的图片,并且模糊
    if (self.blurImageView == nil) {
        self.blurImageView = [WNXRenderBlurView renderBlurViewWithImage:[UIImage imageWithCaputureView:self.tableView]];
        self.blurImageView.delegate = self;
        
        CGFloat blurY = self.view.bounds.size.height == WNXAppHeight ? 64 : 0;
        
        self.blurImageView.frame = CGRectMake(0, blurY, WNXAppWidth, WNXAppHeight - 64);
        [self.view insertSubview:self.blurImageView belowSubview:self.conditionView];
        [UIView animateWithDuration:0.3 animations:^{
            self.blurImageView.alpha = 1.0;
        }];
    } else {
        
    }
}

- (void)conditionViewdidSelectedMap:(WNXConditionView *)view
{
    [self hideBlurView];
    
    self.mapVC.view.hidden = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.mapVC.view.alpha = 1.0;
    }];
}

- (void)conditionViewdidSelectedList:(WNXConditionView *)view
{
    [UIView animateWithDuration:0.3 animations:^{
        self.mapVC.view.alpha = 0;
    } completion:^(BOOL finished) {
        self.mapVC.view.hidden = YES;
    }];
}

- (void)conditionViewCancelSelectButton:(WNXConditionView *)view
{
    [self hideBlurView];
}

//隐藏模糊的view
- (void)hideBlurView
{
    [self.blurImageView hideBlurView];
    self.blurImageView = nil;
}

//重新定义导航条的状态
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"recomend_btn_gone"] forBarMetrics:UIBarMetricsDefault];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y < 0) {
        [UIView animateWithDuration:0.2 animations:^{
            self.conditionView.alpha = 0;
        }];
    } else {
        [UIView animateWithDuration:0.2 animations:^{
            self.conditionView.alpha = 1;
        }];
    }
}

#pragma mark - WNXRenderBlurViewDelegate
//点击了X号
- (void)renderBlurViewCancelBtnClick:(WNXRenderBlurView *)view
{
    [self.conditionView cancelSelectedAllButton];
    self.blurImageView = nil;
}

//选择了按钮
- (void)renderBlurView:(WNXRenderBlurView *)view didSelectedCellWithTitle:(NSString *)title
{
    [self.tableView.header beginRefreshing];
    self.blurImageView = nil;
    [self.conditionView cancelSelectedAllButton];
}

@end
