//
//  MAPolyline.h
//  MAMapKit
//
//  Created by AutoNavi.
//  Copyright (c) 2013年 AutoNavi. All rights reserved.
//

#import "MAMultiPoint.h"
#import "MAOverlay.h"

/*!
 @brief 此类用于定义一个由多个点相连的多段线，点与点之间尾部想连但第一点与最后一个点不相连, 通常MAPolyline是MAPolylineRenderer的model
 */
@interface MAPolyline : MAMultiPoint <MAOverlay>

/*!
 @brief 根据map point数据生成多段线
 @param points map point数据,points对应的内存会拷贝,调用者负责该内存的释放
 @param count map point个数
 @return 生成的多段线
 */
+ (instancetype)polylineWithPoints:(MAMapPoint *)points count:(NSUInteger)count;

/*!
 @brief 根据经纬度坐标数据生成多段线
 @param coords 经纬度坐标数据,coords对应的内存会拷贝,调用者负责该内存的释放
 @param count 经纬度坐标个数
 @return 生成的多段线
 */
+ (instancetype)polylineWithCoordinates:(CLLocationCoordinate2D *)coords count:(NSUInteger)count;

@end
