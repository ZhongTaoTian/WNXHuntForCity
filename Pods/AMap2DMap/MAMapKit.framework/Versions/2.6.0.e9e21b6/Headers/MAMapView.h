//
//  MAMapView.h
//  MAMapKit
//
//  Created by AutoNavi.
//  Copyright (c) 2013年 AutoNavi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MAGeometry.h"
#import "MAOverlay.h"
#import "MAOverlayRenderer.h"
#import "MAAnnotationView.h"
#import "MAOverlayView.h"

typedef NS_ENUM(NSInteger, MAMapLanguage)
{
    MAMapLanguageZhCN = 0,
    MAMapLanguageEn = 1,
};

typedef NS_ENUM(NSInteger, MAMapType)
{
    MAMapTypeStandard,  // 普通地图
    MAMapTypeSatellite  // 卫星地图
};

typedef NS_ENUM(NSInteger, MAUserTrackingMode)
{
    MAUserTrackingModeNone              = 0,    // 不追踪用户的location更新
	MAUserTrackingModeFollow            = 1,    // 追踪用户的location更新
	MAUserTrackingModeFollowWithHeading = 2     // 追踪用户的location与heading更新
};

@protocol MAMapViewDelegate;

@class MAUserLocation;
@class MAAnnotationView;
@class MAUserLocationRepresentation;

@interface MAMapView : UIView

#pragma mark - Properties

/*!
 @brief 地图View的Delegate
 */
@property (nonatomic, assign) id<MAMapViewDelegate> delegate;

/*!
 @brief 地图类型
 */
@property (nonatomic, assign) MAMapType mapType;

/*!
 @brief 地图语言
 */
@property (nonatomic, assign) MAMapLanguage language;

/*!
 @brief 是否显示交通，默认为NO
 */
@property (nonatomic, assign, getter = isShowTraffic) BOOL showTraffic;

/*!
 @brief 是否支持平移，默认为YES
 */
@property (nonatomic, assign, getter = isScrollEnabled) BOOL scrollEnabled;

/*!
 @brief 是否支持缩放，默认为YES
 */
@property (nonatomic, assign, getter = isZoomEnabled) BOOL zoomEnabled;

/*!
 @brief 清除所有磁盘上缓存的地图数据。
 */
- (void)clearDisk;

#pragma mark - Logo

/*!
 @brief logo位置, 必须在mapView.bounds之内，否则会被忽略
 */
@property (nonatomic) CGPoint logoCenter;

/*!
 @brief logo的宽高
 */
@property (nonatomic, readonly) CGSize logoSize;

#pragma mark - Compass

/*!
 @brief 是否显示罗盘，默认为YES
 */
@property (nonatomic, assign) BOOL showsCompass;

/*!
 @brief 罗盘原点位置
 */
@property (nonatomic) CGPoint compassOrigin;

/*!
 @brief 罗盘的宽高
 */
@property (nonatomic, readonly) CGSize compassSize;

/**
 *  设置罗盘的图像
 *
 *  @param image 当设置图像非空时，指南针将呈现该图像，如果为nil时，则恢复默认。
 */
- (void)setCompassImage:(UIImage *)image;

#pragma mark - Scale

/*!
 @brief 是否显示比例尺，默认为YES
 */
@property (nonatomic) BOOL showsScale;

/*!
 @brief 比例尺原点位置
 */
@property (nonatomic) CGPoint scaleOrigin;

/*!
 @brief 比例尺的最大宽高
 */
@property (nonatomic, readonly) CGSize scaleSize;


/*!
 @brief 在当前缩放级别下, 基于地图中心点, 1 screen point 对应的距离(单位是米).
 @return 对应的距离(单位是米)
 */
- (CGFloat)metersPerPointForCurrentZoomLevel;

/*!
 @brief 在指定的缩放级别下, 基于地图中心点, 1 screen point 对应的距离(单位是米).
 @param zoomLevel 指定的缩放级别, 在[minZoomLevel, maxZoomLevel]范围内.
 @return 对应的距离(单位是米)
 */
- (CGFloat)metersPerPointForZoomLevel:(CGFloat)zoomLevel;

#pragma mark - Movement

/*!
 @brief 当前地图的中心点经纬度坐标，改变该值时，地图缩放级别不会发生变化
 */
@property (nonatomic, assign) CLLocationCoordinate2D centerCoordinate;

