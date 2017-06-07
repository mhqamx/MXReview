//
//  MXSendMessageSecondViewController.m
//  MXReview
//
//  Created by 马霄 on 22/05/2017.
//  Copyright © 2017 马 霄. All rights reserved.
//

#import "MXSendMessageSecondViewController.h"

@interface MXSendMessageSecondViewController ()
@property (nonatomic, strong) UITextField *textField;
@end

@implementation MXSendMessageSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"传值界面";
    self.view.backgroundColor = [UIColor whiteColor];
    [self configUI];
}

#pragma mark - PrivateMethods 
- (void)configUI {
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    self.textField.backgroundColor = [UIColor grayColor];
    self.textField.textColor = [UIColor whiteColor];
    self.textField.placeholder = @"填写想要进行传值的字符";
    [self.view addSubview:self.textField];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"点击传值" forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 160, 100, 30);
    button.layer.cornerRadius = 15;
    button.clipsToBounds = YES;
    [button addTarget:self action:@selector(buttonOnClick_block) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonOnClick {
    [self.delegate sendMessage:self.textField.text];
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"%s", __func__);
}

- (void)buttonOnClick_block {
    self.block(self.textField.text);
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"%s", __func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
