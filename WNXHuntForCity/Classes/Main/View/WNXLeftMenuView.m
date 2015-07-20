//
//  WNXLeftMenuView.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/6/28.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  左边view

#import "WNXLeftMenuView.h"
#import "WNXMenuButton.h"
#import "WNXCityButton.h"
#import "WNXSelectCityView.h"

//按钮的宽高比例
#define WNXBtnScaleForWidth 0.7
#define WNXBtnScaleForHeight 0.1

@interface WNXLeftMenuView ()

/** 城市选择 */
@property (weak, nonatomic) IBOutlet WNXCityButton *cityBtn;
/** 首页 */
@property (weak, nonatomic) IBOutlet WNXMenuButton *homeBtn;
/** 发现 */
@property (weak, nonatomic) IBOutlet WNXMenuButton *foundBtn;
/** 登陆 */
@property (weak, nonatomic) IBOutlet WNXMenuButton *iconBtn;
/** 新浪登陆 */
@property (weak, nonatomic) IBOutlet WNXMenuButton *sinaBtn;
/** 微信登陆 */
@property (weak, nonatomic) IBOutlet WNXMenuButton *weixinBtn;
/** 消息 */
@property (weak, nonatomic) IBOutlet WNXMenuButton *messageBtn;
/** 设置 */
@property (weak, nonatomic) IBOutlet WNXMenuButton *setingBtn;

@property (nonatomic, weak) UIButton *selectedBtn;

//选择城市View
@property (nonatomic, weak) WNXSelectCityView *selectCityView;

//参照物的约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnLeftConstraint;

@end

@implementation WNXLeftMenuView

- (void)awakeFromNib
{
    //设置cityBtn
    self.cityBtn.layer.masksToBounds = YES;
    self.cityBtn.layer.cornerRadius = 8;
    [self.cityBtn setTitle:@"北京" forState:UIControlStateNormal];
    [self.cityBtn setTitleColor:WNXGolbalGreen forState:UIControlStateNormal];
    [self.cityBtn setImage:[UIImage imageNamed:@"city_down"] forState:UIControlStateNormal];
    [self.cityBtn setImage:[UIImage imageNamed:@"city_up"] forState:UIControlStateSelected];
    [self.cityBtn addTarget:self action:@selector(cictyButtonClick:) forControlEvents:UIControlEventTouchDown];

    //给按钮添加tag值
    self.homeBtn.tag    = WNXleftButtonTypeHome;
    self.foundBtn.tag   = WNXleftButtonTypeFound;
    self.iconBtn.tag    = WNXleftButtonTypeIcon;
    self.sinaBtn.tag    = WNXleftButtonTypeSina;
    self.weixinBtn.tag  = WNXleftButtonTypeWeiXin;
    self.messageBtn.tag = WNXleftButtonTypeMessage;
    self.setingBtn.tag  = WNXleftButtonTypeSeting;

//    self.messageBtn.tag = WNXleftButtonTypeMessage;
//    self.setingBtn.tag = WNXleftButtonTypeSeting;
}



- (void)setDelegate:(id<WNXLeftMenuViewDelegate>)delegate
{
    _delegate = delegate;
    [self sender:self.homeBtn];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //在此处适配
    CGFloat viewWidth = self.bounds.size.width;
    CGFloat viewHeight = self.bounds.size.height;
    
    CGFloat btnW = viewWidth * WNXBtnScaleForWidth;
    CGFloat btnH = viewHeight * WNXBtnScaleForHeight;
    CGFloat btnX = (viewWidth - btnW) / 2;
    
    self.btnHeightConstraint.constant = btnH;
    self.btnWidthConstraint.constant = btnW;
    self.btnLeftConstraint.constant = btnX;
    
    [self.setingBtn layoutIfNeeded];
    
#warning 自动布局 计算算间距
    //需要计算间距的距离，图片都是自己直接在APP截的，大小不一样= =！间距大概给的模糊值
    
    
}

#pragma mark - BtnAction 
//leftBtn点击事件
- (IBAction)sender:(WNXMenuButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(leftMenuViewButtonClcikFrom:to:)]) {
        [self.delegate leftMenuViewButtonClcikFrom:(WNXleftButtonType)self.selectedBtn.tag to:(WNXleftButtonType)sender.tag];
    }
    
    if (sender.tag != WNXleftButtonTypeIcon && sender.tag != WNXleftButtonTypeSina && sender.tag != WNXleftButtonTypeWeiXin) {
        self.selectedBtn.selected = NO;
        sender.selected = YES;
        self.selectedBtn = sender;
    }
 
    if (self.cityBtn.selected) {
        [self cictyButtonClick:self.cityBtn];
    }
}

//cictyBtn的点击事件
- (void)cictyButtonClick:(WNXCityButton *)sender
{
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        
        self.selectCityView = [WNXSelectCityView selectCityViewWithCictyButton:sender];
        //显示选择View
        [self.selectCityView showSelectViewToView:self belowSubview:sender];
        
        //用设置按钮被点击时的回调
        self.selectCityView.changeCictyName = ^(NSString *cictyName){
            [sender setTitle:cictyName forState:UIControlStateNormal];
            [self cictyButtonClick:sender];
            [self sender:self.homeBtn];
        };
        
    } else {
        //隐藏
        [self.selectCityView hideSelectView];
        self.selectCityView = nil;
    }
}

- (void)coverIsRemove {
    if (self.cityBtn.selected) {
        [self cictyButtonClick:self.cityBtn];
    }
}

@end
