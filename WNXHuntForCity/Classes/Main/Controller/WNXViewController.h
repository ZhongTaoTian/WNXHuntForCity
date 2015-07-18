//
//  WNXViewController.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/6/30.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^coverDidRomove)();

@interface WNXViewController : UIViewController

//** 遮盖按钮 */
@property (nonatomic, strong) UIButton *coverBtn;

@property (nonatomic, strong) coverDidRomove coverDidRomove;

@property (nonatomic, assign) BOOL isScale;

- (void)coverClick;

/** 点击缩放按钮 */
- (void)rightClick;

@end
