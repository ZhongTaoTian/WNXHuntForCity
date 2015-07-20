//
//  WNXMessageCell.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/7/14.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  消息cell

#import "WNXMessageCell.h"
#import "WNXMessageModel.h"

@interface WNXMessageCell ()
/** 日期 */
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
/** 删除按钮 */
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
/** 绿色小箭头 */
@property (weak, nonatomic) IBOutlet UIImageView *arrowImageView;
/** 消息文字 */
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
/** 底部3个箭头文字 */
@property (weak, nonatomic) IBOutlet UILabel *bottomArrowLabel;
/** 背景 */
@property (weak, nonatomic) IBOutlet UIView *whiteBackgroundView;

@end

@implementation WNXMessageCell

- (void)awakeFromNib {

    self.backgroundColor = WNXColor(239, 239, 244);
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    //设置圆滑效果
    self.whiteBackgroundView.layer.masksToBounds = YES;
    self.whiteBackgroundView.layer.cornerRadius = 5;
    //添加点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(whiteBackgroundViewDidClcik)];
    [self.whiteBackgroundView addGestureRecognizer:tap];
    
    //默认隐藏删除按钮
    self.deleteBtn.hidden = YES;
    self.deleteBtn.alpha = 0;
    
    //添加按钮点击事件
//    [self.deleteBtn addTarget:self action:@selector(deleteBtnClcik) forControlEvents:UIControlEventTouchUpInside];
    
}

//内部的删除按钮被点击，通知代理那一个cell被点击了
- (IBAction)deleteBtnClick:(UIButton *)sender {

    if ([self.delegate respondsToSelector:@selector(messageCell:didClcikDeleteBtnAtIndexPath:)]) {
        [self.delegate messageCell:self didClcikDeleteBtnAtIndexPath:self.indexPath];
    }
}

//cell被点击时通知代理点击了那一个cell
- (void)whiteBackgroundViewDidClcik
{   
    if ([self.delegate respondsToSelector:@selector(messageCell:didClickAtIndexPath:)]) {
        [self.delegate messageCell:self didClickAtIndexPath:self.indexPath];
    }
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"message";

    WNXMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    
    cell.indexPath = indexPath;
    
    return cell;
}

- (void)startEdit
{
    self.deleteBtn.hidden = NO;
    //隐藏绿色小箭头 显示删除按钮
    [UIView animateWithDuration:0.3 animations:^{
        self.arrowImageView.alpha = 0;
        self.deleteBtn.alpha = 1;
    } completion:^(BOOL finished) {
        self.arrowImageView.hidden = YES;
        self.deleteBtn.enabled = YES;
    }];
    
}

- (void)endEdit
{
    self.deleteBtn.enabled = NO;
    self.arrowImageView.hidden = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.arrowImageView.alpha = 1.0;
        self.deleteBtn.alpha = 0;
    } completion:^(BOOL finished) {
        self.deleteBtn.hidden = YES;
    }];
}

//重新model的set方法
- (void)setModel:(WNXMessageModel *)model
{
    //添加约束
    _model = model;
    self.dateLabel.text = model.date;
    self.messageLabel.text = model.message;
    
    [self layoutIfNeeded];
    
    [self.whiteBackgroundView updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottomArrowLabel.bottom).offset(10);
    }];
    [self layoutIfNeeded];

//    WNXLog(@"%f", self.whiteBackgroundView.bounds.size.height);
    model.cellHeight = CGRectGetMaxY(self.bottomArrowLabel.frame) + 30;
//    WNXLog(@"%f", model.cellHeight);
    
}

@end
