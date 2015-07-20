//
//  WNXUserInfoView.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/7/15.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  用户的详细资料view

#import "WNXUserInfoView.h"

@interface WNXUserInfoView()
/** 顶部装着大头像和绿色模糊的view 用来拉伸用 */
@property (weak, nonatomic) IBOutlet UIView *topScaleView;
/** 绿的模糊view */
@property (weak, nonatomic) IBOutlet UIView *blurView;

/** 用户模糊大头像 */
@property (weak, nonatomic) IBOutlet UIImageView *bigIcon;
/** 用户小头像 */
@property (weak, nonatomic) IBOutlet UIImageView *userIconImageView;
/** 收藏按钮 */
@property (weak, nonatomic) IBOutlet UIButton *collectBtn;
/** 去过按钮 */
@property (weak, nonatomic) IBOutlet UIButton *beenBtn;

@end

@implementation WNXUserInfoView

- (void)awakeFromNib
{
    //给大头像添加模糊,这个效果是iOS8才有的新特性
    if (iOS8) {
        UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        //这里一上就崩溃。。。。。。
;
        UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
        effectview.frame = self.bigIcon.bounds;
        effectview.contentView.backgroundColor = WNXGolbalGreen;
        effectview.contentView.alpha = 0.2;
        UIImageView *blurImageView = [[UIImageView alloc] initWithFrame:self.bigIcon.bounds];
        blurImageView.image = self.bigIcon.image;
        [self.topScaleView addSubview:blurImageView];
        [blurImageView addSubview:effectview];
        blurImageView.alpha = 0.55;
//        [self.topScaleView addSubview:effectview];
    }
    
    //处理小头像的白边圆效果
    self.userIconImageView.layer.masksToBounds = YES;
    self.userIconImageView.layer.cornerRadius = self.userIconImageView.bounds.size.width / 2;
    self.userIconImageView.layer.borderWidth = 4.0;
    self.userIconImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    
    //设置俩个按钮的圆角效果
    self.collectBtn.layer.masksToBounds = YES;
    self.collectBtn.layer.cornerRadius = 5;
    self.beenBtn.layer.masksToBounds = YES;
    self.beenBtn.layer.cornerRadius = 5;
}

+ (instancetype)userInfoView
{

    WNXUserInfoView *view =  [[[NSBundle mainBundle] loadNibNamed:@"WNXUserInfoView" owner:nil options:nil] lastObject];
    view.frame = [UIScreen mainScreen].bounds;
    return view;
}

- (void)userInfViewScrollOffsetY:(CGFloat)offsetY
{

    //根据偏移量算出自己的反相的距离
    if (offsetY < 0) {
        // 向上的阻力
        CGFloat upFactor = 0.4;
        
        CGFloat value = 10;
        CGFloat upMin = - (self.topScaleView.frame.size.height / value) / (1 - upFactor);
        
        // 判断是否超过了最大的隐藏距离,这里我下面的图片不够大,就没有拉伸,使劲拉伸会露出来点,实际图片够大的话没什么问题
        if (offsetY >= upMin) {
            self.topScaleView.transform = CGAffineTransformMakeTranslation(0, offsetY * upFactor);
        } else {
            CGAffineTransform transform = CGAffineTransformMakeTranslation(0, offsetY - upMin * (1 - upFactor));
            CGFloat s = 1 + (upMin - offsetY) * 0.005;
            self.topScaleView.transform = CGAffineTransformScale(transform, s, s);
        }
    
    } else {
        //当向上位移时,topView向下走
        self.topScaleView.transform = CGAffineTransformMakeTranslation(0, 0.5 * offsetY);
        
    }
    
}

@end
