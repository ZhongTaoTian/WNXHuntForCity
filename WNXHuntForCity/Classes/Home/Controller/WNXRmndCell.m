//
//  WNXRmndCell.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/7/2.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  推荐cell

#import "WNXRmndCell.h"
#import <UIImageView+WebCache.h>

@interface WNXRmndCell()

@property (weak, nonatomic) IBOutlet UIImageView *backImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *adressLabel;
@property (weak, nonatomic) IBOutlet UILabel *praiseLabel;

@end

@implementation WNXRmndCell

- (void)awakeFromNib {
    self.backgroundColor = WNXColor(51, 52, 53);
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView model:(WNXHomeCellModel *)model
{
    static NSString *ID = @"rmndCell";
    WNXRmndCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([WNXRmndCell class]) owner:nil options:nil] lastObject];
    }
    
    [cell.backImageView sd_setImageWithURL:[NSURL URLWithString:model.imageURL] placeholderImage:[UIImage imageNamed:@"ContentViewNoImages"]];

    cell.nameLabel.text = model.section_title;
    cell.adressLabel.text = model.poi_name;
    cell.praiseLabel.text = model.fav_count;
    
    return cell;
}


@end
