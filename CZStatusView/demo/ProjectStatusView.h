//
//  ProjectStatusView.h
//  CZStatusView
//
//  Created by yunshan on 2019/4/22.
//  Copyright © 2019 ChenZhe. All rights reserved.
//

#import "CZStatusView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProjectStatusView : CZStatusView

/**
 @brief 项目中可根据实际情况统一管理状态视图

 @param type 此处可实现枚举
 */
-(void)updateWithType:(NSInteger)type;
@end

NS_ASSUME_NONNULL_END
