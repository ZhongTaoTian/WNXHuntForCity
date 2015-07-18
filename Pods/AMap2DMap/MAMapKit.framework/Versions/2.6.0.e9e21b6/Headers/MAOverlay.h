//
//  MAOverlay.h
//  MAMapKit
//
//  Created by AutoNavi.
//  Copyright (c) 2013年 AutoNavi. All rights reserved.
//

#import "MAAnnotation.h"
#import "MAGeometry.h"

/*!
 @brief 该类是地图覆盖物的基类，所有地图的覆盖物需要继承自此类
 */
@protocol MAOverlay <MAAnnotation>
@required

/*!
 @brief 返回区域中心坐标.
 */
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

/*!
 @brief 区域外接矩形
 */
@property (nonatomic, readonly) MAMapRect boundingMapRect;

@optional

/*!
 @brief 判断boundingMapRect和给定的mapRect是否相交，可以用MAMapRectIntersectsRect([overlay boundingMapRect], mapRect)替代
 @param mapRect 指定的map rect
 @return 两个矩形是否相交
 */
- (BOOL)intersectsMapRect:(MAMapRect)mapRect;

@end
