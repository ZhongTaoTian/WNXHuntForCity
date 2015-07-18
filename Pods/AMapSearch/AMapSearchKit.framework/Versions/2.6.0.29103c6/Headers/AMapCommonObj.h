//
//  AMapCommonObj.h
//  searchKitV3
//
//  Created by yin cai on 13-7-3.
//  Copyright (c) 2013年 Autonavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark - #基础数据类型

/*!
 @brief 经纬度
 */
@interface AMapGeoPoint : NSObject<NSCopying>

@property (nonatomic, assign) CGFloat latitude;
@property (nonatomic, assign) CGFloat longitude;

+ (AMapGeoPoint *)locationWithLatitude:(CGFloat)lat longitude:(CGFloat)lon;

@end

/*!
 @brief 多边形 
 当传入两个点的时候，当做矩形处理:左下-右上两个顶点；其他情况视为多边形，几个点即为几边型。
 */
@interface AMapGeoPolygon : NSObject<NSCopying>

@property (nonatomic, strong) NSArray *points;// 坐标集:AMapGeoPoint数组

+ (AMapGeoPolygon *)polygonWithPoints:(NSArray *)points;

@end

/*!
 @brief 城市区域
 */
@interface AMapDistrict : NSObject

@property (nonatomic, strong) NSString *name; // 区域名称
@property (nonatomic, strong) NSString *adcode; // 区域代码

// 行政区域查询中返回数据
@property (nonatomic, strong) NSString *citycode; // 区域名称
@property (nonatomic, strong) AMapGeoPoint *center; // 中心点
@property (nonatomic, strong) NSArray *polylines; // 边界坐标点, NSString 数组
@property (nonatomic, strong) NSString *level; // 级别
@property (nonatomic, strong) NSArray *districts; // 下级行政区域

+ (AMapDistrict *)districtWithName:(NSString *)name adcode:(NSString *)adcode;

@end

/*!
 @brief 城市
 */
@interface AMapCity : NSObject

@property (nonatomic, strong) NSString *city;  // 城市名称
@property (nonatomic, strong) NSString *citycode; // 城市编码
@property (nonatomic, strong) NSString *adcode; // 城市区域编码
@property (nonatomic, assign) NSInteger num;   // 此区域的建议结果数目， AMapSuggestion 中使用
@property (nonatomic, strong) NSArray *districts; // 途径区域 AMapDistrict 数组，AMepStep中使用

@end

/*!
 @brief 查询建议
 */
@interface AMapSuggestion : NSObject

@property (nonatomic, strong) NSArray *keywords; //NSString数组
@property (nonatomic, strong) NSArray *cities;   //AMapCity数组

@end

/*!
 @brief 手机应用网址
 */
@interface AMapAppUrl : NSObject

@property (nonatomic, strong) NSString *android; // android url
@property (nonatomic, strong) NSString *ios; // ios url
@property (nonatomic, strong) NSString *wp; // winphone url

+ (AMapAppUrl *)appUrlWithAndroid:(NSString *)android ios:(NSString *)ios wp:(NSString *)wp;

@end

/*!
 @brief 图片信息
 */
@interface AMapPhoto : NSObject

@property (nonatomic, strong) NSString *title; // 标题
@property (nonatomic, strong) NSString *url; // URL地址
@property (nonatomic, strong) NSString *provider; // 来源

+ (AMapPhoto *)photoWithTitle:(NSString *)title url:(NSString *)url provider:(NSString *)provider;

@end

#pragma mark - #市场动态信息

/*!
 @brief 团购信息
 */
@interface AMapGroupBuy : NSObject

