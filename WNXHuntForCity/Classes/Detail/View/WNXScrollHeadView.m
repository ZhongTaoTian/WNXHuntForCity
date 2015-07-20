//
//  WNXScrollHeadView.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/7/3.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  详情页面的顶部View,用于展示动画于图片

#import "WNXScrollHeadView.h"
#import "UIImageView+WebCache.h"

@interface WNXScrollHeadView() <UIScrollViewDelegate>

@property (nonatomic, strong) UIPageControl *pageView;
@property (nonatomic, strong) NSArray *images;

@end

@implementation WNXScrollHeadView

//便利构造方法
+ (instancetype)scrollHeadViewWithImages:(NSArray *)images
{
    WNXScrollHeadView *headView = [[self alloc] init];
    
    headView.images = images;
    
    return headView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //初始化
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.delegate = self;
    }

    return self;
}

//初始化控件
- (void)didMoveToSuperview
{
    [super didMoveToSuperview];
    /**
     *在setImages， setFrame，和layoutSubViews都尝试了下加载都不可以，因为pageView需要和self在同一个父控件中
     *只有在即将显示到父控件的时候父控件不为空，所以在这个方法初始化pageView
     */
    //初始化pageView
    self.pageView = [[UIPageControl alloc] init];
    self.pageView.hidesForSinglePage = YES;
    CGFloat x = 0;
    CGFloat y = self.bounds.size.height - 25;
    CGFloat w = self.bounds.size.width;
    CGFloat h = 25;
    self.pageView.frame = CGRectMake(x, y, w, h);
    [self.superview insertSubview:self.pageView aboveSubview:self];
    
    NSInteger count = self.images.count;
    //NSAssert(count > 0, @"最少有1个图片");
    int i = 0;
    for (NSString *urlStr in self.images) {
        //获取网络请求路径
        NSURL *url = [NSURL URLWithString:urlStr];
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:self.bounds];
        imageV.contentMode = UIViewContentModeScaleToFill;
        [imageV sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"ImageLodingFailed_6P"]];
        //oa_loding6
        
        CGFloat w = self.bounds.size.width;
        CGFloat h = self.bounds.size.height;
        imageV.frame = CGRectMake(i * w, 0, w, h);
        
        [self insertSubview:imageV atIndex:i];
        i++;
    }
    
    //初始化自定义的导航view
    self.naviView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, w * count, self.bounds.size.height)];
    self.naviView.backgroundColor = WNXGolbalGreen;
    self.naviView .alpha = 0.0;
    self.naviView = self.naviView;
    [self.superview insertSubview:self.naviView aboveSubview:self.pageView];
    
    if (count <= 1) return;
    
    //如果图片个数大于1设置scrollView的contentSize和pageView的num,根据图片
    self.pageView.numberOfPages =count;
    self.contentSize = CGSizeMake(count * self.bounds.size.width, 0);

}

- (void)headViewDidScroll:(CGRect)rect headViewHeight:(CGFloat)height
{
    CGFloat x = 0;
    CGFloat y = rect.origin.y - 25 + height;
    CGFloat w = self.bounds.size.width;
    CGFloat h = 25;
    self.pageView.frame = CGRectMake(x, y, w, h);
    
    CGRect navViewRect = self.naviView.frame;
    navViewRect.origin.y = rect.origin.y;
    self.naviView.frame = navViewRect;
}

#pragma mark - ScrollViewDelegate
//监听scrollView滚动，改变pageView
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    self.pageView.currentPage = offsetX / self.bounds.size.width;
}

@end
