//
//  WNXRmndHeadView.m
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/2.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  推荐tableView headView

#import "WNXRmndHeadView.h"

@interface WNXRmndHeadView ()

//分类名
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

//数量
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;

@end

@implementation WNXRmndHeadView

+ (instancetype)headViewWith:(WNXHeadModel *)headModel
{
    WNXRmndHeadView *headView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
    
    headView.headModel = headModel;
    
    return headView;
}

- (void)setHeadModel:(WNXHeadModel *)headModel
{
    _headModel = headModel;
    self.titleLabel.text = headModel.title;
    self.subTitleLabel.text = headModel.subTitle;
    self.backgroundColor = headModel.headColor;
}

@end