@property (nonatomic, strong) NSString *typeCode; // 团购分类代码
@property (nonatomic, strong) NSString *type; // 团购分类
@property (nonatomic, strong) NSString *detail; // 团购详情
@property (nonatomic, strong) NSString *startTime; // 团购开始时间
@property (nonatomic, strong) NSString *endTime; // 团购结束时间
@property (nonatomic, assign) NSInteger num; // 团购总量
@property (nonatomic, assign) NSInteger soldNum; // 已卖出数量
@property (nonatomic, assign) CGFloat originalPrice; // 原价
@property (nonatomic, assign) CGFloat groupbuyPrice; // 团购价
@property (nonatomic, assign) CGFloat discount; // 折扣
@property (nonatomic, strong) NSString *ticketAddress; // 取票地址
@property (nonatomic, strong) NSString *ticketTel; // 取票电话
@property (nonatomic, strong) NSArray *photos; //图片信息 : AMapPhoto数组
@property (nonatomic, strong) NSString *url; // 来源URL
@property (nonatomic, strong) NSString *provider; // 来源标识

@end

/*!
 @brief 打折信息
 */
@interface AMapDiscount : NSObject

@property (nonatomic, strong) NSString *title; // 标题
@property (nonatomic, strong) NSString *detail; // 优惠详情
@property (nonatomic, strong) NSString *startTime; // 开始时间
@property (nonatomic, strong) NSString *endTime; // 结束时间
@property (nonatomic, assign) NSInteger soldNum; // 已卖出数量
@property (nonatomic, strong) NSArray *photos; //图片信息 : AMapPhoto数组
@property (nonatomic, strong) NSString *url; // 来源URL
@property (nonatomic, strong) NSString *provider; // 来源标识

@end

/*!
 @brief 动态市场信息
 */
@interface AMapRichContent : NSObject

@property (nonatomic, strong) NSArray *groupbuys; //团购信息 : AMapGroupBuy数组
@property (nonatomic, strong) NSArray *discounts; //优惠信息 : AMapDiscount数组

@end

#pragma mark - #行业深度信息

/*!
 @brief 电影行业的场次信息
 */
@interface AMapTicket : NSObject

@property (nonatomic, strong) NSString *startTime; // 放映时间
@property (nonatomic, strong) NSString *screen; // 屏幕信息
@property (nonatomic, strong) NSString *lang; // 语言
@property (nonatomic, assign) CGFloat price; // 价格
@property (nonatomic, assign) BOOL seatOrdering; // 是否可选座
@property (nonatomic, strong) NSString *orderingUrlWap; // 手机端选座网址
@property (nonatomic, strong) NSString *orderingUrlWeb; // 网页版选座网址

@end

/*!
 @brief 电影行业的动态信息
 */
@interface AMapMovie : NSObject

@property (nonatomic, strong) NSString *name; // 影片名称
@property (nonatomic, strong) NSString *uid; // 影片id
@property (nonatomic, strong) NSString *actors; // 演员
@property (nonatomic, strong) NSString *director; // 导演
@property (nonatomic, strong) NSString *type; //  类型
@property (nonatomic, assign) NSInteger length; // 片长
@property (nonatomic, strong) NSArray *tickets; // 场次列表 AMapTicket 数组

@end

/*!
 @brief 酒店行业的房型详细信息
 */
@interface AMapRoom : NSObject

@property (nonatomic, strong) NSString *uid; // 客房id
@property (nonatomic, strong) NSString *type; // 房型类别
@property (nonatomic, strong) NSString *name; // 房型名称
@property (nonatomic, assign) CGFloat price; // 房价
@property (nonatomic, strong) NSString *breakfast; // 早餐供应
@property (nonatomic, strong) NSString *network; // 提供网络
@property (nonatomic, assign) BOOL guarantee; // 是否需要预订担保
@property (nonatomic, strong) NSString *tel; // 预订电话
@property (nonatomic, strong) NSString *orderingUrlWap; // 手机端预定网址
@property (nonatomic, strong) NSString *orderingUrlWeb; // 网页版预定网址
@property (nonatomic, strong) NSString *provider; // 房型价格来源

@end

/*!
@brief 餐饮行业深度信息
 */
@interface AMapDiningDeepContent : NSObject

