//
//  WNXViewController.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/6/30.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  基类ViewController

#import "WNXViewController.h"
#import "WNXSearchViewController.h"

#define WNXScaleanimateWithDuration 0.3

@implementation WNXViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //添加导航条上的按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithNormalImage:@"search_icon_white_6P@2x" target:self action:@selector(leftSearchClick)];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithNormalImage:@"artcleList_btn_info_6P" target:self action:@selector(rightClick)];

    self.view.backgroundColor = WNXColor(239, 239, 244);
}

#pragma 导航条左右边按钮点击
- (void)rightClick
{
    //添加遮盖,拦截用户操作
    _coverBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _coverBtn.frame = self.navigationController.view.bounds;
    [_coverBtn addTarget:self action:@selector(coverClick) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.view addSubview:_coverBtn];
    
    //缩放比例
    CGFloat zoomScale = (WNXAppHeight - WNXScaleTopMargin * 2) / WNXAppHeight;
    //X移动距离
    CGFloat moveX = WNXAppWidth - WNXAppWidth * WNXZoomScaleRight;
    
    [UIView animateWithDuration:WNXScaleanimateWithDuration animations:^{
        
        CGAffineTransform transform = CGAffineTransformMakeScale(zoomScale, zoomScale);
        //先缩放在位移会使位移缩水,正常需要moveX/zoomScale 才是正常的比例,这里感觉宽度还好就省略此步
        self.navigationController.view.transform = CGAffineTransformTranslate(transform, moveX, 0);
        //将状态改成已经缩放
        self.isScale = YES;
    }];
}

//推出search控制器
- (void)leftSearchClick
{
    WNXSearchViewController *search = [[WNXSearchViewController alloc] init];
    [self.navigationController pushViewController:search animated:YES];
}

//cover点击
- (void)coverClick
{
    [UIView animateWithDuration:WNXScaleanimateWithDuration animations:^{
        self.navigationController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self.coverBtn removeFromSuperview];
        self.coverBtn = nil;
        self.isScale = NO;
        //当遮盖按钮被销毁时调用
        if (_coverDidRomove) {
            _coverDidRomove();
        }
    }];
}

@end
