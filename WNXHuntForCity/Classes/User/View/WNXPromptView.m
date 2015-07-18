//
//  WNXPromptView.m
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/12.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import "WNXPromptView.h"
#import "WNXMenuButton.h"

@interface WNXPromptView ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end

@implementation WNXPromptView

- (void)awakeFromNib
{
    self.layer.cornerRadius = 10;
    self.layer.shadowOffset = CGSizeMake(4, 4);
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.iconImageView.layer.masksToBounds = YES;
    self.iconImageView.layer.cornerRadius = self.iconImageView.frame.size.width / 2;
}

- (void)showPromptViewToView:(UIView *)superView
{
    CGRect rect = self.bounds;
    rect.origin = CGPointMake((superView.bounds.size.width - rect.size.width) / 2, 100);
    self.frame = rect;
    self.alpha = 0;
    
    [superView addSubview:self];
    [UIView animateWithDuration:0.4 animations:^{
        self.alpha = 1.0;
    }];
}

- (void)hidePromptViewToView
{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (IBAction)deleteView:(UIButton *)sender {
    [self hidePromptViewToView];
}

+ (instancetype)promptView
{
    WNXPromptView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].lastObject;
    return view;
}



@end
