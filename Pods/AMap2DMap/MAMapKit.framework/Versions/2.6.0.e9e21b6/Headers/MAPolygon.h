//
//  MAPolygon.h
//  MAMapKit
//
//  Created by AutoNavi.
//  Copyright (c) 2013年 AutoNavi. All rights reserved.
//

#import "MAMultiPoint.h"
#import "MAOverlay.h"

/*!
 @brief 此类用于定义一个由多个点组成的闭合多边形, 点与点之间按顺序尾部相连, 第一个点与最后一个点相连, 通常MAPolygon是MAPolygonRenderer的model
 */
@interface MAPolygon : MAMultiPoint <MAOverlay>

/*!
 @brief 根据map point数据生成多边形
 @param points map point数据,points对应的内存会拷贝,调用者负责该内存的释放
 @param count 点的个数
 @return 新生成的多边形
 */
+ (instancetype)polygonWithPoints:(MAMapPoint *)points count:(NSUInteger)count;

/*!
 @brief 根据map point数据和interior polygons生成多边形
 @param points map point数据,points对应的内存会拷贝,调用者负责该内存的释放
 @param count 点的个数
 @param interiorPolygons MAPolygon数组，指定在生成的多边形中需要裁剪掉的区域
 @return 新生成的多边形
 */
+ (instancetype)polygonWithPoints:(MAMapPoint *)points count:(NSUInteger)count interiorPolygons:(NSArray *)interiorPolygons;

/*!
 @brief 根据经纬度坐标数据生成闭合多边形
 @param coords 经纬度坐标点数据,coords对应的内存会拷贝,调用者负责该内存的释放
 @param count 经纬度坐标点数组个数
 @return 新生成的多边形
 */
+ (instancetype)polygonWithCoordinates:(CLLocationCoordinate2D *)coords count:(NSUInteger)count;

/*!
 @brief 根据经纬度坐标数据和interior polygons生成闭合多边形
 @param coords 经纬度坐标点数据,coords对应的内存会拷贝,调用者负责该内存的释放
 @param count 经纬度坐标点数组个数
 @param interiorPolygons MAPolygon数组，指定在生成的多边形中需要裁剪掉的区域
 @return 新生成的多边形
 */
+ (instancetype)polygonWithCoordinates:(CLLocationCoordinate2D *)coords count:(NSUInteger)count interiorPolygons:(NSArray *)interiorPolygons;

/*!
 @brief 内嵌MAPolygon数组,在生成的多边形中将会裁减掉内嵌polygon包含的区域
 */
@property (readonly) NSArray *interiorPolygons;

@end
