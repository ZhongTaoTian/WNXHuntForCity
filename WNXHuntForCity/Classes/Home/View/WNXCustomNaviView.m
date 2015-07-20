//
//  WNXCustomNaviView.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69 
//  Created by MacBook on 15/7/6.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  自定义导航条

#import "WNXCustomNaviView.h"
#import "WNXDoubleTextView.h"

@interface WNXCustomNaviView()

/** 导航条titileView */
@property (nonatomic, strong) WNXDoubleTextView *titleview;
/** 返回按钮 */
@property (nonatomic, strong) UIButton *backBtn;
/** 分享按钮 */
@property (nonatomic, strong) UIButton *sharedBtn;

@end

@implementation WNXCustomNaviView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //添加返回按钮
//        self.backBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 27, 25, 25)];
        self.backBtn = [[UIButton alloc] init];
        [self.backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [self.backBtn addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.backBtn];
        
        //添加分享按钮
//         self.sharedBtn = [[UIButton alloc] initWithFrame:CGRectMake(WNXAppWidth - 34, 31, 24, 18)];
        self.sharedBtn = [[UIButton alloc] init];
        [_sharedBtn setImage:[UIImage imageNamed:@"btn_share_normal"] forState:UIControlStateNormal];
        [_sharedBtn addTarget:self action:@selector(sharedClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_sharedBtn];
        
        //设置导航条的titleView
        self.titleview = [[WNXDoubleTextView alloc] init];
        [self addSubview:_titleview];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    
    self.backBtn.frame = CGRectMake(10, 27, 25, 25);
    self.sharedBtn.frame = CGRectMake(w - 34, 31, 24, 18);
    
    CGFloat titleW = w * 0.7;
    CGFloat titleX = (w - titleW) / 2;
    self.titleview.frame = CGRectMake(titleX, h * 0.25, titleW, h * 0.8);
}

- (void)setHeadModel:(WNXHomeModel *)headModel
{
    _headModel = headModel;
    self.backgroundColor = [UIColor colorWithHexString:headModel.color alpha:1];
    [self.titleview setTitle:headModel.tag_name subTitle:headModel.section_count];
}

#pragma mark - 通知代理
- (void)backClick:(UIButton *)sender
{
    //因为是必须实现的，所以不用判断delegate有没有实现方法
    [self.delegate customNaviViewBackButtonClick:sender];
}

- (void)sharedClick:(UIButton *)sender
{
    [self.delegate customNaviViewSharedButtonClick:sender];
}


@end