/*!
 @brief 设定地图中心点经纬度
 @param coordinate 要设定的地图中心点经纬度
 @param animated 是否采用动画效果
 */
- (void)setCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate animated:(BOOL)animated;

/*!
 @brief 当前地图的经纬度范围，设定的该范围可能会被调整为适合地图窗口显示的范围
 */
@property (nonatomic, assign) MACoordinateRegion region;

/*!
 @brief 设定当前地图的region
 @param region 要设定的地图范围，用经纬度的方式表示
 @param animated 是否采用动画效果
 */
- (void)setRegion:(MACoordinateRegion)region animated:(BOOL)animated;

/*!
 @brief 根据当前地图视图frame的大小调整region范围，返回适合当前地图frame的region，调整过程中当前地图的中心点不会改变
 @param region 要调整的经纬度范围
 @return 调整后的经纬度范围
 */
- (MACoordinateRegion)regionThatFits:(MACoordinateRegion)region;

/*!
 @brief 当前地图可见范围的map rect
 */
@property (nonatomic, assign) MAMapRect visibleMapRect;

/*!
 @brief 设置当前地图可见范围的map rect
 @param mapRect 要调整的map rect
 @param animated 是否采用动画效果
 */
- (void)setVisibleMapRect:(MAMapRect)mapRect animated:(BOOL)animated;

/*!
 @brief 设置当前地图可见范围的map rect
 @param mapRect 要设置的map rect
 @param insets 嵌入边界
 @param animated 是否采用动画效果
 */
- (void)setVisibleMapRect:(MAMapRect)mapRect edgePadding:(UIEdgeInsets)insets animated:(BOOL)animated;

/*!
 @brief 调整map rect使其适合地图窗口显示的范围
 @param mapRect 要调整的map rect
 @return 调整后的maprect
 */
- (MAMapRect)mapRectThatFits:(MAMapRect)mapRect;

/*!
 @brief 调整map rect使其适合地图窗口显示的范围
 @param mapRect 要调整的map rect
 @param insets 嵌入边界
 @return 调整后的map rect
 */
- (MAMapRect)mapRectThatFits:(MAMapRect)mapRect edgePadding:(UIEdgeInsets)insets;

#pragma mark - Zoom

/*!
 @brief 缩放级别
 */
@property (nonatomic, assign) double zoomLevel;

/*!
 @brief 最小缩放级别
 */
@property (nonatomic, readonly) double minZoomLevel;

/*!
 @brief 最大缩放级别
 */
@property (nonatomic, readonly) double maxZoomLevel;

/*!
 @brief 设置当前地图的缩放级别zoom level
 @param zoomLevel 要设置的zoom level
 @param animated 是否采用动画效果
 */
- (void)setZoomLevel:(double)newZoomLevel animated:(BOOL)animated;

/*!
 @brief 设置当前地图的缩放级别zoom level
 @param zoomLevel 要设置的zoom level
 @param pivot 指定缩放的锚点，屏幕坐标
 @param animated 是否采用动画效果
 */
- (void)setZoomLevel:(double)newZoomLevel atPivot:(CGPoint)pivot animated:(BOOL)animated;

#pragma mark - Conversions

/*!
 @brief 将经纬度坐标转化为相对于指定view的坐标
 @param coordinate 要转化的经纬度坐标
 @param view 指定的坐标系统的view
 */
- (CGPoint)convertCoordinate:(CLLocationCoordinate2D)coordinate toPointToView:(UIView *)view;

/*!
 @brief 将相对于view的坐标转化为经纬度坐标
 @param point 要转化的坐标
 @param view point所基于的view
 return 转化后的经纬度坐标
 */
- (CLLocationCoordinate2D)convertPoint:(CGPoint)point toCoordinateFromView:(UIView *)view;

/*!
 @brief 将map rect 转化为相对于view的坐标
 @param region 要转化的 map rect
 @param view 返回值所基于的view
 return 基于view的坐标
 */
- (CGRect)convertRegion:(MACoordinateRegion)region toRectToView:(UIView *)view;

/*!
 @brief 将相对于view的rectangle转化为region
 @param rect 要转化的rectangle
 @param view rectangle所基于的view
 return 转化后的region
 */
- (MACoordinateRegion)convertRect:(CGRect)rect toRegionFromView:(UIView *)view;