@property (nonatomic, strong) NSString *cuisines; // 菜系
@property (nonatomic, strong) NSString *tag; // 标签
@property (nonatomic, assign) CGFloat cpRating; // 单数据源的评分
@property (nonatomic, assign) CGFloat tasteRating; // 口味评分
@property (nonatomic, assign) CGFloat environmentRating; // 环境评分
@property (nonatomic, assign) CGFloat serviceRating; // 服务评分
@property (nonatomic, assign) CGFloat cost; // 人均消费
@property (nonatomic, strong) NSString *recommend; // 特色菜推荐
@property (nonatomic, strong) NSString *atmosphere; // 氛围
@property (nonatomic, strong) NSString *addition; // 餐厅特色
@property (nonatomic, strong) AMapAppUrl *appUrl; // 手机应用订餐网址
@property (nonatomic, strong) NSString *orderingUrlWap; // 手机端订餐网址
@property (nonatomic, strong) NSString *orderingUrlWeb; // 网页版订餐网址
@property (nonatomic, strong) NSString *opentimeGDF; // 规范格式的营业时间
@property (nonatomic, strong) NSString *opentime; // 非规范格式的营业时间

@end

/*!
 @brief 酒店行业深度信息
 */
@interface AMapHotelDeepContent : NSObject

@property (nonatomic, assign) NSInteger star; // 星级
@property (nonatomic, assign) CGFloat lowestPrice; // 最低价
@property (nonatomic, assign) CGFloat faciRating; // 设施评分
@property (nonatomic, assign) CGFloat healthRating; // 卫生评分
@property (nonatomic, assign) CGFloat environmentRating; // 环境评分
@property (nonatomic, assign) CGFloat serviceRating; // 服务评分
@property (nonatomic, strong) NSString *traffic; // 交通提示
@property (nonatomic, strong) NSString *addition; // 特色服务

@property (nonatomic, strong) NSArray *rooms; //房型信息 AMapRoom 数组

@end

/*!
 @brief 景点行业深度信息
 */
@interface AMapScenicDeepContent : NSObject

@property (nonatomic, strong) NSString *level; // 景区国标级别
@property (nonatomic, assign) CGFloat price; // 门票价格
@property (nonatomic, strong) NSString *season; // 适合游玩的月份，多个月份用"|"隔开
@property (nonatomic, strong) NSString *recommend; // 推荐景点 ，多个景点用"|"隔开
@property (nonatomic, strong) NSString *theme; // 景区主题
@property (nonatomic, strong) NSString *orderingUrlWap; // 手机端购票网址
@property (nonatomic, strong) NSString *orderingUrlWeb; // 网页版购票网址
@property (nonatomic, strong) NSString *opentimeGDF; // 规范格式的营业时间
@property (nonatomic, strong) NSString *opentime; // 非规范格式的营业时间

@end

/*!
 @brief 电影行业的深度信息
 */
@interface AMapCinemaDeepContent : NSObject

@property (nonatomic, assign) BOOL is3D; // 是否支持3D
@property (nonatomic, strong) NSString *parking; // 停车场设施
@property (nonatomic, strong) NSString *opentimeGDF; // 规范格式的营业时间
@property (nonatomic, strong) NSString *opentime; // 非规范格式的营业时间

@property (nonatomic, strong) NSArray *movies; //电影行业的动态信息列表 : AMapMovie数组

@end

/*!
 @brief 行业深度信息
 */
@interface AMapDeepContent : NSObject

@property (nonatomic, strong) NSString *type; // 行业类型
@property (nonatomic, strong) NSString *intro; // 简介
@property (nonatomic, assign) CGFloat rating; // 综合评分
@property (nonatomic, strong) NSString *provider; // 信息来源
@property (nonatomic, strong) NSArray *photos; // 图片信息
@property (nonatomic, strong) AMapDiningDeepContent *deepDining; // 餐饮行业的深度信息
@property (nonatomic, strong) AMapHotelDeepContent *deepHotel; // 酒店行业的深度信息
@property (nonatomic, strong) AMapScenicDeepContent *deepScenic; // 景点行业的深度信息
@property (nonatomic, strong) AMapCinemaDeepContent *deepCinema; // 电影行业的深度信息

@end

