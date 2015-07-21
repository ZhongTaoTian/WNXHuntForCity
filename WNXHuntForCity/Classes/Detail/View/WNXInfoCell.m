//
//  WNXInfoCell.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/7/19.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  用户详情cell

#import "WNXInfoCell.h"

@interface WNXInfoCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleSecondLabel;

@property (weak, nonatomic) IBOutlet UILabel *titleOneLabel;
@end

@implementation WNXInfoCell

- (void)awakeFromNib
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}


+ (instancetype)infoCellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"infoCell";
    WNXInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    
    return cell;
}

- (void)setModel:(WNXInfoModel *)model
{
    _model = model;

    self.titleOneLabel.text = model.title;
    if (model.subTitle) {
        self.titleSecondLabel.text = model.subTitle;
    } else {
        self.titleSecondLabel.hidden = YES;
    }
    
    self.corImageView.hidden = !model.isShowImage;
    
    [self layoutIfNeeded];
    
    if (!self.titleSecondLabel.hidden) {
        model.cellHeight = CGRectGetMaxY(self.titleSecondLabel.frame) + 20;
    } else {
        model.cellHeight = CGRectGetMaxY(self.titleOneLabel.frame) + 10;
    }

}

@end