#pragma mark - UserLocation

/*!
 @brief 是否显示用户位置
 */
@property (nonatomic, assign, getter = isShowsUserLocation) BOOL showsUserLocation;

/*!
 @brief 当前的位置数据
 */
@property (nonatomic, readonly) MAUserLocation *userLocation;

/*!
 @brief 定位用户位置的模式
 */
@property (nonatomic) MAUserTrackingMode userTrackingMode;

/*!
 @brief 设置追踪用户位置的模式
 @param mode 要使用的模式
 @param animated 是否采用动画效果
 */
- (void)setUserTrackingMode:(MAUserTrackingMode)mode animated:(BOOL)animated;

/*!
 @brief 当前位置再地图中是否可见
 */
@property (nonatomic, readonly, getter=isUserLocationVisible) BOOL userLocationVisible;

/*!
 @brief 设定UserLocationView样式。如果用户自定义了userlocation的annotationView，或者该annotationView还未添加到地图上，此方法将不起作用。
 @param representation 样式信息对象
 */
- (void)updateUserLocationRepresentation:(MAUserLocationRepresentation *)representation;

#pragma mark - Annotations

/*!
 @brief 标注数组
 */
@property (nonatomic, readonly) NSArray *annotations;

/*!
 @brief 向地图窗口添加标注，需要实现MAMapViewDelegate的-mapView:viewForAnnotation:函数来生成标注对应的View
 @param annotation 要添加的标注
 */
- (void)addAnnotation:(id <MAAnnotation>)annotation;

/*!
 @brief 向地图窗口添加一组标注，需要实现MAMapViewDelegate的-mapView:viewForAnnotation:函数来生成标注对应的View
 @param annotations 要添加的标注数组
 */
- (void)addAnnotations:(NSArray *)annotations;

/*!
 @brief 移除标注
 @param annotation 要移除的标注
 */
- (void)removeAnnotation:(id <MAAnnotation>)annotation;

/*!
 @brief 移除一组标注
 @param annotation 要移除的标注数组
 */
- (void)removeAnnotations:(NSArray *)annotations;

/*!
 @brief 根据标注数据过去标注view
 @param annotation 标注数据
 @return 对应的标注view
 */
- (MAAnnotationView *)viewForAnnotation:(id <MAAnnotation>)annotation;

/*!
 @brief 从复用内存池中获取制定复用标识的annotation view
 @param identifier 复用标识
 @return annotation view
 */
- (MAAnnotationView *)dequeueReusableAnnotationViewWithIdentifier:(NSString *)identifier;

/*!
 @brief 处于选中状态的标注数据数据(其count == 0 或 1)
 */
@property (nonatomic, copy) NSArray *selectedAnnotations;

/*!
 @brief 选中标注数据对应的view
 @param annotation 标注数据
 @param animated 是否有动画效果
 */
- (void)selectAnnotation:(id <MAAnnotation>)annotation animated:(BOOL)animated;

/*!
 @brief 取消选中标注数据对应的view
 @param annotation 标注数据
 @param animated 是否有动画效果
 */
- (void)deselectAnnotation:(id <MAAnnotation>)annotation animated:(BOOL)animated;

/*!
 @brief annotation 可见区域
 */
@property (nonatomic, readonly) CGRect annotationVisibleRect;

/*!
 @brief 获取指定投影矩形范围内的标注
 @param mapRect 投影矩形范围
 @return 标注集合
 */
- (NSSet *)annotationsInMapRect:(MAMapRect)mapRect;

/*!
 设置地图使其可以显示数组中所有的annotation
 @param annotations 需要显示的annotation
 @param animated    是否执行动画
 */
- (void)showAnnotations:(NSArray *)annotations animated:(BOOL)animated;

#pragma mark - Overlays

/*!
 @brief Overlay数组
 */
@property (nonatomic, readonly) NSArray *overlays;

/*!
 @brief 查找指定overlay对应的Renderer，如果该Renderer尚未创建，返回nil
 @param overlay 指定的overlay
 @return 指定overlay对应的Renderer
 */
- (MAOverlayRenderer *)rendererForOverlay:(id <MAOverlay>)overlay;

/*!
 @brief 查找指定overlay对应的View，如果该View尚未创建，返回nil
 @param overlay 指定的overlay
 @return 指定overlay对应的View
 */
