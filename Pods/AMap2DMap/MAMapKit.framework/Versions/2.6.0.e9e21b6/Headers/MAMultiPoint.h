//
//  MAMultiPoint.h
//  MAMapKit
//
//  Created by AutoNavi.
//  Copyright (c) 2013年 AutoNavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAGeometry.h"
#import "MAShape.h"

/*!
 @brief 该类是个由多个点组成的虚基类, 不能直接实例化对象, 要使用其子类MAPolyline,MAPolygon来实例化
 */
@interface MAMultiPoint : MAShape

/*!
 @brief 坐标点数组
 */
@property (nonatomic, readonly) MAMapPoint *points;

/*!
 @brief 坐标点的个数
 */
@property (nonatomic, readonly) NSUInteger pointCount;

/*!
 @brief 将内部的坐标点数据转化为经纬度坐标并拷贝到coords内存中
 @param coords 调用者提供的内存空间, 该空间长度必须大于等于要拷贝的坐标点的个数（range.length）
 @param range 要拷贝的数据范围
 */
- (void)getCoordinates:(CLLocationCoordinate2D *)coords range:(NSRange)range;

@end
