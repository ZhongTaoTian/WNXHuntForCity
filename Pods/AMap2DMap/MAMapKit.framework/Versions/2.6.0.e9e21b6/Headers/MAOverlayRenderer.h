//
//  MAOverlayRenderer.h
//  MAMapKit
//
//  Created by AutoNavi.
//  Copyright (c) 2013年 AutoNavi. All rights reserved.
//

#import "MAGeometry.h"
#import "MAOverlay.h"

/*!
 @brief 该类是地图覆盖物Renderer的基类, 提供绘制overlay的接口但并无实际的实现
 */
@interface MAOverlayRenderer : NSObject

/*!
 @brief 初始化并返回一个overlay renderer
 @param overlay 关联的overlay对象
 @return 初始化成功则返回overlay renderer,否则返回nil
 */
- (id)initWithOverlay:(id <MAOverlay>)overlay;

/*!
 @brief 关联的overlay对象
 */
@property (nonatomic, readonly) id <MAOverlay> overlay;

/*!
 @brief 将MAMapPoint转化为相对于receiver的本地坐标
 @param mapPoint 要转化的MAMapPoint
 @return 相对于receiver的本地坐标
 */
- (CGPoint)pointForMapPoint:(MAMapPoint)mapPoint;

/*!
 @brief 将相对于receiver的本地坐标转化为MAMapPoint
 @param point 要转化的相对于receiver的本地坐标
 @return MAMapPoint
 */
- (MAMapPoint)mapPointForPoint:(CGPoint)point;

/*!
 @brief 将MAMapRect转化为相对于receiver的本地rect
 @param mapRect 要转化的MAMapRect
 @return 相对于receiver的本地rect
 */
- (CGRect)rectForMapRect:(MAMapRect)mapRect;

/*!
 @brief 将相对于receiver的本地rect转化为MAMapRect
 @param rect 要转化的相对于receiver的本地rect
 @return MAMapRect
 */
- (MAMapRect)mapRectForRect:(CGRect)rect;

/*!
 @brief 判断overlay renderer是否可以绘制包含的内容
 @param mapRect 该MAMapRect范围内需要绘制
 @param zoomScale 当前的缩放比例值
 @return 是否可以进行绘制
 */
- (BOOL)canDrawMapRect:(MAMapRect)mapRect zoomScale:(MAZoomScale)zoomScale;

/*!
 @brief 绘制overlay renderer的内容
 @param mapRect 该MAMapRect范围内需要更新
 @param zoomScale 当前的缩放比例值
 @param context 绘制操作的graphics context
 */
- (void)drawMapRect:(MAMapRect)mapRect zoomScale:(MAZoomScale)zoomScale inContext:(CGContextRef)context;

- (void)setNeedsDisplay;

/*!
 @brief 重绘指定map rect内的内容
 @param mapRect 该map rect范围内的内容需要重绘
 */
- (void)setNeedsDisplayInMapRect:(MAMapRect)mapRect;

/*!
 @brief 重绘指定zoom scale下map rect内的内容
 @param mapRect 该map rect范围内的内容需要重绘
 @param zoomScale 当前的缩放比例值
 */
- (void)setNeedsDisplayInMapRect:(MAMapRect)mapRect zoomScale:(MAZoomScale)zoomScale;

/*!
 @brief overlay的透明度
 */
@property CGFloat alpha;

/*!
 @brief context的比例系数
 */
@property (readonly) CGFloat contentScaleFactor;

@end
