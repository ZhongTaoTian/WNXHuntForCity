//
//  AMapSearchAPI.h
//  searchKitV3
//
//  Created by yin cai on 13-7-4.
//  Copyright (c) 2013年 Autonavi. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "AMapSearchObj.h"

@protocol AMapSearchDelegate;

typedef NS_ENUM(NSInteger, AMapSearchLanguage)
{
    AMapSearchLanguage_en = 0,
    AMapSearchLanguage_zh_CN = 1,
};

#pragma mark - AMapSearchAPI Interface

@interface AMapSearchAPI : NSObject

/*!
 @brief 实现了AMapSearchDelegate协议的类指针
 */
@property (nonatomic, assign) id<AMapSearchDelegate> delegate;

/*!
 @brief 查询超时时间 默认超时时间20秒
 */
@property (nonatomic, assign) NSInteger timeOut;

/*!
 @brief 查询结果返回语言
 */
@property (nonatomic, assign) AMapSearchLanguage language;

/*!
 @brief AMapSearch的初始化函数。注意，请不要直接使用init进行初始化，会因为有些属性没有初始化而发生错误。
 @param key 搜索模块鉴权Key(详情请访问 http://api.amap.com/ )
 @param delegate 实现AMapSearchDelegate协议的对象id
 @return AMapSearch类对象id
 */
- (id)initWithSearchKey:(NSString *)key Delegate:(id<AMapSearchDelegate>)delegate;

/*!
 @brief  POI查询接口函数，即根据 POI 参数选项进行 POI 查询。
 @param request 查询选项。具体属性字段请参考 AMapPlaceSearchRequest 类。
 */
- (void)AMapPlaceSearch:(AMapPlaceSearchRequest *)request;

/*!
 @brief  路径规划查询接口。
 @param request  查询选项。具体属性字段请参考 AMapNavigationSearchRequest 类。
 */
- (void)AMapNavigationSearch:(AMapNavigationSearchRequest *)request;

/*!
 @brief  输入提示查询接口。
 @param request 查询选项。具体属性字段请参考 AMapInputTipsSearchRequest 类。
 */
- (void)AMapInputTipsSearch:(AMapInputTipsSearchRequest *)request;

/*!
 @brief  地址编码查询接口。
 @param request 查询选项。具体属性字段请参考 AMapGeocodeSearchRequest 类。
 */
- (void)AMapGeocodeSearch:(AMapGeocodeSearchRequest *)request;

/*!
 @brief  逆地址编码查询接口。
 @param request 查询选项。具体属性字段请参考 AMapReGeocodeSearchRequest 类。
 */
- (void)AMapReGoecodeSearch:(AMapReGeocodeSearchRequest *)request;

/*!
 @brief  公交线路查询接口。
 @param request 查询选项。具体属性字段请参考 AMapBusLineSearchRequest 类。
 */
- (void)AMapBusLineSearch:(AMapBusLineSearchRequest *)request;

/*!
 @brief  公交车站查询接口。
 @param request 查询选项。具体属性字段请参考 AMapBusStopSearchRequest 类。
 */
- (void)AMapBusStopSearch:(AMapBusStopSearchRequest *)request;

/*!
 @brief  行政区域查询接口。
 @param request 查询选项。具体属性字段请参考 AMapDistrictSearchRequest 类。
 */
- (void)AMapDistrictSearch:(AMapDistrictSearchRequest *)request;

@end

#pragma mark - AMapSearchDelegate

