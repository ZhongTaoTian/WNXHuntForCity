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
#import <SDWebImageManager.h>

#define WNXCachesPath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]

@interface WNXSetingViewController () <UIAlertViewDelegate>
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
/** 缓存弹出提示框 */
@property (nonatomic, strong) UIAlertView *alertView;
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
            if(self.logoutButton.hidden) {
                self.logoutButton.hidden = NO;
            }
            break;
        case WNXSetingViewTypeWeiXin:
            if (self.logoutButton.hidden) {
                self.logoutButton.hidden = NO;
            }
            break;
        case WNXSetingViewTypeClean:
            //拿到要清理的路径,其实就是caches的路径,一般像这种很多地方都会用到的地方真好搞成宏,不过现在苹果不提倡用宏了
            //在swift中可以定义成全局的常量
            //遍历caches,将内部的文件大小计算出来,点击确认删除的话直接删除全部文件,如果有不想清理的文件,可以在遍历文件时根据路径过滤掉
        {
            NSString *path = WNXCachesPath;
            NSFileManager *fileManager=[NSFileManager defaultManager];
            float folderSize;
            if ([fileManager fileExistsAtPath:path]) {
                //拿到算有文件的数组
                NSArray *childerFiles = [fileManager subpathsAtPath:path];
                //拿到每个文件的名字,如有有不想清除的文件就在这里判断
                for (NSString *fileName in childerFiles) {
                    //将路径拼接到一起
                    NSString *fullPath = [path stringByAppendingPathComponent:fileName];
                    folderSize += [self fileSizeAtPath:fullPath];
                }
                
                self.alertView = [[UIAlertView alloc] initWithTitle:@"清理缓存" message:[NSString stringWithFormat:@"缓存大小为%.2fM,确定要清理缓存吗?", folderSize] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                [self.alertView show];
                self.alertView.delegate = self;
            }
        }
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

#pragma mark UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex) {
        //点击了确定,遍历整个caches文件,将里面的缓存清空
        NSString *path = WNXCachesPath;
        NSFileManager *fileManager=[NSFileManager defaultManager];
        if ([fileManager fileExistsAtPath:path]) {
            NSArray *childerFiles=[fileManager subpathsAtPath:path];
            for (NSString *fileName in childerFiles) {
                //如有需要，加入条件，过滤掉不想删除的文件
                NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
                [fileManager removeItemAtPath:absolutePath error:nil];
            }
        }
    }
    
    self.alertView = nil;
}

//计算单个文件夹的大小
-(float)fileSizeAtPath:(NSString *)path{
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    
    if([fileManager fileExistsAtPath:path]){
        
        long long size=[fileManager attributesOfItemAtPath:path error:nil].fileSize;
        return size/1024.0/1024.0;
    }
    return 0;
}
@end

