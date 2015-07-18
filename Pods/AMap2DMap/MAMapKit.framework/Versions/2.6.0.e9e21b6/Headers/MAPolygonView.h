//
//  MAPolygonView.h
//  MAMapKitNew
//
//  Created by AutoNavi.
//  Copyright (c) 2014年 AutoNavi. All rights reserved.
//

#import "MAOverlayPathView.h"
#import "MAPolygon.h"

/*!
 @brief 此类是MAPolygon的显示多边形View,可以通过MAOverlayPathView修改其fill和stroke attributes
 */
@interface MAPolygonView : MAOverlayPathView

/*!
 @brief 根据指定的多边形生成一个多边形view
 @param polygon 指定的多边形数据对象
 @return 新生成的多边形view
 */
- (id)initWithPolygon:(MAPolygon *)polygon;

/*!
 @brief 关联的MAPolygon model
 */
@property (nonatomic, readonly) MAPolygon *polygon;

@end
