//
//  CZStatusView.h
//  CZStatusView
//
//  Created by yunshan on 2019/4/22.
//  Copyright © 2019 ChenZhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CZStatusViewDelegate <NSObject>

/**
 @brief 点击视图事件
 */
-(void)dlTapReloadAction;

@end

NS_ASSUME_NONNULL_BEGIN

@interface CZStatusView : UIView
@property (nonatomic, weak) id<CZStatusViewDelegate> delegate;

/**
 @breif 更新状态视图显示信息(图片对象)
 
 @param title 标题 空传nil
 @param content 描述
 @param image 图片对象
 @param imgUrl 网络地址
 @param imgSize 图片尺寸 没有则填CGSizeZero
 */
-(void)updateTitle:(NSString * _Nullable)title content:(NSString * _Nullable)content image:(UIImage * _Nullable)image imgUrl:(NSString * _Nullable)imgUrl imgSize:(CGSize)imgSize btnText:(NSString * _Nullable)btnText;
@end

NS_ASSUME_NONNULL_END
