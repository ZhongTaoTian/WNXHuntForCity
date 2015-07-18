//
//  WNXFoundCollectionViewCell.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/7.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  自定义UICollectionViewCell
/** 这个cell内部控件需要说明一下，其实一个自定义button就可以搞定，重新下btn内部的imageView和label的位置
 并且，定义textLabel的字体属性为NSAttributedString,就能实现2行文字和不一样的文字大小以及文字颜色，不过这里没采用。。
 */


#import <UIKit/UIKit.h>
#import "WNXFoundCellModel.h"

@class WNXFoundCollectionViewCell;

@protocol WNXFoundCollectionViewCell <NSObject>
/** 
 为了追求原作的细节，这里对cell的点击完全进行了拦截，所以UICollectionViewDelegate的DidSelectrd方法已经无法触发了,
 想要还继续有点击的话只能在cell的内部iconButton进行点击处理，这里我选择了代理，也可以用Block 或者暴露内部的button在cell创建时候添加点击
 事件，我测试了下都是可行的，感觉最省事的时Block，但为了代码的阅读性还是用的代理来处理，按钮点击了就把被点击的cell传给delegate
 */
@optional
/** cell被点击了 */
- (void)foundCollectionViewCell:(WNXFoundCollectionViewCell *)cell;

@end

@interface WNXFoundCollectionViewCell : UICollectionViewCell
/** 便利构造方法 */
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic, weak) id <WNXFoundCollectionViewCell> delegate;

@property (nonatomic, strong) WNXFoundCellModel *foundModel;

@end