- (MAOverlayView *)viewForOverlay:(id <MAOverlay>)overlay __attribute__ ((deprecated("use - (MAOverlayRenderer *)rendererForOverlay:(id <MAOverlay>)overlay instead")));

/*!
 @brief 向地图窗口添加Overlay，需要实现MAMapViewDelegate的-mapView:rendererForOverlay:函数来生成标注对应的Renderer
 @param overlay 要添加的overlay
 */
- (void)addOverlay:(id <MAOverlay>)overlay;

/*!
 @brief 向地图窗口添加一组Overlay，需要实现BMKMapViewDelegate的-mapView:rendererForOverlay:函数来生成标注对应的Renderer
 @param overlays 要添加的overlay数组
 */
- (void)addOverlays:(NSArray *)overlays;

/*!
 @brief 移除Overlay
 @param overlay 要移除的overlay
 */
- (void)removeOverlay:(id <MAOverlay>)overlay;

/*!
 @brief 移除一组Overlay
 @param overlays 要移除的overlay数组
 */
- (void)removeOverlays:(NSArray *)overlays;

/*!
 @brief 在指定的索引处添加一个Overlay
 @param overlay 要添加的overlay
 @param index 指定的索引
 */
- (void)insertOverlay:(id <MAOverlay>)overlay atIndex:(NSUInteger)index;

/*!
 @brief 在交换指定索引处的Overlay
 @param index1 索引1
 @param index2 索引2
 */
- (void)exchangeOverlayAtIndex:(NSUInteger)index1 withOverlayAtIndex:(NSUInteger)index2;

/*!
 @brief 在指定的Overlay之上插入一个overlay
 @param overlay 带添加的Overlay
 @param sibling 用于指定相对位置的Overlay
 */
- (void)insertOverlay:(id <MAOverlay>)overlay aboveOverlay:(id <MAOverlay>)sibling;

/*!
 @brief 在指定的Overlay之下插入一个overlay
 @param overlay 带添加的Overlay
 @param sibling 用于指定相对位置的Overlay
 */
- (void)insertOverlay:(id <MAOverlay>)overlay belowOverlay:(id <MAOverlay>)sibling;

@end

#pragma mark - Snapshots

/*!
 @brief 地图view关于截图的类别
 */
@interface MAMapView (Snapshot)

/*!
 @brief 在指定区域内截图(默认会包含该区域内的annotationView)
 @param rect 指定的区域
 @return 截图image
 */
- (UIImage *)takeSnapshotInRect:(CGRect)rect;

/*!
 @brief 获得地图当前可视区域截图
 @param rect 指定截图区域
 @param block 回调block
 */
- (void)takeSnapshotInRect:(CGRect)rect withCompletionBlock:(void (^)(UIImage *resultImage, CGRect rect))block;

@end

#pragma mark - LocationOption

/*!
 @brief 定位相关参数的类别
 */
@interface MAMapView (LocationOption)

/*!
 @brief 设定定位的最小更新距离。默认为kCLDistanceFilterNone，会提示任何移动。
 */
@property (nonatomic) CLLocationDistance distanceFilter;

/*!
 @brief 设定定位精度。默认为kCLLocationAccuracyBest。
 */
@property (nonatomic) CLLocationAccuracy desiredAccuracy;

/*!
 @brief 设定最小更新角度。默认为1度，设定为kCLHeadingFilterNone会提示任何角度改变。
 */
@property (nonatomic) CLLocationDegrees headingFilter;

/**
 * 指定定位是否会被系统自动暂停。默认为YES。只在iOS 6.0之后起作用。
 */
@property (nonatomic) BOOL pausesLocationUpdatesAutomatically;

@end

#pragma mark - MAMapViewDelegate

/*!
 @brief 地图view的delegate
 */
@protocol MAMapViewDelegate <NSObject>
@optional

/*!
 @brief 地图区域即将改变时会调用此接口
 @param mapview 地图View
 @param animated 是否动画
 */
- (void)mapView:(MAMapView *)mapView regionWillChangeAnimated:(BOOL)animated;

/*!
 @brief 地图区域改变完成后会调用此接口
 @param mapview 地图View
 @param animated 是否动画
 */
- (void)mapView:(MAMapView *)mapView regionDidChangeAnimated:(BOOL)animated;

/*!
 @brief 根据anntation生成对应的View
 @param mapView 地图View
 @param annotation 指定的标注
 @return 生成的标注View
 */
