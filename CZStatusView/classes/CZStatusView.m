//
//  CZStatusView.m
//  CZStatusView
//
//  Created by yunshan on 2019/4/22.
//  Copyright © 2019 ChenZhe. All rights reserved.
//

#import "CZStatusView.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <CZConfig/CZConfig.h>
#import <CZCategorys/NSString+CZCategory.h>
#import <CZCategorys/UIView+CZCategory.h>

@interface CZStatusView ()
/**
 @brief 容器视图
 */
@property (nonatomic, strong) UIView * containerView;
/**
 @brief 图片
 */
@property (nonatomic, strong) UIImageView * imgView;
/**
 @brief 标题文本
 */
@property (nonatomic, strong) UILabel * titleLabel;
/**
 @brief 描述文本
 */
@property (nonatomic, strong) UILabel * contentLabel;
/**
 @brief 内容视图左右间隙，默认30
 */
@property (nonatomic, assign) CGFloat mainContentSpace;
/**
 @brief 图片和标题的距离
 */
@property (nonatomic, assign) CGFloat titleSpace;
/**
 @brief 标题和内容的距离
 */
@property (nonatomic, assign) CGFloat contentSpace;
/**
 @brief 按钮顶部距离
 */
@property (nonatomic, assign) CGFloat buttonTopSpace;
/**
 @brief 重新刷新按钮
 */
@property (nonatomic, strong) UIButton * reloadButton;
/**
 @brief 事件响应的目标类型 0.初始状态 1.containerView 2.按钮
 */
@property (nonatomic, assign) NSInteger tapTargetType;
/**
 @brief 点击事件
 */
@property (nonatomic, strong) UITapGestureRecognizer * tapGesture;
@end

@implementation CZStatusView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.mainContentSpace = 30;
        self.titleSpace = 20;
        self.contentSpace = 10;
        self.buttonTopSpace = 20;
        self.tapTargetType = 0;
        self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapReload)];
    }
    return self;
}


#pragma mark 方法实现

-(void)updateTitle:(NSString *)title content:(NSString *)content image:(UIImage *)image imgUrl:(NSString *)imgUrl imgSize:(CGSize)imgSize btnText:(NSString *)btnText
{
    // 赋值
    self.titleLabel.text = title.length ? title : @"";
    self.contentLabel.text = content.length ? content : @"";
    if (image && imgUrl.length > 0) {
        [self.imgView sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:image];
    } else if (image) {
        self.imgView.image = image;
    } else if (imgUrl.length > 0) {
        [self.imgView sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
    } else if (!image && imgUrl.length <= 0) {
        self.imgView.image = nil;
        imgSize = CGSizeZero;
    }
    [self.reloadButton setTitle:(btnText.length ? btnText : @"") forState:UIControlStateNormal];
    
    // 更新坐标
    [self updateAllFrames:imgSize];
    
    // 添加点击事件
    if (btnText.length) {
        if (self.tapTargetType == 2) [self.reloadButton removeTarget:self action:@selector(tapReload) forControlEvents:UIControlEventTouchUpInside];
        [self.reloadButton addTarget:self action:@selector(tapReload) forControlEvents:UIControlEventTouchUpInside];
        self.tapTargetType = 2;
    } else {
        if (self.tapTargetType == 1) [self.containerView removeGestureRecognizer:self.tapGesture];
        [self.containerView addGestureRecognizer:self.tapGesture];
        self.tapTargetType = 1;
    }
}

/**
 @brief 更新所有的坐标位置

 @param imgSize 图片尺寸
 */
-(void)updateAllFrames:(CGSize)imgSize
{
    self.containerView.frame = CGRectMake(self.mainContentSpace, 0, self.width - self.mainContentSpace*2, 0);
    // 获取对应尺寸
    CGSize titleSize = CGSizeZero;
    CGSize contentSize = CGSizeZero;
    if (self.titleLabel.text.length > 0) {
        titleSize = [self.titleLabel.text getTextActualSize:self.titleLabel.font lines:0 maxWidth:self.containerView.width];
    }
    if (self.contentLabel.text.length > 0) {
        contentSize = [self.contentLabel.text getTextActualSize:self.contentLabel.font lines:0 maxWidth:self.containerView.width];
    }
    
    // 赋值坐标
    CGFloat y = 0;
    self.imgView.frame = CGRectMake((self.containerView.width - imgSize.width)/2, 0, imgSize.width, imgSize.height);
    y = self.imgView.yPlushHeight;
    self.titleLabel.frame = CGRectMake((self.containerView.width - titleSize.width)/2, y ? (y + (titleSize.height ? self.titleSpace : 0)) : 0, titleSize.width, titleSize.height);
    y = self.titleLabel.yPlushHeight;
    self.contentLabel.frame = CGRectMake((self.containerView.width - contentSize.width)/2, y ? (y + (contentSize.height ? self.contentSpace : 0)) : 0, contentSize.width, contentSize.height);
    y = self.contentLabel.yPlushHeight;
    self.reloadButton.frame = CGRectMake((self.containerView.width - self.reloadButton.width)/2, y ? (y + (self.reloadButton.titleLabel.text.length ? self.buttonTopSpace : 0)) : 0, self.reloadButton.width, self.reloadButton.titleLabel.text.length ? self.reloadButton.height : 0);
    
    // 内容视图总高度
    self.containerView.frame = CGRectMake(self.containerView.x, (self.height - self.reloadButton.yPlushHeight)/2, self.containerView.width, self.reloadButton.yPlushHeight);
}

#pragma mark 自定义方法

/**
 @brief 点击重新刷新事件
 */
-(void)tapReload
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(dlTapReloadAction)]) {
        [self.delegate dlTapReloadAction];
    }
}

#pragma mark 属性
-(UIView *)containerView
{
    if (!_containerView) {
        _containerView = [[UIView alloc] init];
        [self addSubview:_containerView];
    }
    return _containerView;
}

-(UIImageView *)imgView
{
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
        [self.containerView addSubview:_imgView];
    }
    return _imgView;
}

-(UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:18];
        _titleLabel.numberOfLines = 0;
        [self.containerView addSubview:_titleLabel];
    }
    return _titleLabel;
}

-(UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.numberOfLines = 0;
        _contentLabel.textColor = [UIColor grayColor];
        [self.containerView addSubview:_contentLabel];
    }
    return _contentLabel;
}

-(UIButton *)reloadButton
{
    if (!_reloadButton) {
        _reloadButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _reloadButton.frame = CGRectMake(0, 0, 90, 30);
        _reloadButton.layer.cornerRadius = 15;
        _reloadButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _reloadButton.backgroundColor = kColor(255, 85, 85, 1);
        [self.containerView addSubview:_reloadButton];
    }
    return _reloadButton;
}
@end
