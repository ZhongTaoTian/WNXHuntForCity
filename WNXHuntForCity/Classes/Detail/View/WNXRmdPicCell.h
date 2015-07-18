//
//  WNXRmdPicCell.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/11.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  详情页推荐tableview的图片cell

#import <UIKit/UIKit.h>
#import "WNXRmdCellModel.h"

@interface WNXRmdPicCell : UITableViewCell

@property (nonatomic, strong) WNXRmdCellModel *model;

+ (instancetype)cellWithTabelView:(UITableView *)tableView  rmdPicModel:(WNXRmdCellModel *)model;


@end
