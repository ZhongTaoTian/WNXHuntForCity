//
//  WNXBlurCell.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/18.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WNXFoundCellModel.h"

@interface WNXBlurCell : UICollectionViewCell

/** 直接用found的模型 */
@property (nonatomic, strong) WNXFoundCellModel *model;

+ (instancetype)blurCellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath;

@end
