//
//  WNXMainViewController.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/6/28.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import "WNXMainViewController.h"
#import "WNXLeftMenuView.h"
#import "WNXHomeViewController.h"
#import "WNXNavigationController.h"
#import "WNXFoundViewController.h"
#import "WNXUserViewController.h"
#import "WNXCollectionViewController.h"
#import "WNXBeenViewController.h"
#import "WNXMessageViewController.h"
#import "WNXSetingViewController.h"


@interface WNXMainViewController () <WNXLeftMenuViewDelegate, UIGestureRecognizerDelegate>

//记录当前显示的控制器，用于添加手势拖拽
@property (nonatomic, weak) WNXViewController *showViewController;

//左边按钮的view
@property (nonatomic, weak) WNXLeftMenuView *leftMenuView;

@end

@implementation WNXMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加子控制器
    NSArray *classNames = @[@"WNXHomeViewController", @"WNXFoundViewController", @"WNXUserViewController", @"WNXCollectionViewController", @"WNXBeenViewController", @"WNXMessageViewController", @"WNXSetingViewController"];
    
    for (NSString *className in classNames) {
        
        UIViewController *vc = (UIViewController *)[[NSClassFromString(className) alloc] init];
        WNXNavigationController *nc = [[WNXNavigationController alloc] initWithRootViewController:vc];
        nc.view.layer.shadowColor = [UIColor blackColor].CGColor;
        nc.view.layer.shadowOffset = CGSizeMake(-3.5, 0);
        nc.view.layer.shadowOpacity = 0.2;
        [self addChildViewController:nc];
    }
    
    //创建左边View，添加约束
    WNXLeftMenuView *view = [[NSBundle mainBundle] loadNibNamed:@"WNXLeftMenuView" owner:nil options:nil].lastObject;
    view.delegate = self;
    [self.view insertSubview:view atIndex:1];
    
    [view makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view.top).offset(40);
        make.bottom.equalTo(self.view.bottom).offset(-20);
        make.width.equalTo(self.view.width).multipliedBy(0.8);
    }];
    self.leftMenuView = view;
    
    //添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    pan.delegate = self;
    [self.view addGestureRecognizer:pan];
}

#pragma mark - 手势
//拖拽Action
- (void)pan:(UIPanGestureRecognizer *)pan
{
    CGFloat moveX = [pan translationInView:self.view].x;
    
    //缩放的最终比例值
    CGFloat zoomScale = (WNXAppHeight - WNXScaleTopMargin * 2) / WNXAppHeight;
    
    //X最终偏移距离
    CGFloat maxMoveX = WNXAppWidth - WNXAppWidth * WNXZoomScaleRight;

    //没有缩放时，允许缩放
    if (self.showViewController.isScale == NO) {
        
        if (moveX <= maxMoveX + 5 && moveX >= 0) {
            
            //获取X偏移XY缩放的比例
            CGFloat scaleXY = 1 - moveX / maxMoveX * WNXZoomScaleRight;
            
            CGAffineTransform transform = CGAffineTransformMakeScale(scaleXY, scaleXY);
            
            self.showViewController.navigationController.view.transform = CGAffineTransformTranslate(transform, moveX / scaleXY, 0);
        }
        
        //当手势停止的时候,判断X轴的移动距离，停靠
        if (pan.state == UIGestureRecognizerStateEnded) {
            //计算剩余停靠时间
            if (moveX >= maxMoveX / 2) {
                CGFloat duration = 0.5 * (maxMoveX - moveX)/maxMoveX > 0 ? 0.5 * (maxMoveX - moveX)/maxMoveX : -(0.5 * (maxMoveX - moveX)/maxMoveX);
                if (duration <= 0.1) duration = 0.1;
                //直接停靠到停止的位置
                [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                    CGAffineTransform tt = CGAffineTransformMakeScale(zoomScale, zoomScale);
                    self.showViewController.navigationController.view.transform = CGAffineTransformTranslate(tt, maxMoveX , 0);
                    
                } completion:^(BOOL finished) {
                    //将状态改为已经缩放
                    self.showViewController.isScale = YES;
                    //手动点击按钮添加遮盖
                    [self.showViewController rightClick];
                }];
                
            } else  {//X轴移动不够一半 回到原位,不是缩放状态
                
                [UIView animateWithDuration:0.2 animations:^{
                    
                    self.showViewController.navigationController.view.transform = CGAffineTransformIdentity;
                    
                } completion:^(BOOL finished) {
                    self.showViewController.isScale = NO;
                }];
            }
        }
    }
    else if (self.showViewController.isScale == YES) {
        //已经缩放的情况下
        
        //计算比例
        CGFloat scaleXY = zoomScale - moveX / maxMoveX * WNXZoomScaleRight;
        
        if (moveX <= 5) {
                        
            CGAffineTransform transform = CGAffineTransformMakeScale(scaleXY, scaleXY);
            
            self.showViewController.navigationController.view.transform = CGAffineTransformTranslate(transform, (moveX + maxMoveX), 0);
        }
        //当手势停止的时候,判断X轴的移动距离，停靠
        if (pan.state == UIGestureRecognizerStateEnded) {
            //计算剩余停靠时间
            if (-moveX >= maxMoveX / 2) {
                CGFloat duration = 0.5 * (maxMoveX + moveX)/maxMoveX > 0 ? 0.5 * (maxMoveX + moveX)/maxMoveX : -(0.5 * (maxMoveX + moveX)/maxMoveX);
                if (duration <= 0.1) duration = 0.1;
                //直接停靠到停止的位置
                [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{

                    self.showViewController.navigationController.view.transform = CGAffineTransformIdentity;
                    
                } completion:^(BOOL finished) {
                    //将状态改为已经缩放
                    self.showViewController.isScale = NO;
                    //手动点击按钮添加遮盖
                    [self.showViewController coverClick];
                }];
                
            } else {//X轴移动不够一半 回到原位,不是缩放状态
                
                [UIView animateWithDuration:0.2 animations:^{
                    
                    CGAffineTransform tt = CGAffineTransformMakeScale(zoomScale, zoomScale);
                    self.showViewController.navigationController.view.transform = CGAffineTransformTranslate(tt, maxMoveX, 0);
                    
                } completion:^(BOOL finished) {
                    self.showViewController.isScale = YES;
                }];
            }
        }
    }
    
}

#pragma mark - WNXLeftMenuViewDelegate 左视图按钮点击事件
- (void)leftMenuViewButtonClcikFrom:(WNXleftButtonType)fromIndex to:(WNXleftButtonType)toIndex
{
    if (toIndex == WNXleftButtonTypeSina || toIndex == WNXleftButtonTypeWeiXin) {
#warning 三方登陆
        //登陆成功隐藏2个按钮，修改iconBtn的头像和名字
        //显示去去过和收藏
        return;
    }
    //暂时先做没有登陆的情况的点击
    WNXNavigationController *newNC = self.childViewControllers[toIndex];
    
    if (toIndex == WNXleftButtonTypeIcon) {
        newNC = self.childViewControllers[fromIndex];
    }
    //移除旧的控制器view
    WNXNavigationController *oldNC = self.childViewControllers[fromIndex];
    [oldNC.view removeFromSuperview];
    
    //添加新的控制器view
    [self.view addSubview:newNC.view];
    newNC.view.transform = oldNC.view.transform;
    
    self.showViewController = newNC.childViewControllers[0];
    
    //解决点击按钮leftViewCictyBtn选中BUG
    self.showViewController.coverDidRomove = ^{
        [self.leftMenuView coverIsRemove];
    };
    
    //自动点击遮盖btn
    [self.showViewController coverClick];
        
}



@end
