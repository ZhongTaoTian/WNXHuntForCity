//
//  WNXInfoCell.m
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/19.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

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
        model.cellHeight = CGRectGetMaxY(self.titleSecondLabel.frame) + 10;
    } else {
        model.cellHeight = CGRectGetMaxY(self.titleOneLabel.frame);
    }

}

@end
