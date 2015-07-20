//
//  WNXRmndCell.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/2.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WNXHomeCellModel.h"

@interface WNXRmndCell : UITableViewCell

/** cell的模型 */
@property (nonatomic, strong) WNXHomeCellModel *model;

+ (instancetype)cellWithTableView:(UITableView *)tableView model:(WNXHomeCellModel *)model;

@end
