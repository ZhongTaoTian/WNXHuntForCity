//
//  WNXMapViewController.m
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/18.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import "WNXMapViewController.h"
#import <MAMapKit/MAMapKit.h>

@interface WNXMapViewController () <MAMapViewDelegate>

/** 地图的view */
@property (nonatomic, strong) MAMapView *mapView;

@end

@implementation WNXMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MAMapServices sharedServices].apiKey = @"2e6b9f0a88b4a79366a13ce1ee9688b8";
    
    self.mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    _mapView.delegate = self;
    [self.view addSubview:_mapView];
}

@end
