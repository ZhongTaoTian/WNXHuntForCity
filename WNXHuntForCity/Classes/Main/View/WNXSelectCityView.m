//
//  WNXSelectCityView.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/6/30.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import "WNXSelectCityView.h"
#import "WNXCityButton.h"
#import "WNXMenuButton.h"

#define WNXAnimateWithDuration 0.3

@interface WNXSelectCityView ()

@property (nonatomic, strong) WNXMenuButton *fristBtn;
@property (nonatomic, strong) WNXMenuButton *secondBtn;
@property (nonatomic, strong) WNXMenuButton *thirdBtn;

//记录城市顺序数组
@property (nonatomic, strong) NSArray *ciciyNames;

@end

@implementation WNXSelectCityView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    
    return self;
}

- (void)awakeFromNib
{
    [self setUp];
}

- (void)setUp
{
    self.alpha = 0;
    
    _fristBtn = [WNXMenuButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.fristBtn];
    
    _secondBtn = [WNXMenuButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_secondBtn];
    
    _thirdBtn = [WNXMenuButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_thirdBtn];
}

+ (instancetype)selectCityViewWithCictyButton:(WNXCityButton *)cicytBtn
{
    WNXSelectCityView *view = [[self alloc] initWithFrame:CGRectMake(cicytBtn.frame.origin.x,
                                                                     cicytBtn.frame.origin.y,
                                                                     cicytBtn.bounds.size.width,
                                                                     cicytBtn.bounds.size.height * 4)];
    
    NSMutableArray *cictys = [NSMutableArray arrayWithArray:@[@"北京", @"上海", @"广州", @"深圳"]];

    NSString *nowCicyt = [cicytBtn titleForState:UIControlStateNormal];
    
    for (int i = 0; i < cictys.count; i++) {
        if ([cictys[i] isEqualToString:nowCicyt]) {
            [cictys exchangeObjectAtIndex:i withObjectAtIndex:0];
            break;
        }
    }
    
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = cicytBtn.layer.cornerRadius;
    view.backgroundColor = cicytBtn.backgroundColor;
    view.ciciyNames = cictys;
    
    return view;
}

- (void)setCiciyNames:(NSArray *)ciciyNames
{
    _ciciyNames = ciciyNames;
    
    for (int i = 1; i < ciciyNames.count; i++) {
        [self setButton:self.subviews[i-1] index:i];
    }
}

//设置view内部按钮位置
- (void)setButton:(WNXMenuButton *)btn index:(int)index
{
    CGFloat btnW = self.bounds.size.width;
    CGFloat btnH = self.bounds.size.height / _ciciyNames.count;
    CGFloat btnX = 0;
    CGFloat btnFY = btnH;
    
    CGFloat margin = btnW * 0.15;
    UIView *whiteLine = [[UIView alloc] initWithFrame:CGRectMake(btnX + margin,index * btnFY, btnW - 2 * margin, 1)];
    whiteLine.backgroundColor = [UIColor whiteColor];
    whiteLine.alpha = 0.3;
    [self addSubview:whiteLine];
    
    btn.frame = CGRectMake(btnX,index * btnFY, btnW, btnH);
    btn.backgroundColor = self.backgroundColor;
    [btn setTitle:_ciciyNames[index] forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
}

//将selectView添加到superview
- (void)showSelectViewToView:(UIView *)superView belowSubview:(UIView *)belowSubview
{
    [superView insertSubview:self belowSubview:belowSubview];
    
    [UIView animateWithDuration:WNXAnimateWithDuration animations:^{
        self.alpha = 0.75;
    }];
}
//移除selectView
- (void)hideSelectView
{
    [UIView animateWithDuration:WNXAnimateWithDuration animations:^{
        
        self.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
    }];
}

//selectView内部按钮点击事件
- (void)btnClick:(WNXMenuButton *)sender
{
    if (self.changeCictyName) {
        
        self.changeCictyName([sender titleForState:UIControlStateNormal]);
    }
}

@end
