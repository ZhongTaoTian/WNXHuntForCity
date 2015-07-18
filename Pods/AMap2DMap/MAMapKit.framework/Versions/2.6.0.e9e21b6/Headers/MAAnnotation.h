//
//  MAAnnotation.h
//  MAMapKit
//
//  Created by AutoNavi on 13-12-13.
//  Copyright (c) 2013年 AutoNavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <CoreLocation/CoreLocation.h>

/*!
 @brief 该类为标注点的protocol，提供了标注类的基本信息函数
 */
@protocol MAAnnotation <NSObject>

/*!
 @brief 标注view中心坐标
 */
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

@optional

/*!
 @brief 获取annotation标题
 @return 返回annotation的标题信息
 */
@property (nonatomic, readonly, copy) NSString *title;

/*!
 @brief 获取annotation副标题
 @return 返回annotation的副标题信息
 */
@property (nonatomic, readonly, copy) NSString *subtitle;

/**
 @brief 设置标注的坐标，在拖拽时会被调用.
 @param newCoordinate 新的坐标值
 */
- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;

@end
