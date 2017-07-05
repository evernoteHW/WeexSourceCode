//
//  ViewController.m
//  WeexSourceCode
//
//  Created by WeiHu on 2017/7/5.
//  Copyright © 2017年 WeiHu. All rights reserved.
//

#import "ViewController.h"
#import <WeexSDK/WXSDKInstance.h>

@interface ViewController ()
@property (nonatomic, strong) WXSDKInstance *instance;
@property (nonatomic, strong) UIView *weexView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_instance destroyInstance];
    _instance = [[WXSDKInstance alloc] init];
    _instance.viewController = self;
    _instance.frame = self.view.bounds;
    
    __weak typeof(self) weakSelf = self;
    _instance.onCreate = ^(UIView *view) {
        [weakSelf.weexView removeFromSuperview];
        weakSelf.weexView = view;
        [weakSelf.view addSubview:weakSelf.weexView];
        UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, weakSelf.weexView);
    };
    _instance.onFailed = ^(NSError *error) {
        
    };
    _instance.renderFinish = ^(UIView *view) {
        NSLog(@"%@", @"Render Finish...");
    };
    
    _instance.updateFinish = ^(UIView *view) {
        NSLog(@"%@", @"Update Finish...");
    };
//    NSString *BUNDLE_URL = [NSString stringWithFormat:@"file://%@/bundlejs/index.js",[NSBundle mainBundle].bundlePath];
    
    NSString *BUNDLE_URL = [NSString stringWithFormat:@"file://%@/hello.js",[NSBundle mainBundle].bundlePath];
    NSURL *URL = [NSURL URLWithString:BUNDLE_URL];
    NSString *randomURL = [NSString stringWithFormat:@"%@%@random=%d",URL.absoluteString,URL.query?@"&":@"?",arc4random()];
    [_instance renderWithURL:[NSURL URLWithString:randomURL] options:@{@"bundleUrl":URL.absoluteString} data:nil];

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