/** AMapSearch errorCode */
typedef NS_ENUM(NSInteger, AMapSearchErrorCode)
{
    AMapSearchErrorUnknown                  = 1, // 未知错误
    AMapSearchErrorInvalidSCode             = 2, // 安全码验证错误
    AMapSearchErrorInvalidKey               = 3, // key非法或过期
    AMapSearchErrorInvalidService           = 4, // 请求服务不存在
    AMapSearchErrorInvalidResponse          = 5, // 请求服务响应错误
    AMapSearchErrorInsufficientPrivileges   = 6, // 无权限访问此服务
    AMapSearchErrorOverQuota                = 7, // 请求超出配额
    AMapSearchErrorInvalidParams            = 8, // 请求参数非法
    AMapSearchErrorInvalidProtocol          = 9, // 协议解析错误
    AMapSearchErrorTimeOut                  = 10, // 连接超时
    AMapSearchErrorCannotFindHost           = 11, // 找不到主机
    AMapSearchErrorBadURL                   = 12, // URL异常
    AMapSearchErrorNotConnectedToInternet   = 13, // 连接异常
    AMapSearchErrorCannotConnectToHost      = 14, // 服务器连接失败
};

/** AMapSearch errorDomain */
extern NSString *const AMapSearchErrorDomain;

/** AMapSearchDelegate协议类，从NSObject类继承. */
@protocol AMapSearchDelegate<NSObject>

@optional

/*!
 当请求发生错误时，会调用代理的此方法.
 @param request 发生错误的请求.
 @param error   返回的错误.
 */
- (void)searchRequest:(id)request didFailWithError:(NSError *)error;

/*!
 @brief POI查询回调函数
 @param request 发起查询的查询选项(具体字段参考AMapPlaceSearchRequest类中的定义)
 @param response 查询结果(具体字段参考AMapPlaceSearchResponse类中的定义)
 */
- (void)onPlaceSearchDone:(AMapPlaceSearchRequest *)request response:(AMapPlaceSearchResponse *)response;

/*!
 @brief 路径规划查询回调函数
 @param request 发起查询的查询选项(具体字段参考AMapNavigationSearchRequest类中的定义)
 @param response 查询结果(具体字段参考AMapNavigationSearchResponse类中的定义)
 */
- (void)onNavigationSearchDone:(AMapNavigationSearchRequest *)request response:(AMapNavigationSearchResponse *)response;

/*!
 @brief 输入提示查询回调函数
 @param request 发起查询的查询选项(具体字段参考AMapInputTipsSearchRequest类中的定义)
 @param response 查询结果(具体字段参考AMapInputTipsSearchResponse类中的定义)
 */
- (void)onInputTipsSearchDone:(AMapInputTipsSearchRequest *)request response:(AMapInputTipsSearchResponse *)response;

/*!
 @brief 地理编码查询回调函数
 @param request 发起查询的查询选项(具体字段参考AMapGeocodeSearchRequest类中的定义)
 @param response 查询结果(具体字段参考AMapGeocodeSearchResponse类中的定义)
 */
- (void)onGeocodeSearchDone:(AMapGeocodeSearchRequest *)request response:(AMapGeocodeSearchResponse *)response;

/*!
 @brief 逆地理编码查询回调函数
 @param request 发起查询的查询选项(具体字段参考AMapReGeocodeSearchRequest类中的定义)
 @param response 查询结果(具体字段参考AMapReGeocodeSearchResponse类中的定义)
 */
- (void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response;

/*!
 @brief 公交线路查询回调函数
 @param request 发起查询的查询选项(具体字段参考AMapBusLineSearchRequest类中的定义)
 @param response 查询结果(具体字段参考AMapBusLineSearchResponse类中的定义)
 */
- (void)onBusLineSearchDone:(AMapBusLineSearchRequest *)request response:(AMapBusLineSearchResponse *)response;

/*!
 @brief 公交站查询回调函数
 @param request 发起查询的查询选项(具体字段参考AMapBusStopSearchRequest类中的定义)
 @param response 查询结果(具体字段参考AMapBusStopSearchResponse类中的定义)
 */
- (void)onBusStopSearchDone:(AMapBusStopSearchRequest *)request response:(AMapBusStopSearchResponse *)response;

/*!
 @brief 行政区域查询回调函数
 @param request 发起查询的查询选项(具体字段参考AMapDistrictSearchRequest类中的定义)
 @param response 查询结果(具体字段参考AMapDistrictSearchResponse类中的定义)
 */
- (void)onDistrictSearchDone:(AMapDistrictSearchRequest *)request response:(AMapDistrictSearchResponse *)response;


@end


