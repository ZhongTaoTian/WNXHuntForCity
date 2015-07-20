//
//  WNXHistoryCell.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/7/17.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  搜索历史tableView的cell,每次操作需要持久化存储数据

#import "WNXHistoryCell.h"

@interface WNXHistoryCell ()

//历史搜索记录的文件路径
#define WNXSearchHistoryPath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"hisDatas.data"]

/** 底部的线 */
@property (weak, nonatomic) IBOutlet UIView *bottomLineView;
/** 记录自己是哪个数据 */
@property (nonatomic, weak) NSIndexPath *indexPath;
/** 记录模型数据 */
@property (nonatomic, weak) NSMutableArray *hisDatas;
/** 记录tableView */
@property (nonatomic, weak) UITableView *tableView;

@end

@implementation WNXHistoryCell

- (void)awakeFromNib
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (IBAction)deleteButtonClick:(UIButton *)sender {
    
    [self.hisDatas removeObjectAtIndex:self.indexPath.row];

    [self.hisDatas writeToFile:WNXSearchHistoryPath atomically:YES];
    
    [self.tableView deleteRowsAtIndexPaths:@[self.indexPath] withRowAnimation:UITableViewRowAnimationLeft];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
    
}

+ (instancetype)historyCellWithTableView:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath atNSMutableArr:(NSMutableArray *)datas
{
    static NSString *identifier = @"historyCell";
    WNXHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    cell.tableView = tableView;
    cell.hisDatas = datas;
    cell.indexPath = indexPath;
    
    return cell;
}

@end