- (MAAnnotationView*)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation;

/*!
 @brief 当mapView新添加annotation views时，调用此接口
 @param mapView 地图View
 @param views 新添加的annotation views
 */
- (void)mapView:(MAMapView *)mapView didAddAnnotationViews:(NSArray *)views;

/*!
 @brief 当选中一个annotation views时，调用此接口
 @param mapView 地图View
 @param views 选中的annotation views
 */
- (void)mapView:(MAMapView *)mapView didSelectAnnotationView:(MAAnnotationView *)view;

/*!
 @brief 当取消选中一个annotation views时，调用此接口
 @param mapView 地图View
 @param views 取消选中的annotation views
 */
- (void)mapView:(MAMapView *)mapView didDeselectAnnotationView:(MAAnnotationView *)view;

/*!
 @brief 标注view的accessory view(必须继承自UIControl)被点击时，触发该回调
 @param mapView 地图View
 @param annotationView callout所属的标注view
 @param control 对应的control
 */
- (void)mapView:(MAMapView *)mapView annotationView:(MAAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control;

/*!
 @brief 在地图View将要启动定位时，会调用此函数
 @param mapView 地图View
 */
- (void)mapViewWillStartLocatingUser:(MAMapView *)mapView;

/*!
 @brief 在地图View停止定位后，会调用此函数
 @param mapView 地图View
 */
- (void)mapViewDidStopLocatingUser:(MAMapView *)mapView;

/*!
 @brief 位置或者设备方向更新后，会调用此函数, 这个回调已废弃由 -(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation 来替代
 @param mapView 地图View
 @param userLocation 用户定位信息(包括位置与设备方向等数据)
 */
- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation __attribute__ ((deprecated("use -(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation instead")));

/*!
 @brief 位置或者设备方向更新后，会调用此函数
 @param mapView 地图View
 @param userLocation 用户定位信息(包括位置与设备方向等数据)
 @param updatingLocation 标示是否是location数据更新, YES:location数据更新 NO:heading数据更新
 */
- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation;

/*!
 @brief 定位失败后，会调用此函数
 @param mapView 地图View
 @param error 错误号，参考CLError.h中定义的错误号
 */
- (void)mapView:(MAMapView *)mapView didFailToLocateUserWithError:(NSError *)error;

/*!
 @brief 当userTrackingMode改变时，调用此接口
 @param mapView 地图View
 @param mode 改变后的mode
 @param animated 动画
 */
- (void)mapView:(MAMapView *)mapView didChangeUserTrackingMode:(MAUserTrackingMode)mode animated:(BOOL)animated;

/*!
 @brief 拖动annotation view时view的状态变化，ios3.2以后支持
 @param mapView 地图View
 @param view annotation view
 @param newState 新状态
 @param oldState 旧状态
 */
- (void)mapView:(MAMapView *)mapView annotationView:(MAAnnotationView *)view didChangeDragState:(MAAnnotationViewDragState)newState fromOldState:(MAAnnotationViewDragState)oldState;

/*!
 @brief 根据overlay生成对应的Renderer
 @param mapView 地图View
 @param overlay 指定的overlay
 @return 生成的覆盖物Renderer
 */
- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id <MAOverlay>)overlay;

/*!
 @brief 根据overlay生成对应的View
 @param mapView 地图View
 @param overlay 指定的overlay
 @return 生成的覆盖物View
 */
- (MAOverlayView *)mapView:(MAMapView *)mapView viewForOverlay:(id <MAOverlay>)overlay __attribute__ ((deprecated("use - (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id <MAOverlay>)overlay instead")));

/*!
 @brief 当mapView新添加overlay renderer时，调用此接口
 @param mapView 地图View
 @param renderers 新添加的overlay renderers
 */
- (void)mapView:(MAMapView *)mapView didAddOverlayRenderers:(NSArray *)renderers;

/*!
 @brief 当mapView新添加overlay views时，调用此接口
 @param mapView 地图View
 @param overlayViews 新添加的overlay views
 */
- (void)mapView:(MAMapView *)mapView didAddOverlayViews:(NSArray *)overlayViews __attribute__ ((deprecated("use - (void)mapView:(MAMapView *)mapView didAddOverlayRenderers:(NSArray *)renderers instead")));

@end
