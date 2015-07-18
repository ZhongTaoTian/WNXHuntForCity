//
//  MAHeatMapTileOverlay.h
//  test2D
//
//  Created by xiaoming han on 15/4/21.
//  Copyright (c) 2015年 AutoNavi. All rights reserved.
//

#import "MATileOverlay.h"

/**
 *  热力图节点
 */
@interface MAHeatMapNode : NSObject

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, assign) float intensity;

@end

/**
 *  热力图渐变属性
 */
@interface MAHeatMapGradient : NSObject<NSCopying>

@property (nonatomic, readonly) NSArray *colors; // default [blue,green,red]
@property (nonatomic, readonly) NSArray *startPoints; // default [@(0.2),@(0.5),@(0,9)]

///重新设置gradient的时候，需要执行 MATileOverlayView 中的 reloadData 方法.
- (instancetype)initWithColor:(NSArray *)colors andWithStartPoints:(NSArray *)startPoints;

@end

/**
 *  热力图tileOverlay
 */
@interface MAHeatMapTileOverlay : MATileOverlay

@property (nonatomic, strong) NSArray *data; // MAHeatMapNode array
@property (nonatomic, assign) NSInteger radius; // 12, 范围:0-100 screen point
@property (nonatomic, assign) CGFloat opacity; // 0.6,范围:0-1

@property (nonatomic, strong) MAHeatMapGradient *gradient;

@property (nonatomic, assign) BOOL allowRetinaAdapting; //是否开启高清热力图，默认关闭。

@end



