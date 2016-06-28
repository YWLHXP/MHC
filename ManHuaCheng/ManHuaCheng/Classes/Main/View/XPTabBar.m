//
//  XPTabBar.m
//  weibo
//
//  Created by dragon on 16/6/19.
//  Copyright © 2016年 win. All rights reserved.
//

#import "XPTabBar.h"

@implementation XPTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //添加进去+按钮
        
        UIButton *search = [[UIButton alloc]initWithFrame:CGRectMake(152, -20, 71, 70)];
        //设置图片
        [search setImage:[UIImage imageNamed:@"tiantiansifangmao-04@2x"] forState:UIControlStateNormal];
        
        [self addSubview:search];

    }
    return self;
}

//子控件布局方法  此方法 每次显示之前会调用
-(void)layoutSubviews{
    [super layoutSubviews];
    
//    NSLog(@"%@",self.subviews);
    UIView *fView = self.subviews[3];
    UIView *uView = self.subviews[4];
    fView.center = CGPointMake(115, fView.center.y);
    uView.center = CGPointMake(260, uView.center.y);
    
}

@end
