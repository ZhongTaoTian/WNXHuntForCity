//
//  WNXHotCell.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/7/17.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  热门cell,这里的cell只有一行,服务器每次返回四个字符串,根据字符串的长度重新布局button的位置

#import "WNXHotCell.h"

@interface WNXHotCell()
@property (weak, nonatomic) IBOutlet UIButton *hotButton1;
@property (weak, nonatomic) IBOutlet UIButton *hotButton2;
@property (weak, nonatomic) IBOutlet UIButton *hotButton3;
@property (weak, nonatomic) IBOutlet UIButton *hotButton4;

@end

@implementation WNXHotCell

- (void)awakeFromNib {
    [self setUpBtn:self.hotButton1];
    [self setUpBtn:self.hotButton2];
    self.hotButton2.backgroundColor = self.hotButton1.backgroundColor;
    [self setUpBtn:self.hotButton3];
    self.hotButton3.backgroundColor = self.hotButton1.backgroundColor;
    [self setUpBtn:self.hotButton4];
    self.hotButton4.backgroundColor = self.hotButton1.backgroundColor;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setUpBtn:(UIButton *)button
{
    button.layer.masksToBounds = YES;
    CGFloat cor = (button.bounds.size.height / 2 ) * 0.95;
    button.layer.cornerRadius = cor;
}

- (void)setHotDatas:(NSMutableArray *)hotDatas
{
    _hotDatas = hotDatas;
    
    //判断是长度是否是4,开发中可以这样写 应该服务器返回几条数据就赋值多少,而不是固定的写死数据,万一服务器返回的数据有错误,会造成用户直接闪退的,有时在某些不是很重要的东西无法确定返回的是否正确,建议用 @try    @catch来处理,
    //即便返回的数据有误,也可以让用户继续别的操作，而不会在无关紧要的小细节上造成闪退
    if (hotDatas.count == 4) {
        [self.hotButton1 setTitle:hotDatas[1] forState:UIControlStateNormal];
        [self.hotButton2 setTitle:hotDatas[0] forState:UIControlStateNormal];
        [self.hotButton3 setTitle:hotDatas[2] forState:UIControlStateNormal];
        [self.hotButton4 setTitle:hotDatas[3] forState:UIControlStateNormal];
    }
    [self layoutIfNeeded];

    //算出间距
    CGFloat margin = (WNXAppWidth - 40 - self.hotButton1.bounds.size.width - self.hotButton2.bounds.size.width - self.hotButton3.bounds.size.width - self.hotButton3.bounds.size.width) / 3;
    
    //更新约束
    [self.hotButton2 updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.hotButton1.right).offset(margin);
    }];
    
    [self.hotButton3 updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.hotButton2.right).offset(margin);
    }];
    
    [self.hotButton4 updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.hotButton3.right).offset(margin);
    }];
}

+ (instancetype)hotCellWithHotDatas:(NSArray *)hotDatas
{
    WNXHotCell *cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    cell.hotDatas = hotDatas;
    
    return cell;
}

@end
