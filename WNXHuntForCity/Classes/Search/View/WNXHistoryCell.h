//
//  WNXHistoryCell.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/17.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WNXHistoryCell : UITableViewCell

/** 历史搜索文字 */
@property (weak, nonatomic) IBOutlet UILabel *hisTextLabel;

+ (instancetype)historyCellWithTableView:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath atNSMutableArr:(NSMutableArray *)datas;

@end
