//
//  WNXRmdTextCell.m
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/11.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import "WNXRmdTextCell.h"
#import "WNXRmdCellModel.h"

@interface WNXRmdTextCell ()
/** cell的文字label */
@property (weak, nonatomic) IBOutlet UILabel *rmdTextLabel;
/** 显示文字 */
@property (nonatomic, copy) NSString *labelText;

@end

@implementation WNXRmdTextCell

- (void)awakeFromNib {
    self.backgroundColor = [UIColor whiteColor];
    // 设置label每一行文字的最大宽度
    // 为了保证计算出来的数值 跟 真正显示出来的效果 一致
    self.rmdTextLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 30;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}


+ (instancetype)cellWithTabelView:(UITableView *)tableView rmdCellModel:(WNXRmdCellModel *)rmdCellMode;
{
    static NSString *identifier = @"rmdTextCell";

    WNXRmdTextCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    cell.model = rmdCellMode;
    
    return cell;
}

- (void)setModel:(WNXRmdCellModel *)model
{
    _model = model;
    self.rmdTextLabel.text = model.ch;
    [self layoutIfNeeded];
    model.cellHeight = CGRectGetMaxY(self.rmdTextLabel.frame) + 10;
}

- (void)setLabelText:(NSString *)labelText
{
    _labelText = labelText;
    self.rmdTextLabel.text = labelText;
        
}

@end
