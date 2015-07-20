//
//  WNXDetailFootView.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/7/11.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  详情页底部显示的收藏的用户

#import "WNXDetailFootView.h"
#import "WNXMenuButton.h"

@interface WNXDetailFootView ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic, weak) WNXMenuButton *collectButton1;
@property (nonatomic, weak) WNXMenuButton *collectButton2;
@property (nonatomic, weak) WNXMenuButton *collectButton3;
@property (nonatomic, weak) WNXMenuButton *collectButton4;
@property (nonatomic, weak) WNXMenuButton *collectButton5;
@property (nonatomic, weak) WNXMenuButton *collectButton6;

@end

@implementation WNXDetailFootView

- (void)awakeFromNib
{
    self.collectButton1 = [self createButtonWithTag:0];
    self.collectButton2 = [self createButtonWithTag:1];
    self.collectButton3 = [self createButtonWithTag:2];
    self.collectButton4 = [self createButtonWithTag:3];
    self.collectButton5 = [self createButtonWithTag:4];
    self.collectButton6 = [self createButtonWithTag:5];
    
    CGFloat W = WNXAppWidth;
    CGFloat btnY = CGRectGetMaxY(self.titleLabel.frame) + 20;
    CGFloat btnW = 40;
    CGFloat btnH = 40;
    CGFloat margin = (W - 6 * btnW) / 7;
    
    self.collectButton1.frame = CGRectMake(margin, btnY, btnW, btnH);
    self.collectButton2.frame = CGRectMake(margin + (margin + btnW), btnY, btnW, btnH);
    self.collectButton3.frame = CGRectMake(margin + (margin + btnW) * 2, btnY, btnW, btnH);
    self.collectButton4.frame = CGRectMake(margin + (margin + btnW) * 3, btnY, btnW, btnH);
    self.collectButton5.frame = CGRectMake(margin + (margin + btnW) * 4, btnY, btnW, btnH);
    self.collectButton6.frame = CGRectMake(margin + (margin + btnW) * 5, btnY, btnW, btnH);

}

- (WNXMenuButton *)createButtonWithTag:(NSInteger)tag;
{
    WNXMenuButton *btn = [WNXMenuButton buttonWithType:UIButtonTypeCustom];
    btn.tag = tag;
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 20;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    if (tag != 5) {
        [btn setBackgroundImage:[UIImage imageNamed:@"myicon"] forState:UIControlStateNormal];
    } else {
        [btn setBackgroundColor:WNXGolbalGreen];
        [btn setTitle:@"22" forState:UIControlStateNormal];
    }
    [self addSubview:btn];
    
    return btn;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

+ (instancetype)detailFootView
{
    WNXDetailFootView *footView = [[NSBundle mainBundle] loadNibNamed:@"WNXDetailFootView" owner:nil options:nil].firstObject;
    
    return footView;
}



- (void)btnClick:(WNXMenuButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(detailFootViewDidClick:index:)]) {
        [self.delegate detailFootViewDidClick:self index:sender.tag];
    }
}

@end
