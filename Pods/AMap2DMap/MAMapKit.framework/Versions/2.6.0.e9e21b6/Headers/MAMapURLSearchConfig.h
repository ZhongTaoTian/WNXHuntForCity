//
//  MAMapURLSearchConfig.h
//  MAMapKitNew
//
//  Created by xiaoming han on 15/5/25.
//  Copyright (c) 2015年 xiaoming han. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "MAMapURLSearchType.h"

/// 导航配置信息
@interface MANaviConfig : NSObject

/// 应用返回的Scheme
@property (nonatomic, copy) NSString *appScheme;

/// 应用名称
@property (nonatomic, copy) NSString *appName;

///  终点
@property (nonatomic, assign) CLLocationCoordinate2D destination;

/// 导航策略
@property (nonatomic, assign) MADrivingStrategy strategy;

@end

#pragma mark - 

/// 路径搜索配置信息
@interface MARouteConfig : NSObject

/// 应用返回的Scheme
@property (nonatomic, copy) NSString *appScheme;

/// 应用名称
@property (nonatomic, copy) NSString *appName;

/// 起点坐标
@property (nonatomic, assign) CLLocationCoordinate2D startCoordinate;

/// 终点坐标
@property (nonatomic, assign) CLLocationCoordinate2D destinationCoordinate;

/// 驾车策略
@property (nonatomic, assign) MADrivingStrategy drivingStrategy;

/// 公交策略
@property (nonatomic, assign) MATransitStrategy transitStrategy;

/// 路径规划类型
@property (nonatomic, assign) MARouteSearchType routeType;

@end

#pragma mark -

/// POI搜索配置信息
@interface MAPOIConfig : NSObject

/// 应用返回的Scheme
@property (nonatomic, copy) NSString *appScheme;

/// 应用名称
@property (nonatomic, copy) NSString *appName;

/// 搜索关键字
@property (nonatomic, copy) NSString *keywords;

/// 左上角坐标
@property (nonatomic, assign) CLLocationCoordinate2D leftTopCoordinate;

/// 右下角坐标
@property (nonatomic, assign) CLLocationCoordinate2D rightBottomCoordinate;

@end

