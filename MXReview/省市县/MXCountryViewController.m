//
//  MXCountryViewController.m
//  MXReview
//
//  Created by 马霄 on 22/05/2017.
//  Copyright © 2017 马 霄. All rights reserved.
//

#import "MXCountryViewController.h"

@interface MXCountryViewController ()

@end

@implementation MXCountryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.titleStr;
    self.view.backgroundColor = [UIColor whiteColor];
    [self configUI];
    
    // 1.设置应用图标的提醒数字
    // 获取应用程序的象征
    UIApplication *app = [UIApplication sharedApplication];
    // 常见通知对象
    UIUserNotificationSettings *settings =  [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
    // 注册用户通知
    [app registerUserNotificationSettings:settings];
    // 设置应用图标提醒数字
    [app setApplicationIconBadgeNumber:9];
    
    // 2.设置联网提示
    [app setNetworkActivityIndicatorVisible:YES];
    // 3.设置状态栏
    // ios7之后,状态栏交给控制器管理了
//    [app setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    // 4.打电话,发短信,打开网页
    // URL:资源的唯一路径
    // 创建URL
    // 根据协议头来判断用什么软件打开URL
    // 打电话@"tel://"
    // 发短信@"sms://"
    // 发邮件@"mailto://"
    // 打开网页@"http://"

    
}

#pragma mark - PrivateMethods
- (void)configUI {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"click" forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 100, 100, 30);
    [button addTarget:self action:@selector(buttonOnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.baidu.com"];
    [[UIApplication sharedApplication] openURL:url];
    
}

- (void)buttonOnClick {
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

@end
