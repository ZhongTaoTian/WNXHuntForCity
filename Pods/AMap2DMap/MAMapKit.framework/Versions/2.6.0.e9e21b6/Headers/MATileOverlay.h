//
//  MATileOverlay.h
//  MAMapKitNew
//
//  Created by xiaoming han on 14-1-24.
//  Copyright (c) 2014年 AutoNavi. All rights reserved.
//

#import "MAOverlay.h"

/*!
 @brief 该类是覆盖在球面墨卡托投影上的图片tiles的数据源
 */
@interface MATileOverlay : NSObject<MAOverlay>

/*!
 @brief 根据指定的URLTemplate生成tileOverlay
 @param URLTemplate是一个包含"{x}","{y}","{z}","{scale}"的字符串,"{x}","{y}","{z}","{scale}"会被tile path的值所替换，并生成用来加载tile图片数据的URL 。例如： http://server/path?x={x}&y={y}&z={z}&scale={scale}。
 @return 以指定的URLTemplate字符串生成tileOverlay
 */
- (id)initWithURLTemplate:(NSString *)URLTemplate;

/*!
 @brief 默认tileSize 256x256
 */
@property CGSize tileSize;

/*!
 @brief overlay可以渲染的最大/最小缩放级别。当0级时，一个tile覆盖整个世界范围，1级时覆盖 1/4th 世界，2级时1/16th，以此类推。
 */
@property NSInteger minimumZ;
@property NSInteger maximumZ;

@property (readonly) NSString *URLTemplate;

/*!
 @brief 区域外接矩形，可用来设定tileOverlay的可渲染区域
 */
@property (nonatomic) MAMapRect boundingMapRect;

@end

/*!
 @brief 记录某特定tile的据结构。contentScaleFactor根据设备的ScrennScale而定, 为1.0或2.0。
 */
typedef struct {
    NSInteger x;
    NSInteger y;
    NSInteger z;
    CGFloat contentScaleFactor;
} MATileOverlayPath;

/*!
 @brief 子类可覆盖CustomLoading中的方法来自定义加载MATileOverlay的行为。
 */
@interface MATileOverlay (CustomLoading)

/*!
 @brief 以tile path生成URL。用于加载tile, 此方法默认填充URLTemplate
 @param tile path
 @return path相应的url
 */
- (NSURL *)URLForTilePath:(MATileOverlayPath)path;

/*!
 @brief 加载被请求的tile, 并以tile数据或加载tile失败error访问回调block; 默认实现为首先用 -URLForTilePath 去获取URL, 然后用异步NSURLConnection加载tile数据。当绘制大面积的tileOverlay时，建议重写此函数并实现缓存机制。
 @param tile path
 @param 用来传入tile数据或加载tile失败的error访问的回调block
 */
- (void)loadTileAtPath:(MATileOverlayPath)path result:(void (^)(NSData *tileData, NSError *error))result;

@end