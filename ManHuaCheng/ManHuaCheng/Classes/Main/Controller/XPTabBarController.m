//
//  XPTabBarController.m
//  ManHuaCheng
//
//  Created by dragon on 16/6/28.
//  Copyright © 2016年 win. All rights reserved.
//

#import "XPTabBarController.h"
#import "XPBookrackViewController.h"
#import "XPBookcityViewController.h"
#import "XPSearchViewController.h"
#import "MainViewController.h"
#import "XPMineTableController.h"
#import "XPNavigationController.h"
#import "XPTabBar.h"

@interface XPTabBarController ()

@end

@implementation XPTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XPTabBar *tabbar = [[XPTabBar alloc]initWithFrame:self.tabBar.frame];
    //    KVC 可以通过键值的方式对对象属性的进行赋值 和 取值
    [self setValue:tabbar forKey:@"tabBar"];

    
    // 添加子控制器
    [self addAllChildViewController];
    
     self.tabBar.tintColor = [UIColor redColor];
    //默认选中页
    self.selectedIndex = 1;
    
}

#pragma mark - 自定义的tabBar

#pragma mark -添加子控制器
- (void)addAllChildViewController
{
    //书架
    [self addOneChildViewController:[[UINavigationController alloc] initWithRootViewController: [[XPBookrackViewController alloc] init]] image:[UIImage imageNamed:@"NewTab1_nor"] selImage:[UIImage imageNamed:@"NewTab1_sel"] withtitle:@"书架"];
    
    //书城
    [self addOneChildViewController:[[UINavigationController alloc] initWithRootViewController: [[XPBookcityViewController alloc] init]] image:[UIImage imageNamed:@"NewTab2_nor"] selImage:[UIImage imageNamed:@"NewTab2_sel"] withtitle:@"书城"];
    
    
    //圈子
    [self addOneChildViewController:[[UINavigationController alloc] initWithRootViewController: [[MainViewController alloc] init]] image:[UIImage imageNamed:@"NewTab4_nor"] selImage:[UIImage imageNamed:@"NewTab4_sel"] withtitle:@"圈子"];
    
    //我的
    [self addOneChildViewController:[[XPNavigationController alloc] initWithRootViewController: [[XPMineTableController alloc] init]] image:[UIImage imageNamed:@"NewTab5_nor"] selImage:[UIImage imageNamed:@"NewTab5_sel"] withtitle:@"我的"];
    
}

#pragma mark -添加一个子控制器
- (void)addOneChildViewController:(UIViewController *)vc image:(UIImage *)image selImage:(UIImage *)selImage withtitle:(NSString *)title
{
    //    vc.navigationItem.title = title;
    vc.tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //保持图片不被渲染
    UIImage *originalImage = [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = originalImage;
    vc.title = title;
    [self addChildViewController:vc];
    
}
@end
