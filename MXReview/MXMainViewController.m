//
//  MXMainViewController.m
//  MXReview
//
//  Created by 马霄 on 24/04/2017.
//  Copyright © 2017 马 霄. All rights reserved.
//

#define ROWHEIGHT 44

#import "MXMainViewController.h"
/** 
 * 缓存图片到本地
 */
#import "MXLoadImageViewController.h"

/** 
 * 传值
 */
#import "MXSendMessageViewController.h"

#import "MXCountryViewController.h"

@interface MXMainViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *mainTableView;
@end

@implementation MXMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    // 设置导航条
    [self configNavigation];
    [self configUI];
}

- (void)configNavigation {
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"主页";
    [titleLabel sizeToFit];
    titleLabel.textColor = [UIColor colorWithWhite:1 alpha:0];
    self.navigationItem.titleView = titleLabel;
}

- (void)configUI {
    self.mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.rowHeight = ROWHEIGHT;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    headerView.backgroundColor = [UIColor redColor];
    self.mainTableView.tableHeaderView = headerView;
    
    [self.view addSubview:self.mainTableView];
}

#pragma mark - 数据源
- (NSMutableArray *)sourceArr {
    return [@[@"缓存图片到本地", @"传值", @"省市县"] mutableCopy];
}

#pragma mark - TableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"mainTableView";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [self sourceArr][indexPath.row];
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(nonnull UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self sourceArr] count];
}

#pragma mark - TableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        MXLoadImageViewController *loadVC = [[MXLoadImageViewController alloc] init];
        loadVC.titleString = [self sourceArr][indexPath.row];
        [self.navigationController pushViewController:loadVC animated:YES];
    }
    if (indexPath.row == 1) {
        MXSendMessageViewController *sendMessageVC = [[MXSendMessageViewController alloc] init];
        sendMessageVC.titleString = [self sourceArr][indexPath.row];
        [self.navigationController pushViewController:sendMessageVC animated:YES];
    }
    if(indexPath.row == 2) {
        MXCountryViewController *countryVC = [[MXCountryViewController alloc] init];
        countryVC.titleStr = [self sourceArr][indexPath.row];
        [self.navigationController pushViewController:countryVC animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}

@end
