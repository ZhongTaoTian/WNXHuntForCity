//
//  WNXFoundViewController.m
//  WNXHuntForCity
//  github:    https://github.com/ZhongTaoTian/WNXHuntForCity
//  项目讲解博客:http://www.jianshu.com/p/8b0d694d1c69
//  Created by MacBook on 15/6/30.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  发现

#import "WNXFoundViewController.h"
#import "WNXFoundCollectionViewCell.h"
#import "WNXHeadCollectionReusableView.h"
#import "WNXFoundCellModel.h"
#import "WNXShowViewController.h"

@interface WNXFoundViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, WNXFoundCollectionViewCell>

/** 展示button的colletView */
@property (nonatomic, strong) UICollectionView *colletView;

/** 数据,懒加载,正常情况是先发送网络请求，将服务器返回的数据解析赋值给模型在装入数组中 这里我直接写入的plist假数据 */
@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation WNXFoundViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //设置UI
    [self setUpUI];
}

//datas懒加载
- (NSMutableArray *)datas
{
    if (_datas == nil) {
        _datas = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"foundData" ofType:@"plist"];
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

- (void)setUpUI
{
    //设置导航title
    self.navigationItem.title = @"发现";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    //初始化colletionView的布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    CGFloat itemW = 100.0;
    CGFloat itemH = 135;
    // cell的大小
    layout.itemSize = CGSizeMake(itemW, itemH);
    
    //最小左右间距
    layout.minimumInteritemSpacing = 0;
    //最小上下间距
    layout.minimumLineSpacing = 20;
    //每个headView的大小
    layout.headerReferenceSize = CGSizeMake(self.view.bounds.size.width, 50);
    //内边距
    CGFloat marginLR = (WNXAppWidth - 3 * itemW) / 4;
    layout.sectionInset = UIEdgeInsetsMake(20, marginLR, 20, marginLR);
    
    //初始化collectionView
    CGRect rect = self.view.bounds;
    rect.size.height -= 64;
    self.colletView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:layout];
    //设置代理
    self.colletView.delegate = self;
    self.colletView.dataSource = self;
    self.colletView.backgroundColor = [UIColor whiteColor];
    
    //注册headView
    [self.colletView registerClass:[WNXHeadCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head"];
    //注册cell
    [self.colletView registerNib:[UINib nibWithNibName:@"WNXFoundCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"iconCell"];
    
    [self.view addSubview:self.colletView];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.datas[section] count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.datas.count;
}

//返回collectionView的headView和footView
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //取出headView
    WNXHeadCollectionReusableView *head = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head" forIndexPath:indexPath];
    /* 正常情况下应该交给模型来管理headView的数据，这里因为就俩个headView，所以直接写死的数据
       如果headView比较多建议用模型了管理，便于扩展和修改*/
    if (indexPath.section == 0) {
        head.textLabel.text = @"分类";
        head.lineView.hidden = YES;
    } else {
        head.textLabel.text = @"地区";
        head.lineView.hidden = NO;
    }
    
    return head;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //取出cell对应的模型
    WNXFoundCellModel *foundModel = self.datas[indexPath.section][indexPath.row];
    
    //取出cell
    WNXFoundCollectionViewCell *cell = [WNXFoundCollectionViewCell cellWithCollectionView:collectionView forIndexPath:indexPath];
    cell.delegate = self;
    cell.foundModel = foundModel;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return  CGSizeMake(375, 10);
    } else {
        return CGSizeMake(375, 100);
    }
    
}

#pragma mark - WNXFoundCollectionViewCellDelegate
//cell的点击事件
- (void)foundCollectionViewCell:(WNXFoundCollectionViewCell *)cell
{
    WNXShowViewController *foundPushVC = [[WNXShowViewController alloc] init];
    foundPushVC.title = cell.foundModel.title;
    [self.navigationController pushViewController:foundPushVC animated:YES];
}


@end
