//
//  MAMapURLSearchType.h
//  MAMapKitNew
//
//  Created by xiaoming han on 15/5/25.
//  Copyright (c) 2015年 xiaoming han. All rights reserved.
//

#ifndef MAMapKitNew_MAMapURLSearchType_h
#define MAMapKitNew_MAMapURLSearchType_h

/// 驾车策略
typedef NS_ENUM(NSInteger, MADrivingStrategy)
{
    MADrivingStrategyFastest  = 0, //速度最快
    MADrivingStrategyMinFare  = 1, //避免收费
    MADrivingStrategyShortest = 2, //距离最短
    
    MADrivingStrategyNoHighways   = 3, //不走高速
    MADrivingStrategyAvoidCongestion = 4, //躲避拥堵
    
    MADrivingStrategyAvoidHighwaysAndFare    = 5, //不走高速且避免收费
    MADrivingStrategyAvoidHighwaysAndCongestion = 6, //不走高速且躲避拥堵
    MADrivingStrategyAvoidFareAndCongestion  = 7, //躲避收费和拥堵
    MADrivingStrategyAvoidHighwaysAndFareAndCongestion = 8 //不走高速躲避收费和拥堵
};

/// 公交策略
typedef NS_ENUM(NSInteger, MATransitStrategy)
{
    MATransitStrategyFastest = 0,//最快捷
    MATransitStrategyMinFare = 1,//最经济
    MATransitStrategyMinTransfer = 2,//最少换乘
    MATransitStrategyMinWalk = 3,//最少步行
    MATransitStrategyMostComfortable = 4,//最舒适
    MATransitStrategyAvoidSubway = 5,//不乘地铁
};

/// 路径规划类型
typedef NS_ENUM(NSInteger, MARouteSearchType)
{
    MARouteSearchTypeDriving = 0, //驾车
    MARouteSearchTypeTransit = 1, //公交
    MARouteSearchTypeWalking = 2, //步行
};

#endif
