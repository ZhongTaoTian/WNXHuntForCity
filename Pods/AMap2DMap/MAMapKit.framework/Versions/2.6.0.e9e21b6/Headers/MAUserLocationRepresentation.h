//
//  MAUserLocationRepresentation.h
//  MAMapKitNew
//
//  Created by AutoNavi.
//  Copyright (c) 2014年 AutoNavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*!
 @brief 精度圈样式信息
 */
@interface MAUserLocationRepresentation : NSObject

/*!
 @brief 标注图片。若设置为nil，则为默认图片。
 */
@property (nonatomic, strong) UIImage *image;

/*!
 @brief 是否显示精度圈。默认为YES
 */
@property (nonatomic, assign) BOOL showsAccuracyRing;

/*!
 @brief 是否显示方向指示(MAUserTrackingModeFollowWithHeading模式开启)。默认为YES
 */
@property (nonatomic, assign) BOOL showsHeadingIndicator;

/*!
 @brief 精度圈边线宽度,默认是2
 */
@property (nonatomic, assign) CGFloat lineWidth;

/*!
 @brief 精度圈填充颜色
 */
@property (nonatomic, strong) UIColor *fillColor;

/*!
 @brief 精度圈边线颜色
 */
@property (nonatomic, strong) UIColor *strokeColor;

/*!
 @brief 边线虚线样式, 默认是nil
 */
@property (nonatomic, copy) NSArray *lineDashPattern;

@end
