//
//  WNXRmdTextCell.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/11.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  推荐tableView的文字cell

#import <UIKit/UIKit.h>
@class WNXRmdCellModel;

@interface WNXRmdTextCell : UITableViewCell

@property (nonatomic, strong) WNXRmdCellModel *model;

+ (instancetype)cellWithTabelView:(UITableView *)tableView rmdCellModel:(WNXRmdCellModel *)rmdCellMode;;

@end
