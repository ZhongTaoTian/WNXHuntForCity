//
//  MATileOverlayRenderer.h
//  MAMapKitNew
//
//  Created by xiaoming han on 14-1-24.
//  Copyright (c) 2014年 AutoNavi. All rights reserved.
//

#import "MAOverlayRenderer.h"
#import "MATileOverlay.h"

/*!
 @brief 此类将MATileOverlay中的tile渲染到地图上
 */
@interface MATileOverlayRenderer : MAOverlayRenderer

/*!
 @brief 覆盖在球面墨卡托投影上的图片tiles的数据源
 */
@property (nonatomic ,readonly) MATileOverlay *tileOverlay;

/*!
 @brief 根据指定的tileOverlay生成MATileOverlayRenderer
 @param tileOverlay 数据源
 @return 初始化成功则返回overlay renderer,否则返回nil
 */
- (id)initWithTileOverlay:(MATileOverlay *)overlay;

/*!
 @brief 清除所有tile的缓存，并刷新overlay
 */
- (void)reloadData;

@end
