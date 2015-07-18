//
//  MATileOverlayView.h
//  MAMapKitNew
//
//  Created by xiaoming han on 14-5-4.
//  Copyright (c) 2014年 AutoNavi. All rights reserved.
//

#import "MAOverlayView.h"
#import "MATileOverlay.h"

/*!
 @brief 此类将MATileOverlay中的tile渲染到地图上
 */
@interface MATileOverlayView : MAOverlayView

/*!
 @brief 覆盖在球面墨卡托投影上的图片tiles的数据源
 */
@property (nonatomic ,readonly) MATileOverlay *tileOverlay;

/*!
 @brief 根据指定的tileOverlay生成MAOverlayView
 @param tileOverlay 数据源
 @return 初始化成功则返回overlayView,否则返回nil
 */
- (id)initWithTileOverlay:(MATileOverlay *)overlay;

/*!
 @brief 清除所有tile的缓存，并刷新overlay
 */
- (void)reloadData;

@end
