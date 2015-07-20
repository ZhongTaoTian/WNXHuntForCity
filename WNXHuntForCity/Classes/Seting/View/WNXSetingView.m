//
//  WNXSetingView.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/7/9.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  封装带文字的setingView

#import "WNXSetingView.h"
#import "WNXMenuButton.h"

@interface WNXSetingView ()

@property (nonatomic, strong) WNXMenuButton *leftBtn;
@property (nonatomic, strong) UIImageView *rightImageView;
@property (nonatomic, strong) UILabel *rightLabel;


@end

@implementation WNXSetingView

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
    self.backgroundColor = [UIColor whiteColor];
    self.layer.masksToBounds = YES;
    
    self.leftBtn = [WNXMenuButton buttonWithType:UIButtonTypeCustom];
    //取消按钮的可编辑状态
    self.leftBtn.enabled = NO;
    self.leftBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [self addSubview:self.leftBtn];
    self.rightImageView = [[UIImageView alloc] init];
    self.rightImageView.image = [UIImage imageNamed:@"register_right_arrow"];
    [self addSubview:self.rightImageView];
    self.rightLabel = [[UILabel alloc] init];
    self.rightLabel.textColor = [UIColor grayColor];
    self.rightLabel.textAlignment = NSTextAlignmentRight;
    self.rightLabel.hidden = YES;
    [self addSubview:self.rightLabel];
}

+ (instancetype)setingViewWihtTitle:(NSString *)title defaultImage:(NSString *)imageName
{
    WNXSetingView *setingView = [[WNXSetingView alloc] init];
    
    
    
    //有图片的就是上面的微信和新浪登陆
    if (imageName) {
        [setingView.leftBtn setTitleColor:WNXGolbalGreen forState:UIControlStateNormal];
        [setingView.leftBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [setingView.leftBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
//        [setingView.leftBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 15)];
        [setingView.leftBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [setingView.leftBtn setTitle:title forState:UIControlStateNormal];
    } else {
        [setingView.leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [setingView.leftBtn setTitle:title forState:UIControlStateNormal];
        [setingView.leftBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 30)];
    }
    
    return setingView;
    
}

- (void)layoutSubviews
{
    //子控件布局
    [super layoutSubviews];
    
    CGFloat W = self.bounds.size.width;
    CGFloat H = self.bounds.size.height;
    self.layer.cornerRadius = (W > H ? H : W) * 0.15;
    self.leftBtn.frame = CGRectMake(0, H * 0.2, W * 0.5, H * 0.6);
    
    
    CGFloat imageH = H * 0.3;
    CGFloat imageW = 30;
    CGFloat imageX = W - 20;
    CGFloat imageY = H * 0.35;
    self.rightImageView.frame = CGRectMake(imageX, imageY, imageW * 0.3, imageH);
    
    self.rightLabel.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
}

- (void)setleftBtnLoginImage:(UIImage *)image rightLabelText:(NSString *)rightText
{
    
}

@end
