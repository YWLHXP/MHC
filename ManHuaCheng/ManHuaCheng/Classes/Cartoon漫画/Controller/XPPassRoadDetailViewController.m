//
//  XPPassRoadDetailViewController.m
//  ManHuaCheng
//
//  Created by 罗惠 on 16/7/1.
//  Copyright © 2016年 win. All rights reserved.
//

#import "XPPassRoadDetailViewController.h"

@interface XPPassRoadDetailViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIButton *passButton;

@end

@implementation XPPassRoadDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"投递详情";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(onLeftBtn)];
    
    [self showDetailForBtnAndTableView];

}

- (void)onLeftBtn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)showDetailForBtnAndTableView
{
    self.tableView.layer.borderWidth = .5;
    self.tableView.layer.cornerRadius = 18;
    self.tableView.layer.masksToBounds = YES
    ;
    self.tableView.layer.borderColor = [UIColor grayColor].CGColor;
    
    self.passButton.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    self.passButton.layer.borderWidth = .7;
    self.passButton.layer.cornerRadius = 5;
    self.passButton.layer.masksToBounds = YES;
    self.passButton.layer.borderColor = [UIColor grayColor].CGColor;
    
}
@end
