//
//  MACircleView.h
//  MAMapKitNew
//
//  Created by AutoNavi.
//  Copyright (c) 2014年 AutoNavi. All rights reserved.
//

#import "MAOverlayPathView.h"
#import "MACircle.h"

/*!
 @brief 该类是MACircle的显示圆View,可以通过MAOverlayPathView修改其fill和stroke attributes
 */
@interface MACircleView : MAOverlayPathView

/*!
 @brief 根据指定圆生成对应的View
 @param circle 指定的MACircle model
 @return 生成的View
 */
- (id)initWithCircle:(MACircle *)circle;

/*!
 @brief 关联的MAcirlce model
 */
@property (nonatomic, readonly) MACircle *circle;

@end
