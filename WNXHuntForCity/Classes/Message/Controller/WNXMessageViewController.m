//
//  WNXMessageViewController.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/6/30.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  消息

#import "WNXMessageViewController.h"
#import "WNXMessageDeleteButton.h"
#import "WNXMessageRefreshHeader.h"
#import <MJRefresh.h>
#import "WNXMessageCell.h"
#import "WNXMessageModel.h"
#import "WNXMessagePushViewController.h"
#import "WNXNoHaveMessageView.h"

/** 底部删除按钮的高度 */
static const CGFloat deleteBtnHeight = 50.0;

@interface WNXMessageViewController () <UITableViewDataSource, UITableViewDelegate, WNXMessageCellDelete>
/** 消息tabelView */
@property (nonatomic, strong) UITableView *tableView;
/** 右边的导航按钮 */
@property (nonatomic, strong) UIButton *rightBtn;
/** 底部的删除全部按钮 */
@property (nonatomic, strong) WNXMessageDeleteButton *deleteAllBtn;
@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation WNXMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化导航条上的内容
    [self setNavigationItem];
    
    //初始化UI
    [self setUpUI];
}

//懒加载datas,模拟数据有3个消息
- (NSMutableArray *)datas
{
    if (_datas == nil) {
        _datas = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"MessageData" ofType:@"plist"];
        NSArray *tmepArr = [NSArray arrayWithContentsOfFile:path];
        
        for (NSDictionary *dict in tmepArr) {
            WNXMessageModel *model = [WNXMessageModel messageWithDict:dict];
            [_datas addObject:model];
        }
    }
    
    return _datas;
}

- (void)setNavigationItem
{
    self.title = @"消息";
    
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightBtn.frame = CGRectMake(0, 0, 40, 40);
    [_rightBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [_rightBtn setTitle:@"完成" forState:UIControlStateSelected];
    [_rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_rightBtn addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_rightBtn];
}

- (void)setUpUI
{
    WNXNoHaveMessageView *noMsg = [WNXNoHaveMessageView noHaveMessageView];
    [self.view addSubview:noMsg];
    
    //初始化tableView
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WNXAppWidth, WNXAppHeight - 64)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = self.view.backgroundColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    [self.view addSubview:self.tableView];
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    WNXMessageRefreshHeader *header = [WNXMessageRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    // 隐藏状态
    header.stateLabel.hidden = YES;
    // 设置header
    self.tableView.header = header;
    
    //初始化底部删除按钮
    self.deleteAllBtn = [[WNXMessageDeleteButton alloc] initWithFrame:CGRectMake(0, WNXAppHeight - 64, WNXAppWidth, deleteBtnHeight)];
    [self.deleteAllBtn addTarget:self action:@selector(deleteAllBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.deleteAllBtn];
}

//下拉加载数据
- (void)loadNewData
{
    //模拟1秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.tableView.header endRefreshing];
        
        //如果有数据，显示tableView
        if (!_datas.count) {
            self.tableView.hidden = NO;
        }
    });
}

//导航条编辑按钮被点击
- (void)rightClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    if (sender.selected == YES) {
        //显示底部删除按钮
        [self.deleteAllBtn showDeleteBtn];
    } else {
        //隐藏底部删除按钮
        [self.deleteAllBtn hideDeleteBtn];
    }
    
    for (NSInteger i = 0; i<self.datas.count; i++) {
        WNXMessageCell *cell = (WNXMessageCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        if (sender.selected == YES) {
            [cell startEdit];
        } else {
            [cell endEdit];
        }
    }
}

//底部删除全部按钮被点击
- (void)deleteAllBtnClick
{
    //这里我个人的逻辑是将所有的消息归档到本地,没点击删除一条，将本地的数据删除一条
    //当点击删除全部的时候，就清空本地的归档数据，下次接受的服务器的数据在重新写入
    //因为是模拟的数据，为了保障每次进来都有数据,就没有实现归档解档的操作，所以每次删除后重新进入会再次有数据
    
    //移除数组所有的元素
    [self.datas removeAllObjects];
    //刷新tableView
    [self.tableView reloadData];
    //点击下按钮，收回底部view
    [self rightClick:self.rightBtn];
    //隐藏按钮
    [self.rightBtn setHidden:YES];
    //隐藏tableView
    self.tableView.hidden = YES;
}

#pragma mark - UITabelViewDelegate UITabelViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WNXMessageModel *model = self.datas[indexPath.row];
    
    return model.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WNXMessageCell *cell = [WNXMessageCell cellWithTableView:tableView NSIndexPath:indexPath];
    cell.model = self.datas[indexPath.row];
    //设置cell的代理
    cell.delegate = self;
    
    return cell;
}

#pragma mark - WNXMessageCellDelegate
//cell内部的删除按钮被点击
- (void)messageCell:(WNXMessageCell *)cell didClcikDeleteBtnAtIndexPath:(NSIndexPath *)indexPath
{
    [self.datas removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.tableView reloadData];
    });

    //如果数组的长度为0隐藏导航上的按钮，收起底部删除按钮
    if (!_datas.count) {
        
        [self rightClick:self.rightBtn];
        self.tableView.hidden = YES;
        self.rightBtn.hidden = YES;
    }
}

//cell被点击
- (void)messageCell:(WNXMessageCell *)cell didClickAtIndexPath:(NSIndexPath *)indexPath
{
    WNXMessagePushViewController *pushVC = [[WNXMessagePushViewController alloc] init];
    
    //将字符串截取出来,这种方法一般都应该封装到model内部，偷个懒。。
    NSString *text = cell.model.message;
    NSRange range = [text rangeOfString:@"【"];
    NSRange range1 = [text rangeOfString:@"】"];
    NSRange range2 = NSMakeRange(range.location + 1, range1.location - range.location - 1);
    NSString *title = [text substringWithRange:range2];
    
    pushVC.title = title;
    [self.navigationController pushViewController:pushVC animated:YES];
}



@end
