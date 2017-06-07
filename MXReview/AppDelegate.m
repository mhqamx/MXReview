//
//  AppDelegate.m
//  MXReview
//
//  Created by 马霄 on 24/04/2017.
//  Copyright © 2017 马 霄. All rights reserved.
//

#import "AppDelegate.h"
#import "MXMainViewController.h"
@interface AppDelegate ()

@end
@implementation AppDelegate
// AppDelegate:监听应用程序的生命周期
// 以下方法就是应用程序的生命周期方法

// 应用程序启动完成是就会调用AppDelegate的方法
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    MXMainViewController *mainVC = [[MXMainViewController alloc] init];
    UINavigationController *mainNavi = [[UINavigationController alloc] initWithRootViewController:mainVC];
    [self.window setRootViewController:mainNavi];
    [self.window makeKeyAndVisible];
    
    NSLog(@"%s", __func__);
    
    return YES;
}

// 当应用程序完全获取焦点的时候调用
// 只有当应用程序完全获取焦点的时候,才能够与用户交互
- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

@end