/*!
 @brief 行业类型
 */
extern NSString *const AMapDeepContentTypeDining;
extern NSString *const AMapDeepContentTypeHotel;
extern NSString *const AMapDeepContentTypeScenic;
extern NSString *const AMapDeepContentTypeCinema;

#pragma mark - #POI查询扩展信息

/*!
 @brief 行业扩展信息
 */
@interface AMapBizExtention : NSObject

@property (nonatomic, assign) CGFloat rating; // 综合评分
@property (nonatomic, assign) CGFloat cost; // 人均消费
@property (nonatomic, assign) CGFloat lowestPriceForHotel; //  最低价格
@property (nonatomic, assign) NSUInteger starForHotel; // 星级
@property (nonatomic, assign) BOOL mealOrderingForDining; // 是否可订餐
@property (nonatomic, assign) BOOL seatOrderingForCinema; // 是否可选座
@property (nonatomic, assign) BOOL ticketOrderingForScenic; // 是否可订票
@property (nonatomic, assign) BOOL hasGroupbuy; // 是否有团购
@property (nonatomic, assign) BOOL hasDiscount; // 是否有优惠

@end

#pragma mark - #查询结果数据类型

/*!
 @brief POI
 */
@interface AMapPOI : NSObject

// basic:
@property (nonatomic, strong) NSString *uid; // POI全局唯一ID
@property (nonatomic, strong) NSString *name; // 名称
@property (nonatomic, strong) NSString *type; // 兴趣点类型
@property (nonatomic, strong) AMapGeoPoint *location; // 经纬度
@property (nonatomic, strong) NSString *address;  // 地址
@property (nonatomic, strong) NSString *tel;  // 电话
@property (nonatomic, assign) NSInteger distance; // 距中心点距离

// extensions:
@property (nonatomic, strong) NSString *postcode; // 邮编
@property (nonatomic, strong) NSString *website; // 网址
@property (nonatomic, strong) NSString *email;    // 电子邮件
@property (nonatomic, strong) NSString *province; // 省
@property (nonatomic, strong) NSString *pcode;   // 省编码
@property (nonatomic, strong) NSString *city; // 城市名称
@property (nonatomic, strong) NSString *citycode; // 城市编码
@property (nonatomic, strong) NSString *district; // 区域名称
@property (nonatomic, strong) NSString *adcode;   // 区域编码
@property (nonatomic, strong) NSString *gridcode; // 地理格ID
@property (nonatomic, strong) NSString *navipoiid; // 导航点ID/ *暂未开通 */
@property (nonatomic, strong) AMapGeoPoint *enterLocation; // 入口经纬度
@property (nonatomic, strong) AMapGeoPoint *exitLocation; // 出口经纬度
@property (nonatomic, assign) CGFloat weight; // 权重 / *暂未开通 */
@property (nonatomic, assign) CGFloat match;  // 匹配 / *暂未开通 */
@property (nonatomic, assign) NSInteger recommend; // 推荐标识 / *暂未开通 */
@property (nonatomic, strong) NSString *timestamp; // 时间戳 / *暂未开通 */
@property (nonatomic, strong) NSString *direction; // 方向

@property (nonatomic, assign) BOOL hasIndoorMap; // 是否有室内地图
@property (nonatomic, strong) NSString *indoorMapProvider; // 室内地图来源

@property (nonatomic, strong) NSString *businessArea; // 所在商圈

/** 团购信息数目，推荐使用bizExtension中的hasGroupbuy代替。*/
@property (nonatomic, assign) NSInteger groupbuyNum __attribute__((deprecated("use 'hasGroupbuy' in deepContent instead")));

/** 优惠信息数目，推荐使用bizExtension中的hasDiscount代替。*/
@property (nonatomic, assign) NSInteger discountNum __attribute__((deprecated("use 'hasDiscount' in deepContent instead")));

@property (nonatomic, strong) AMapBizExtention *bizExtention; // 扩展信息
@property (nonatomic, strong) AMapRichContent *richContent; // 动态市场信息
@property (nonatomic, strong) AMapDeepContent *deepContent; // 行业深度信息

