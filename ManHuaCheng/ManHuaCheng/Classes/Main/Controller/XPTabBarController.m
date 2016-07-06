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

#define GAP 14


@interface XPTabBarController ()
@property (nonatomic, strong) UIView *tabBarView;
@end

@implementation XPTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tabBar removeFromSuperview];
    //创建自己的tabBar
    _tabBarView = [[UIView alloc]initWithFrame:CGRectMake(0, XPScreenHeight-44 ,XPScreenWidth, 44)];
    _tabBarView.backgroundColor = [UIColor whiteColor];
    _tabBarView.layer.borderWidth = 0.3;
    _tabBarView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.view addSubview:_tabBarView];

    [self setViewControllers:@[[[UINavigationController alloc] initWithRootViewController: [[XPBookrackViewController alloc] init]], [[UINavigationController alloc] initWithRootViewController: [[XPBookcityViewController alloc] init]], [XPSearchViewController new], [[UINavigationController alloc] initWithRootViewController: [[MainViewController alloc] init]], [[XPNavigationController alloc] initWithRootViewController: [[XPMineTableController alloc] init]]]];
    
    
}

#pragma mark - 自定义的tabBar
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    //计算间距
    CGFloat Position = (XPScreenWidth- 40*4 - 70 - GAP*2)/4;
    
    
    //根据Controller的数量来创建按钮
    for (int i = 0; i < 5; i++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        if (i < 2) {
            btn.frame = CGRectMake(GAP + i *(40 + Position), 1, 40, 40);
            if (i ==0) {
                 [self setButton:btn withTitle:@"书架" Image:[UIImage imageNamed:@"NewTab1_nor"] selectedImage:[UIImage imageNamed:@"NewTab1_sel"]];
            } else {
                 [self setButton:btn withTitle:@"书城" Image:[UIImage imageNamed:@"NewTab2_nor"] selectedImage:[UIImage imageNamed:@"NewTab2_sel"]];
            }
           
            
        }else if(i == 2){
            btn.frame = CGRectMake(GAP+ 40 * 2 + Position * 2 , -26, 70, 70);
            [self setButton:btn withTitle:nil Image:[UIImage imageNamed:@"NewTab3_nor_blink_s"] selectedImage:[UIImage imageNamed:@"NewTab3_nor_day"]];
            
        }else
        {
            btn.frame = CGRectMake(GAP + 40 * 2 + 70 + Position * 3 + (40 +  Position) * (i - 3), 1, 40, 40);
            
            if (i == 3) {
                 [self setButton:btn withTitle:@"圈子" Image:[UIImage imageNamed:@"NewTab4_nor"] selectedImage:[UIImage imageNamed:@"NewTab4_sel"]];
            } else {
                 [self setButton:btn withTitle:@"我的" Image:[UIImage imageNamed:@"NewTab5_nor"] selectedImage:[UIImage imageNamed:@"NewTab5_sel"]];
            }
        }
        
        btn.tag = i +10;
        if (i == 1)
        {
            [btn setSelected:YES];
             UILabel *lab = [btn viewWithTag:100];
            lab.textColor = [UIColor redColor];

        }
        
       
        //选中,黑色背景跳转
        [btn addTarget:self action:@selector(onSelected:) forControlEvents:UIControlEventTouchUpInside];
        [_tabBarView addSubview:btn];
        
        
    }
}

-(void)onSelected:(UIButton *)btn
{
    
    [btn setSelected:YES];
    
    //btn的tag关联tabBar的选择视图控制器
    self.selectedIndex = btn.tag - 10;
    
    for (UIButton * button in _tabBarView.subviews)
    {
        UILabel *lab = [button viewWithTag:100];

        if (btn != button)
        {
            [button setSelected:NO];
            lab.textColor = [UIColor grayColor];
        }else
        {
            lab.textColor = [UIColor redColor];
        }
    }
    
}

#pragma mark - button的按钮样式
- (void)setButton:(UIButton *)btn withTitle:(NSString *)title Image:(UIImage *)image selectedImage:(UIImage *)selImage
{
    
    [btn setImage:image forState:UIControlStateNormal];

    [btn setImage:selImage forState:UIControlStateSelected];
    
    //设置button的内容横向居中。。设置content是title和image一起变化
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    //设置内容垂直或水平显示位置
    if (title) {
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, 3, 12, 3);
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 40, 10)];
        lab.text = title;
        lab.textAlignment = NSTextAlignmentCenter;
        lab.font = [UIFont systemFontOfSize:9];
        lab.textColor = [UIColor grayColor];
        lab.tag = 100;
        [btn addSubview:lab];
        
    }
}


@end
