//
//  WNXMapViewController.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/7/18.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  地图控制器,这里原生app做的很细致,好多图片都是在服务器获取,然后添加到地图图层

#import "WNXMapViewController.h"
#import <MAMapKit/MAMapKit.h>

@interface WNXMapViewController () <MAMapViewDelegate>

/** 地图的view */
@property (nonatomic, strong) MAMapView *mapView;
/** 顶部导航条 (多处用到这个都应该封装起来)*/
@property (nonatomic, strong) UIView *navView;
/** 返回按钮 */
@property (nonatomic, strong) UIButton *backBtn;
/** 返回文字 */
@property (nonatomic, strong) UILabel *backTitleLabel;

@end

@implementation WNXMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //重新定义导航条的状态
    [MAMapServices sharedServices].apiKey = @"2e6b9f0a88b4a79366a13ce1ee9688b8";
    
    self.mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    _mapView.delegate = self;
    self.mapView.showsScale = NO;
    self.mapView.showsCompass = NO;
    self.mapView.showsUserLocation = YES;

    [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(39.906598, 116.400673) animated:YES];
    self.mapView.zoomLevel = 16;
    [self.view addSubview:_mapView];
    
    //添加自定义图片
    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
    pointAnnotation.coordinate = CLLocationCoordinate2DMake(39.906598, 116.400673);
    [_mapView addAnnotation:pointAnnotation];

    //判断当前导航条是否被隐藏了,如果被隐藏 添加自定义的导航条
    if (self.navigationController.navigationBar.hidden) {
    
        //添加山寨导航条
        self.navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WNXAppWidth, 64)];
        self.navView.backgroundColor = WNXGolbalGreen;
        [self.view addSubview:self.navView];
        
        //返回按钮这里应该将自定义的导航条封装起来,时间匆忙就先直接复制过来了
        self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.backBtn.frame = CGRectMake(10, 30, 25, 25);
        [self.backBtn addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self.backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [self.view addSubview:self.backBtn];
        
        self.backTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 28, WNXAppWidth - 60, 30)];
        self.backTitleLabel.textColor = [UIColor whiteColor];
        self.backTitleLabel.font = [UIFont systemFontOfSize:20];
        
        self.backTitleLabel.text = @"东长安街16号天安门广场东侧";
        [self.view addSubview:self.backTitleLabel];
    }
    
}

- (void)backButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *reuseIndetifier = @"annotationReuseIndetifier";
        MAAnnotationView *annotationView = (MAAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
        if (annotationView == nil)
        {
            annotationView = [[MAAnnotationView alloc] initWithAnnotation:annotation
                                                          reuseIdentifier:reuseIndetifier];
        }
        annotationView.image = [UIImage imageNamed:@"map_activity"];
        //设置中⼼心点偏移，使得标注底部中间点成为经纬度对应点
        annotationView.centerOffset = CGPointMake(0, -18);
        return annotationView;
    }
    return nil;
}

//清空地图的缓存
- (void)dealloc
{
    [self.mapView clearDisk];
}

@end