@end

/*!
 @brief 公交站
 */
@interface AMapBusStop : NSObject

@property (nonatomic, strong) NSString *uid; // 公交站ID
@property (nonatomic, strong) NSString *name; // 站名
@property (nonatomic, assign) NSInteger sequence; // 公交站序号
@property (nonatomic, strong) NSString *citycode; // 城市编码
@property (nonatomic, strong) NSString *adcode; // 区域编码
@property (nonatomic, strong) NSString *gridcode; // 地理格ID / *暂未开通 */
@property (nonatomic, strong) AMapGeoPoint *location; // 经纬度
@property (nonatomic, strong) NSString *timestamp; // 时间戳 / *暂未开通 */
@property (nonatomic, strong) NSArray *buslines; // 途径此站的公交路线 AMapBusLine 数组 

@end

/*!
 @brief 公交线路
 */
@interface AMapBusLine : NSObject

// basic:
@property (nonatomic, strong) NSString *uid; // 公交线路ID
@property (nonatomic, strong) NSString *name; // 线路名称
@property (nonatomic, strong) NSString *type; // 公交类型
@property (nonatomic, strong) NSString *polyline; // 坐标串定义
@property (nonatomic, strong) NSString *citycode; // 城市编码
@property (nonatomic, strong) NSString *gridcode; // 地理格ID / *暂未开通 */
@property (nonatomic, strong) AMapBusStop *startStop; // 首发站
@property (nonatomic, strong) AMapBusStop *endStop; // 终点站

// extensions:
@property (nonatomic, strong) NSString *startTime; // 首班车时间
@property (nonatomic, strong) NSString *endTime; // 末班车时间
@property (nonatomic, strong) NSString *company; // 所属公交公司
@property (nonatomic, assign) float distance; // 全程里程（单位：千米）
@property (nonatomic, assign) NSInteger duration; // 预计行驶时间（单位：秒）
@property (nonatomic, assign) float basicPrice; // 起步价
@property (nonatomic, assign) float totalPrice; // 全程票价
@property (nonatomic, strong) NSArray *bounds; // 矩形区域左下、右上顶点坐标 AMapGeoPoint 数组
@property (nonatomic, assign) NSInteger busStopsNum; // 途径公交站数
@property (nonatomic, strong) NSArray *busStops; // 途经公交站 AMapBusStop数组
@property (nonatomic, strong) AMapBusStop *departureStop; // 起程站
@property (nonatomic, strong) AMapBusStop *arrivalStop; // 下车站

@end

/*!
 @brief 输入提示
 */
@interface AMapTip : NSObject

@property (nonatomic, strong) NSString *name; // 名称
@property (nonatomic, strong) NSString *adcode; // 区域编码
@property (nonatomic, strong) NSString *district; // 所属区域

+ (AMapTip *)tipWithName:(NSString *)name adcode:(NSString *)adcode district:(NSString *)district;

@end

/*!
 @brief 地理编码
 */
@interface AMapGeocode : NSObject

@property (nonatomic, strong) NSString *formattedAddress; // 格式化地址
@property (nonatomic, strong) NSString *province; // 所在省
@property (nonatomic, strong) NSString *city; // 城市名
@property (nonatomic, strong) NSString *district; // 区域名称
@property (nonatomic, strong) NSString *township; // 所在乡镇
@property (nonatomic, strong) NSString *neighborhood; // 社区
@property (nonatomic, strong) NSString *building; // 楼
@property (nonatomic, strong) NSString *adcode; // 区域编码
@property (nonatomic, strong) AMapGeoPoint *location; // 坐标点
@property (nonatomic, strong) NSArray *level; // 匹配的等级 NSString 数组

@end

/*!
 @brief 道路
 */
@interface AMapRoad : NSObject

