//
//  XPLoginViewController.m
//  ManHuaCheng
//
//  Created by dragon on 16/6/29.
//  Copyright © 2016年 win. All rights reserved.
//

#import "XPLoginViewController.h"
#import "XPRegisterViewController.h"

@interface XPLoginViewController ()

@end

@implementation XPLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"登录";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(registerAction)];
    //设置naviagtionBar的tintColor为黑色
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
}

- (void)registerAction
{
    [self.navigationController pushViewController:[XPRegisterViewController new] animated:YES];
}

@end
