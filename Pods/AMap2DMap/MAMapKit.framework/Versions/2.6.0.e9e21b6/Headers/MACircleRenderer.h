//
//  MACircleRenderer.h
//  MAMapKit
//
//  Created by AutoNavi.
//  Copyright (c) 2013年 AutoNavi. All rights reserved.
//

#import "MACircle.h"
#import "MAOverlayPathRenderer.h"

/*!
 @brief 该类是MACircle的显示圆renderer,可以通过MAOverlayPathRenderer修改其fill和stroke attributes
 */
@interface MACircleRenderer : MAOverlayPathRenderer

/*!
 @brief 根据指定圆生成对应的Renderer
 @param circle 指定的MACircle model
 @return 生成的Renderer
 */
- (id)initWithCircle:(MACircle *)circle;

/*!
 @brief 关联的MAcirlce model
 */
@property (nonatomic, readonly) MACircle *circle;

@end