@property (nonatomic, strong) NSString *uid; // 道路ID
@property (nonatomic, strong) NSString *name; // 道路名称
@property (nonatomic, assign) NSInteger distance; // 距离（单位：米）
@property (nonatomic, strong) NSString *direction; // 方向
@property (nonatomic, strong) AMapGeoPoint *location; // 坐标点
@property (nonatomic, strong) NSString *citycode; // 城市编码
@property (nonatomic, strong) NSString *width; // 道路宽度
@property (nonatomic, strong) NSString *type; // 道路分类

@end

/*!
 @brief 道路交叉口
 */
@interface AMapRoadInter : NSObject

@property (nonatomic, assign) NSInteger distance; // 距离（单位：米）
@property (nonatomic, strong) NSString *direction; // 方向
@property (nonatomic, strong) AMapGeoPoint *location; // 经纬度
@property (nonatomic, strong) NSString *firstId; // 第一条道路ID
@property (nonatomic, strong) NSString *firstName; // 第一条道路名称
@property (nonatomic, strong) NSString *secondId; // 第二条道路ID
@property (nonatomic, strong) NSString *secondName; // 第二条道路名称

@end

/*!
 @brief 门牌信息
 */
@interface AMapStreetNumber : NSObject

@property (nonatomic, strong) NSString *street; // 街道名称
@property (nonatomic, strong) NSString *number; // 门牌号
@property (nonatomic, strong) AMapGeoPoint *location; //  坐标点
@property (nonatomic, assign) NSInteger distance; // 距离（单位：米）
@property (nonatomic, strong) NSString *direction; //  方向

@end

/*!
 @brief 地址组成要素
 */
@interface AMapAddressComponent : NSObject

@property (nonatomic, strong) NSString *province; // 省
@property (nonatomic, strong) NSString *city; // 市
@property (nonatomic, strong) NSString *district; // 区
@property (nonatomic, strong) NSString *township; // 乡镇
@property (nonatomic, strong) NSString *neighborhood; // 社区
@property (nonatomic, strong) NSString *building; // 建筑
@property (nonatomic, strong) NSString *citycode; // 城市编码
@property (nonatomic, strong) NSString *adcode; // 区域编码
@property (nonatomic, strong) AMapStreetNumber *streetNumber; // 门牌信息

@property (nonatomic, strong) NSArray *businessAreas; //商圈列表 AMapBusinessArea数组

@end

/*!
 @brief 商圈
 */
@interface AMapBusinessArea : NSObject

@property (nonatomic, strong) NSString *name; // 名称
@property (nonatomic, strong) AMapGeoPoint *location; // 中心坐标

@end

/*!
 @brief 逆地理编码
 */
@interface AMapReGeocode : NSObject

// basic:
@property (nonatomic, strong) NSString *formattedAddress; // 格式化地址
@property (nonatomic, strong) AMapAddressComponent *addressComponent; // 地址组成要素

// extensions:
@property (nonatomic, strong) NSArray *roads; // 道路信息 AMapRoad数组
@property (nonatomic, strong) NSArray *roadinters; // 道路路口信息 AMapRoadInter 数组
@property (nonatomic, strong) NSArray *pois; // 兴趣点信息 AMapPOI数组

@end

#pragma mark - #导航结果数据类型

/*!
 @brief 实时路况信息
 */
@interface AMapTMC : NSObject

@property (nonatomic, strong) NSString *lcode; // 路况信息对应的locationcode
@property (nonatomic, assign) NSInteger distance; // 路段长度（单位：米）
@property (nonatomic, assign) NSInteger status; // 路况状态：0-未知；1-畅通；2-缓行；3-拥堵

+ (AMapTMC *)TMCWithLCode:(NSString *)lcode distance:(NSInteger)distance status:(NSInteger)status;

@end

/*!
 @brief 导航路段
 */
@interface AMapStep : NSObject

