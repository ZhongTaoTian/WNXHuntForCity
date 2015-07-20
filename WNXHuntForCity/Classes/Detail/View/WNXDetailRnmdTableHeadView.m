//
//  WNXDetailRnmdTableHeadView.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/7/9.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//   用于详情页推荐tableview的headView,用来展示作者以及浏览人数的view，点击后回push到作者的详情页

#import "WNXDetailRnmdTableHeadView.h"
#import "WNXUserInfoDetailViewController.h"

@interface WNXDetailRnmdTableHeadView ()

//作者头像
@property (weak, nonatomic) IBOutlet UIImageView *authorIconImageView;
//作者名子
@property (weak, nonatomic) IBOutlet UILabel *authorNameLabel;
//浏览人数
@property (weak, nonatomic) IBOutlet UILabel *browseCountLabel;

//推荐tableView的titleLabel
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;



@end

@implementation WNXDetailRnmdTableHeadView

- (void)awakeFromNib
{
    //设置作者名字的颜色
    self.authorNameLabel.textColor = WNXGolbalGreen;
    //设置头像羽化半径
    self.authorIconImageView.layer.masksToBounds = YES;
    self.authorIconImageView.layer.cornerRadius = self.authorIconImageView.bounds.size.width * 0.5;
    //添加点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick)];
    [self addGestureRecognizer:tap];
}

+ (instancetype)detailRnmdTableHeadView
{
    WNXDetailRnmdTableHeadView *view = [[[NSBundle mainBundle] loadNibNamed:@"WNXDetailRnmdTableHeadView" owner:nil options:nil] lastObject];
    
    return view;
}

- (void)viewClick
{
    //拿到当前的控制器,这个view在正常的时候会在创建后拿到数据模型，所以可以直接推到下一个界面，展示作者的详情

    WNXUserInfoDetailViewController *user = [[WNXUserInfoDetailViewController alloc] init];

//    ff.view.backgroundColor =[UIColor randColor];
    [self.superNC pushViewController:user animated:YES];
    
    
}

@end
