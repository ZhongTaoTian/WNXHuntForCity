//
//  MAPointAnnotation.h
//  MAMapKit
//
//  Created by AutoNavi.
//  Copyright (c) 2013年 AutoNavi. All rights reserved.
//

#import "MAShape.h"

/*!
 @brief 点标注数据
 */
@interface MAPointAnnotation : MAShape

/*!
 @brief 经纬度
 */
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@end
