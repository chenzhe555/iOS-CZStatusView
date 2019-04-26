//
//  ViewController.m
//  CZStatusView
//
//  Created by yunshan on 2019/4/21.
//  Copyright © 2019 ChenZhe. All rights reserved.
//

#import "ViewController.h"
#import "ProjectStatusView.h"

@interface ViewController ()
@property (nonatomic, strong) ProjectStatusView * statusView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.statusView];
    [self.statusView updateWithType:1];
}

-(CZStatusView *)statusView
{
    if (!_statusView) {
        _statusView = [[ProjectStatusView alloc] init];
        _statusView.frame = self.view.bounds;
    }
    return _statusView;
}


@end
