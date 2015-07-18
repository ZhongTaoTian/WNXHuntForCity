//
//  WNXSetingView.h
//  WNXHuntForCity
//
//  Created by MacBook on 15/7/9.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import <UIKit/UIKit.h>

//WNXSetingView的类型
typedef NS_ENUM(NSInteger, WNXSetingViewType) {
    WNXSetingViewTypeSina = 100,    //新浪登录
    WNXSetingViewTypeWeiXin,        //微信登录
    WNXSetingViewTypeClean,         //清理缓存
    WNXSetingViewTypeFeedback,      //反馈吐槽
    WNXSetingViewTypeJudge          //五星好评

};

@interface WNXSetingView : UIView

+ (instancetype)setingViewWihtTitle:(NSString *)title defaultImage:(NSString *)imageName;

/** 登陆成功 设置左边按钮的图片 以及右边label的文字 */
- (void)setleftBtnLoginImage:(UIImage *)image rightLabelText:(NSString *)rightText;

@end
