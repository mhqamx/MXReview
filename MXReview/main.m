//
//  main.m
//  MXReview
//
//  Created by 马霄 on 24/04/2017.
//  Copyright © 2017 马 霄. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

// main->UIApplicationMain
int main(int argc, char * argv[]) {
    @autoreleasepool {
        // argc, argv C语言中的参数
        // NSString 第三个参数:UIApplication的类名或子类的参数 nil == "UIApplication"
        // NSString 第四个参数:UIApplication代理的代理名称
        // NSStringFromClass:将类名转换为字符串
        // NSStringFromClass好处:1.有提示功能 2.避免输入错误
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
