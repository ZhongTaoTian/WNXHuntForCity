//
//  WNXLeftMenuView.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/6/28.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import <UIKit/UIKit.h>

//LeftView按钮类型
typedef NS_ENUM(NSInteger, WNXleftButtonType) {
    WNXleftButtonTypeHome = 0,
    WNXleftButtonTypeFound,
    WNXleftButtonTypeIcon,
    WNXleftButtonTypeSina,
    WNXleftButtonTypeWeiXin,
    WNXleftButtonTypeMessage,
    WNXleftButtonTypeSeting
};

@protocol WNXLeftMenuViewDelegate <NSObject>

@optional

//左边按钮被点击时调用
- (void)leftMenuViewButtonClcikFrom:(WNXleftButtonType)fromIndex to:(WNXleftButtonType)toIndex;

//cictyBtn城市改变时调用
//- (void)leftMenuViewCictyButtonChange:(NSString *)cicty;

@end

@interface WNXLeftMenuView : UIView

@property (nonatomic, weak) id <WNXLeftMenuViewDelegate> delegate;

- (void)coverIsRemove;

@end
