//
//  WNXRenderBlurView.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/7/16.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import "WNXRenderBlurView.h"
#import "WNXBlurCell.h"

@interface WNXRenderBlurView () <UICollectionViewDataSource, UICollectionViewDelegate>

#ifdef iOS8
/** 用来模糊背景的特效 */
@property (nonatomic, strong) UIVisualEffectView *effectview;
#endif

/** 模糊view里面的UICollectionView */
@property (nonatomic, strong) UICollectionView *collectionView;

/** 底部的X按钮 */
@property (nonatomic, strong) UIButton *cancelBtn;

@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation WNXRenderBlurView

- (NSMutableArray *)datas
{
    if (_datas == nil) {
        _datas = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"blurData" ofType:@"plist"];
        NSArray *tmpArr = [NSMutableArray arrayWithContentsOfFile:path];
        
        for (NSArray *array in tmpArr) {
            NSMutableArray *arr = [NSMutableArray array];
            for (NSDictionary *dic in array) {
                WNXFoundCellModel *foundModel = [WNXFoundCellModel foundCellModelWihtDict:dic];
                [arr addObject:foundModel];
            }
            [_datas addObject:arr];
        }
    }
    
    return _datas;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        self.alpha = 0;
        if (iOS8) {
            [self addSubview:self.effectview];
        }
        self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.cancelBtn setImage:[UIImage imageNamed:@"searchList_btn_delete_6P"] forState:UIControlStateNormal];
        self.cancelBtn.frame = CGRectMake((WNXAppWidth - 30) / 2, WNXAppHeight - 64 - 50, 30, 30);
        [self.cancelBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.cancelBtn];
        
        //初始化内部的collectionView
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        CGFloat itemWH = 100;
        layout.itemSize = CGSizeMake(itemWH, itemWH);
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 20;

        CGFloat marginLR = (WNXAppWidth - 3 * itemWH) / 4;
        layout.sectionInset = UIEdgeInsetsMake(20, marginLR, 20, marginLR);
        
        self.collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.collectionView];
        
        [self.collectionView registerNib:[UINib nibWithNibName:@"WNXBlurCell" bundle:nil] forCellWithReuseIdentifier:@"blurCell"];
    }
    
    return self;
}

#ifdef iOS8
- (UIVisualEffectView *)effectview
{
    if (_effectview == nil) {
        UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        _effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
        _effectview.frame = [[UIScreen mainScreen] bounds];
        _effectview.contentView.backgroundColor = [UIColor greenColor];
        _effectview.contentView.alpha = 0.0;
    }
    
    return _effectview;
}
#endif

+ (instancetype)renderBlurViewWithImage:(UIImage *)image
{
    WNXRenderBlurView *view = [[self alloc] init];
    [view setImage:image];
    return view;
}

//X号被点击
- (void)cancelBtnClick
{
    //这里应该根据切换不同按钮更换不同的collView
    if ([self.delegate respondsToSelector:@selector(renderBlurViewCancelBtnClick:)]) {
        [self.delegate renderBlurViewCancelBtnClick:self];
    }
    [self hideBlurView];
}

//隐藏模糊的view
- (void)hideBlurView
{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark UICollectionViewDataSource UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.datas[0] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //取出cell对应的模型
    WNXFoundCellModel *foundModel = self.datas[0][indexPath.row];
    
    //取出cell
    WNXBlurCell *cell = [WNXBlurCell blurCellWithCollectionView:collectionView forIndexPath:indexPath];
    
    cell.model = foundModel;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    WNXBlurCell *cell = (WNXBlurCell *)[collectionView cellForItemAtIndexPath:indexPath];

    if ([self.delegate respondsToSelector:@selector(renderBlurView:didSelectedCellWithTitle:)]) {
        [self.delegate renderBlurView:self didSelectedCellWithTitle:cell.model.title];
    }
    [self hideBlurView];
}

#pragma mark - 布局

- (void)layoutSubviews
{
    [super layoutSubviews];
    //这种布局是错误的 应该根据之前顶部的选着view和底部的X的高度算出来
    self.collectionView.frame = CGRectMake(0, self.bounds.origin.y + 60, WNXAppWidth, self.bounds.size.height - 60 - 50);
}

@end
