//
//  XPTabBar.m
//  weibo
//
//  Created by dragon on 16/6/19.
//  Copyright © 2016年 win. All rights reserved.
//

#import "XPTabBar.h"
#import "XPSearchViewController.h"
#import "XPTabBarController.h"

@implementation XPTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //添加进去+按钮
        
        UIButton *sendSearchBtn = [[UIButton alloc]initWithFrame:CGRectMake(frame.size.width/2 - 35, -23, 70, 70)];
        //设置图片
        [sendSearchBtn setImage:[UIImage imageNamed:@"NewTab3_nor"] forState:UIControlStateNormal];
        
        [self addSubview:sendSearchBtn];
        
        [sendSearchBtn addTarget:self action:@selector(sendAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

-(void)sendAction:(UIButton *)sender{
    //设置图片
    [sender setImage:[UIImage imageNamed:@"NewTab3_nor_day"] forState:UIControlStateNormal];
    [sender setImage:[UIImage imageNamed:@"NewTab3_nor_blink_k"] forState:UIControlStateHighlighted];
    
//    XPSearchViewController *vc = [XPSearchViewController new];
//    
//    //得到项目中的tabbarController
//    UIViewController *tbc = [UIApplication sharedApplication].keyWindow.rootViewController;
//    
//    [tbc presentViewController:[[UINavigationController alloc]initWithRootViewController:vc] animated:YES completion:nil];
    
}

//子控件布局方法  此方法 每次显示之前会调用
-(void)layoutSubviews{
    [super layoutSubviews];
    
    NSLog(@"%@",self.subviews);
    UIView *fView = self.subviews[3];
    UIView *uView = self.subviews[4];
    fView.center = CGPointMake(115, fView.center.y);
    uView.center = CGPointMake(260, uView.center.y);
    
}

@end
