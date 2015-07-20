//
//  WNXBlurCell.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/7/18.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import "WNXBlurCell.h"

@interface WNXBlurCell ()

/** 图片 */
@property (weak, nonatomic) IBOutlet UIButton *blurImageView;

/* 文字 */
@property (weak, nonatomic) IBOutlet UILabel *blurTitleLabel;

@end

@implementation WNXBlurCell

+ (instancetype)blurCellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath
{
    WNXBlurCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"blurCell" forIndexPath:indexPath];
    
    return cell;
}

- (void)setModel:(WNXFoundCellModel *)model
{
    _model = model;

    [self.blurImageView setImage:[UIImage imageNamed:model.icon] forState:UIControlStateNormal];
    [self.blurTitleLabel setText:model.title];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    /*  拦截事件响应者，不论触发了cell中的哪个控件都交给cell来响应 */
    // 1.判断当前控件能否接收事件
    if (self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01) return nil;
    
    // 2. 判断点在不在当前控件
    if ([self pointInside:point withEvent:event] == NO) return nil;
    
    return self;
}

@end
