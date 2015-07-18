//
//  MAGroundOverlayRenderer.h
//  DevDemo2D
//
//  Created by AutoNavi.
//  Copyright (c) 2014年 AutoNavi. All rights reserved.
//

#import "MAOverlayRenderer.h"
#import "MAGroundOverlay.h"

/*!
 @brief 此类是将MAGroundOverlay中的覆盖图片显示在地图上的renderer;
 */
@interface MAGroundOverlayRenderer : MAOverlayRenderer

/*!
 @brief groundOverlay 具有覆盖图片，以及图片覆盖的区域
 */
@property (nonatomic ,readonly) MAGroundOverlay *groundOverlay;

/*!
 @brief 根据指定的GroundOverlay生成将图片显示在地图上Renderer
 @param groundOverlay 制定了覆盖图片，以及图片的覆盖区域的groundOverlay
 @return 以GroundOverlay新生成Renderer
 */
- (id)initWithGroundOverlay:(MAGroundOverlay *)groundOverlay;

@end
