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
#import "XPCicleViewController.h"
#import "XPMineTableController.h"
#import "XPTabBar.h"

@interface XPTabBarController ()

@end

@implementation XPTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加子控制器
    [self addAllChildViewController];
    
    XPTabBar *tabbar = [[XPTabBar alloc]initWithFrame:self.tabBar.frame];
    //    KVC 可以通过键值的方式对对象属性的进行赋值 和 取值
    [self setValue:tabbar forKey:@"tabBar"];
    
     self.tabBar.tintColor = [UIColor redColor];
}

#pragma mark -添加子控制器
- (void)addAllChildViewController
{
    //书架
    UINavigationController *bookRack = [[UINavigationController alloc] initWithRootViewController: [[XPBookrackViewController alloc] init]];
    [self addOneChildViewController:bookRack image:[UIImage imageNamed:@"katongxiaodongwu_03_n"] selImage:[UIImage imageNamed:@"katongxiaodongwu_03@2x"]];
    bookRack.title = @"书架";
    
    //书城
    UINavigationController *bookCity = [[UINavigationController alloc] initWithRootViewController: [[XPBookcityViewController alloc] init]];
    [self addOneChildViewController:bookCity image:[UIImage imageNamed:@"katongxiaodongwu_20_n@2x"] selImage:[UIImage imageNamed:@"katongxiaodongwu_20@2x"]];
    bookCity.title = @"书城";
    
    //圈子
    UINavigationController *circle = [[UINavigationController alloc] initWithRootViewController: [[XPCicleViewController alloc] init]];
    [self addOneChildViewController:circle image:[UIImage imageNamed:@"katongxiaodongwu_01_n@2x"] selImage:[UIImage imageNamed:@"katongxiaodongwu_01@2x"]];
    circle.title = @"圈子";
    
    //我的
    UINavigationController *mine = [[UINavigationController alloc] initWithRootViewController: [[XPMineTableController alloc] init]];
    [self addOneChildViewController:mine image:[UIImage imageNamed:@"Bitmap_n@2x"] selImage:[UIImage imageNamed:@"Bitmap@2x"]];
    mine.title = @"我的";
    
}

#pragma mark -添加一个子控制器
- (void)addOneChildViewController:(UIViewController *)vc image:(UIImage *)image selImage:(UIImage *)selImage
{
    //    vc.navigationItem.title = title;
    vc.tabBarItem.image = image;
    //保持图片不被渲染
    UIImage *originalImage = [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = originalImage;
    
    [self addChildViewController:vc];
   
}

@end
