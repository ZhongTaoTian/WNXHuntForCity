//
//  MACircle.h
//  MAMapKit
//
//  Created by AutoNavi.
//  Copyright (c) 2013年 AutoNavi. All rights reserved.
//

#import "MAShape.h"
#import "MAOverlay.h"
#import "MAGeometry.h"

/*!
 @brief 该类用于定义一个圆, 通常MACircle是MACircleRenderer的model
 */
@interface MACircle : MAShape <MAOverlay>

/*!
 @brief 根据中心点和半径生成圆
 @param coord 中心点的经纬度坐标
 @param radius 半径，单位：米
 @return 新生成的圆
 */
+ (instancetype)circleWithCenterCoordinate:(CLLocationCoordinate2D)coord
                                  radius:(CLLocationDistance)radius;

/*!
 @brief 根据map rect生成圆
 @param mapRect 生成的圆的直径为MAX(width, height)
 @return 新生成的圆
 */
+ (instancetype)circleWithMapRect:(MAMapRect)mapRect;

/*!
 @brief 中心点经纬度坐标
 */
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

/*!
 @brief 半径，单位：米
 */
@property (nonatomic, readonly) CLLocationDistance radius;

/*!
 @brief 该圆的外接map rect
 */
@property (nonatomic, readonly) MAMapRect boundingMapRect;

@end
