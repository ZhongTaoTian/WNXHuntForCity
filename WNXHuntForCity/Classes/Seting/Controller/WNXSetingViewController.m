//
//  WNXSetingViewController.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/6/30.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  设置

#import "WNXSetingViewController.h"
#import "WNXSetingView.h"
#import "WNXMenuButton.h"
#import "AppDelegate.h"

@interface WNXSetingViewController ()
@property (strong, nonatomic) UIScrollView *scrollView;

/** 新浪登陆view */
@property (nonatomic, strong) WNXSetingView *sinaView;
/** 微信登陆view */
@property (nonatomic, strong) WNXSetingView *weixinView;
/** 清理缓存 */
@property (nonatomic, strong) WNXSetingView *cleanView;
/** 反馈吐槽 */
@property (nonatomic, strong) WNXSetingView *feedBackView;
/** 五星好评 */
@property (nonatomic, strong) WNXSetingView *judgeView;
/** 退出登陆按钮 */
@property (nonatomic, strong) WNXMenuButton *logoutButton;

@end

@implementation WNXSetingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
    self.navigationItem.rightBarButtonItem = nil;
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WNXAppWidth, WNXAppHeight - 64)];
    //设置scrollView没有contentSize时候也可以上下弹簧滚动
    self.scrollView.alwaysBounceVertical = YES;
    self.scrollView.backgroundColor = self.view.backgroundColor;
    [self.view addSubview:self.scrollView];
    
    //添加view
    CGFloat viewW = WNXAppWidth * 0.88;
    CGFloat viewX = WNXAppWidth * 0.12 / 2;
    CGFloat viewH = 50;
    CGFloat viewY = 40;
    
    //添加view和action
    //微博登陆
    self.sinaView = [WNXSetingView setingViewWihtTitle:@"微博登录" defaultImage:@"settting_icon_wechatNotLogin"];
    [self viewAddSetingViewWithSetingView:self.sinaView frame:CGRectMake(viewX, viewY, viewW, viewH) tag:WNXSetingViewTypeSina];
    
    //微信登陆
    self.weixinView = [WNXSetingView setingViewWihtTitle:@"微信登录" defaultImage:@"settting_icon_sinaNotLogin"];
    [self viewAddSetingViewWithSetingView:self.weixinView frame:CGRectMake(viewX, viewY + viewH + 2, viewW, viewH) tag:WNXSetingViewTypeWeiXin];
    
    //清理缓存
    self.cleanView = [WNXSetingView setingViewWihtTitle:@"清理缓存" defaultImage:nil];
    [self viewAddSetingViewWithSetingView:_cleanView frame:CGRectMake(viewX, CGRectGetMaxY(self.weixinView.frame) + 40, viewW, viewH) tag:WNXSetingViewTypeClean];
    
    //反馈吐槽
    self.feedBackView = [WNXSetingView setingViewWihtTitle:@"反馈吐槽" defaultImage:nil];
    [self viewAddSetingViewWithSetingView:_feedBackView frame:CGRectMake(viewX, CGRectGetMaxY(self.cleanView.frame) + 2, viewW, viewH) tag:WNXSetingViewTypeFeedback];
    
    //五星好评
    self.judgeView = [WNXSetingView setingViewWihtTitle:@"五星好评" defaultImage:nil];
    [self viewAddSetingViewWithSetingView:_judgeView frame:CGRectMake(viewX, CGRectGetMaxY(self.feedBackView.frame) + 2, viewW, viewH) tag:WNXSetingViewTypeJudge];
    
    //退出登陆
    self.logoutButton = [WNXMenuButton buttonWithType:UIButtonTypeCustom];
    [self.logoutButton setBackgroundImage:[UIImage imageNamed:@"button_login_bg_6P"] forState:UIControlStateNormal];
    self.logoutButton.frame = CGRectMake(viewX, CGRectGetMaxY(self.judgeView.frame) + 40, viewW, viewH);
    [self.logoutButton setTitle:@"退出登录" forState:UIControlStateNormal];
    [self.logoutButton addTarget:self action:@selector(logoutButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:self.logoutButton];
        
}

- (void)viewAddSetingViewWithSetingView:(WNXSetingView *)view frame:(CGRect)frame tag:(WNXSetingViewType)tag
{
    view.frame = frame;
    view.tag = tag;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick:)];
    [view addGestureRecognizer:tap];
    [self.scrollView addSubview:view];
    
}

//view被点击
- (void)viewClick:(UITapGestureRecognizer *)tap
{
    //判断点击了那个view
    switch (tap.view.tag) {
        case WNXSetingViewTypeSina:
            break;
        case WNXSetingViewTypeWeiXin:
            break;
        case WNXSetingViewTypeClean:
            
            
            break;
        case WNXSetingViewTypeFeedback:
        {
            UIApplication *app = [UIApplication sharedApplication];
            NSURL *itunesPath = [NSURL URLWithString:@"http://www.jianshu.com/p/8b0d694d1c69"];
            [app openURL:itunesPath];
        }
            break;
        case WNXSetingViewTypeJudge:
        {
           UIApplication *app = [UIApplication sharedApplication];
            NSURL *itunesPath = [NSURL URLWithString:@"http://www.jianshu.com/p/8b0d694d1c69"];
            [app openURL:itunesPath];
        }
            break;
        default:
            break;
    }

}

//退出登录
- (void)logoutButtonClick
{
    self.logoutButton.hidden = YES;
}

@end
