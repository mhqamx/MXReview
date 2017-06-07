//
//  MXSendMessageViewController.m
//  MXReview
//
//  Created by 马霄 on 27/04/2017.
//  Copyright © 2017 马 霄. All rights reserved.
//

#import "MXSendMessageViewController.h"
#import "MXSendMessageSecondViewController.h"
@interface MXSendMessageViewController ()<sendMessageDelegate>
@property (nonatomic, strong) UILabel *label;
@end

@implementation MXSendMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.titleString;
    [self configUI];
}

- (void)configUI {
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    label1.backgroundColor = [UIColor cyanColor];
    label1.textColor = [UIColor blackColor];
    label1.layer.cornerRadius = 15;
    label1.clipsToBounds = YES;
    label1.layer.shadowColor = [UIColor redColor].CGColor;
    label1.shadowOffset = CGSizeMake(2, 1);
    label1.text = @"占位字符";
    self.label = label1;
    [self.view addSubview:label1];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 160, 100, 30);
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"点击跳转" forState:UIControlStateNormal];
    button.layer.cornerRadius = 15;
    button.clipsToBounds = YES;
    [button addTarget:self action:@selector(buttonOnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

#pragma mark - PrivateMethods

- (void)buttonOnClick {
    NSLog(@"%s", __func__);
    MXSendMessageSecondViewController *secondVC = [[MXSendMessageSecondViewController alloc] init];
    secondVC.delegate = self;
    secondVC.block = ^(NSString *message) {
        self.label.text = message;
    };
    [self.navigationController pushViewController:secondVC animated:YES];
}

#pragma mark - SendMessageDelegate

- (void)sendMessage:(NSString *)message {
    self.label.text = message;
    NSLog(@"%s", __func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
