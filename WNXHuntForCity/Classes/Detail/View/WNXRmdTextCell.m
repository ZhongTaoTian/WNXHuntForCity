//
//  WNXRmdTextCell.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/7/11.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  推荐tableView的文字cell,图片cell的高度是固定大小的,这个cell的高度是需要根据内容大小在计算的

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