// basic:
@property (nonatomic, strong) NSString *instruction; // 行走指示
@property (nonatomic, strong) NSString *orientation; // 方向
@property (nonatomic, strong) NSString *road; // 道路名称
@property (nonatomic, assign) NSInteger distance; // 此路段长度（单位：米）
@property (nonatomic, assign) NSInteger duration; // 此路段预计耗时（单位：秒）
@property (nonatomic, strong) NSString *polyline; // 此路段坐标点串
@property (nonatomic, strong) NSString *action; // 导航主要动作
@property (nonatomic, strong) NSString *assistantAction; // 导航辅助动作
@property (nonatomic, assign) CGFloat tolls; // 此段收费（单位：元）
@property (nonatomic, assign) NSInteger tollDistance; // 收费路段长度（单位：米）
@property (nonatomic, strong) NSString *tollRoad; // 主要收费路段

// extensions:
@property (nonatomic, strong) NSArray *tmcs; // 路况信息 AMapTMC 数组
@property (nonatomic, strong) NSArray *cities; // 途径城市 AMapCity 数组

@end

/*!
 @brief 步行、驾车方案
 */
@interface AMapPath : NSObject

@property (nonatomic, assign) NSInteger distance; // 起点和终点的距离
@property (nonatomic, assign) NSInteger duration; // 预计耗时（单位：秒）
@property (nonatomic, strong) NSString *strategy; // 导航策略
@property (nonatomic, strong) NSArray *steps; // 导航路段 AMapStep数组
@property (nonatomic, assign) CGFloat tolls; // 此方案费用（单位：元）
@property (nonatomic, assign) NSInteger tollDistance; // 此方案收费路段长度（单位：米）

@end

/*!
 @brief 导航方案
 */
@interface AMapRoute : NSObject

@property (nonatomic, strong) AMapGeoPoint *origin; // 起点坐标
@property (nonatomic, strong) AMapGeoPoint *destination; // 终点坐标
@property (nonatomic, assign) CGFloat taxiCost; // 出租车费用（单位：元）
@property (nonatomic, strong) NSArray *paths; // 步行、驾车方案列表 AMapPath 数组
@property (nonatomic, strong) NSArray *transits; // 公交换乘方案列表 AMapTransit 数组

@end

/*!
 @brief 步行导航信息
 */
@interface AMapWalking : NSObject

@property (nonatomic, strong) AMapGeoPoint *origin; // 起点坐标
@property (nonatomic, strong) AMapGeoPoint *destination; // 终点坐标
@property (nonatomic, assign) NSInteger distance; // 起点和终点的步行距离
@property (nonatomic, assign) NSInteger duration; // 步行预计时间
@property (nonatomic, strong) NSArray *steps; // 步行路段 AMapStep数组

@end

/*!
 @brief 公交换乘路段
 */
@interface AMapSegment : NSObject

@property (nonatomic, strong) AMapWalking *walking; // 此路段步行导航信息
@property (nonatomic, strong) AMapBusLine *busline; // 此路段公交导航信息
@property (nonatomic, strong) NSString *enterName; // 入口名称
@property (nonatomic, strong) AMapGeoPoint *enterLocation; // 入口经纬度
@property (nonatomic, strong) NSString *exitName; // 出口名称
@property (nonatomic, strong) AMapGeoPoint *exitLocation; // 出口经纬度

@end

/*!
 @brief 公交方案
 */
@interface AMapTransit : NSObject

@property (nonatomic, assign) CGFloat cost; // 此公交方案价格（单位：元）
@property (nonatomic, assign) NSInteger duration; // 此换乘方案预期时间（单位：秒）
@property (nonatomic, assign) BOOL nightflag; // 是否是夜班车
@property (nonatomic, assign) NSInteger walkingDistance; // 此方案总步行距离（单位：米）
@property (nonatomic, strong) NSArray *segments; // 换乘路段 AMapSegment数组

@end

#pragma mark - 意图分析相关

/*!
 @brief 出发点/终点
 */
@interface AMapWPoint : NSObject

@property (nonatomic, strong) NSString *name; // 名称
@property (nonatomic, strong) NSArray *pois;

@end

/*!
 @brief 出发点/终点集合
 */
@interface AMapWayPoint : NSObject

@property (nonatomic, strong) AMapWPoint *origin; // 起点
@property (nonatomic, strong) AMapWPoint *destination; // 终点

@end


