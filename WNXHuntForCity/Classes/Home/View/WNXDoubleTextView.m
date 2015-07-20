//
//  WNXDoubleTextView.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/7/2.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//    导航条上的自定义上下title

#import "WNXDoubleTextView.h"

@interface WNXDoubleTextView ()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *subTitleLabel;

@end

@implementation WNXDoubleTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    
    return self;
}

- (void)setUp
{
    //初始化lable
    self.titleLabel = [[UILabel alloc] init];
    [self addTitleLabelWiht:self.titleLabel font:[UIFont boldSystemFontOfSize:16]];
    
    self.subTitleLabel = [[UILabel alloc] init];
    [self addTitleLabelWiht:self.subTitleLabel font:[UIFont systemFontOfSize:13]];
}

//重新布局view的子控件
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat w = self.bounds.size.width;
    self.titleLabel.frame = CGRectMake(0, 2, w, 20);
    self.subTitleLabel.frame = CGRectMake(0, 22 , w, 20);
}


- (void)setTitle:(NSString *)title subTitle:(NSString *)subTitle
{
    self.titleLabel.text = title;
    self.subTitleLabel.text = subTitle;
}

- (void)addTitleLabelWiht:(UILabel *)label font:(UIFont *)font
{
    label.textColor = [UIColor whiteColor];
    label.font = font;
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
}

@end
