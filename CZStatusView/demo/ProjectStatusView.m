//
//  ProjectStatusView.m
//  CZStatusView
//
//  Created by yunshan on 2019/4/22.
//  Copyright © 2019 ChenZhe. All rights reserved.
//

#import "ProjectStatusView.h"

@implementation ProjectStatusView

-(void)updateWithType:(NSInteger)type
{
    switch (type) {
        case 1:
            {
                [self updateTitle:@"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题" content:@"内容内容内容内容内容内容内容内容内容内容内内容内容内容内容内容内容内容内容内容内内容内容内容内容内容内容内容内容内容内内容内容内容内容内容内容内容内容内容内容内容" imageName:nil imgUrl:@"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1555936338&di=155b511c436331328f673311964052fe&src=http://hbimg.b0.upaiyun.com/28a4962c297205e0868cdb45bb527e2bc5319f08f019-l7N1A3_fw658" imgSize:CGSizeMake(200, 200)];
            }
            break;
            
        default:
            break;
    }
}

@end
