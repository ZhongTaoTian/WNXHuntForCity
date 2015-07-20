//
//  WNXHomeViewController.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/6/29.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  首页


#import "WNXHomeViewController.h"
#import "WNXRmndCell.h"
#import "WNXRmndHeadView.h"
#import "WNXHeadPushViewController.h"
#import "WNXDetailViewController.h"
#import "WNXHomeCellModel.h"
#import "WNXHomeModel.h"

@interface WNXHomeViewController () <UITableViewDelegate, UITableViewDataSource>

//** 导航titileView */
@property (nonatomic, weak) UISegmentedControl *titleView;
//推荐View
@property (nonatomic, strong) UITableView *rmedView;
//headModels，用来控制headView的属性
@property (nonatomic, strong) NSMutableArray *headModels;

/** home的模型 */
@property (nonatomic, strong) NSMutableArray *datas;

/** cell的模型 */
@property (nonatomic, strong) NSMutableArray *cellDatas;

@property (nonatomic, strong) UIImageView *nearImageView;

@end

@implementation WNXHomeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    //设置导航条
    [self setUpNavigationItem];
    
    //初始化UI
    [self setUpUI];
}

- (void)setUpNavigationItem
{
    //设置导航条titleView
    UISegmentedControl *titleV = [[UISegmentedControl alloc] initWithItems:@[@"推荐", @"附近"]];
    [titleV setTintColor:WNXColor(26, 163, 146)];
    titleV.frame = CGRectMake(0, 0, self.view.bounds.size.width * 0.5, 30);
    //文字设置
    NSMutableDictionary *attDic = [NSMutableDictionary dictionary];
    attDic[NSFontAttributeName] = [UIFont boldSystemFontOfSize:16];
    attDic[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [titleV setTitleTextAttributes:attDic forState:UIControlStateNormal];
    [titleV setTitleTextAttributes:attDic forState:UIControlStateSelected];
    //事件
    titleV.selectedSegmentIndex = 0;
    [titleV addTarget:self action:@selector(titleViewChange:) forControlEvents:UIControlEventValueChanged];
    _titleView = titleV;
    self.navigationItem.titleView = _titleView;
}

- (void)setUpUI
{
    //设置背景色
    [self.view setBackgroundColor:WNXColor(51, 52, 53)];
    
    UITableView *tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WNXAppWidth, WNXAppHeight - 64) style:UITableViewStylePlain];
    tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.rmedView = tableV;
    self.rmedView.delegate = self;
    self.rmedView.dataSource = self;
    [self.view addSubview:self.rmedView];
    self.rmedView.backgroundColor = self.view.backgroundColor;
    
    self.nearImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.nearImageView setImage:[UIImage imageNamed:@"wnxBG"]];
}

- (NSMutableArray *)datas
{
    if (_datas == nil) {
        _datas = [NSMutableArray array];
        NSArray *tmpArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"HomeDatas" ofType:@"plist"]];
        for (NSDictionary *dict in tmpArr) {
            WNXHomeModel *homeModel = [WNXHomeModel homeModelWithDict:dict];
            [_datas addObject:homeModel];
        }
    }
    
    return _datas;
}



#pragma mark - titleViewAction
- (void)titleViewChange:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == 0) {
        //显示推荐View
        [self.view addSubview:self.rmedView];
        [self.nearImageView removeFromSuperview];
    } else {
        //显示nearView
        [self.view addSubview:self.nearImageView];
        [self.rmedView removeFromSuperview];
    }
}

#pragma mark - TableViewDelegate和TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    WNXHomeModel *model = self.datas[section];
    return model.body.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.datas.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //  headViewView的复用，需要注意headView的类型为UITabelHeaderFooterView,使用和cell的复用差不多这没数据就先没用
    //    WNXRmndHeadView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headId];
    //
    //    if (headView == nil) {
    //        headView =  [WNXRmndHeadView headViewWith:headModel];
    //    }
    
    WNXHomeModel *headModel = self.datas[section];
    WNXRmndHeadView *headView = [WNXRmndHeadView headViewWith:headModel];
    //给headView添加点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headViewTap:)];
    [headView addGestureRecognizer:tap];
    
    return headView;
}

//返回每个headView的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return WNXRnmdHeadViewHeight;
}

//返回每个cell的高度，这里高度是固定的，可以直接写死, 如果高度是不固定的需要先调用estimatedHeightForRowAtIndexPath:方法给个预计高度
//等网络请求完毕后根据cell内容算出高度 再调用heightForRowAtIndexPath：设置cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return WNXRnmdCellHeight;
}

//加载cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WNXHomeModel *homeModel = self.datas[indexPath.section];
    WNXHomeCellModel *model = [WNXHomeCellModel cellModelWithDict:(NSDictionary *)(homeModel.body[indexPath.row])];
    WNXRmndCell *cell = [WNXRmndCell cellWithTableView:self.rmedView model:model];
    
    return cell;
}

#pragma mark - HeadView点击手势
//点击headView推到WNXHeadPushViewController控制器
- (void)headViewTap:(UITapGestureRecognizer *)tap
{
    WNXRmndHeadView *headView = (WNXRmndHeadView *)tap.view;
    WNXHeadPushViewController *headPushVC = [[WNXHeadPushViewController alloc] init];
    headPushVC.headModel = headView.headMode;
    [self.navigationController pushViewController:headPushVC animated:YES];
}

//cell被选中
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WNXDetailViewController *detailVC = [[WNXDetailViewController alloc] init];
    
    [self.navigationController pushViewController:detailVC animated:YES];
}

//重新定义导航条的状态
- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"recomend_btn_gone"] forBarMetrics:UIBarMetricsDefault];
    [super viewWillAppear:animated];
}


@end
