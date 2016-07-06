//
//  XPCartoonActionV.m
//  ManHuaCheng
//
//  Created by 罗惠 on 16/7/1.
//  Copyright © 2016年 win. All rights reserved.
//

#import "XPCartoonActionV.h"

@implementation XPCartoonActionV

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btn.frame = CGRectMake(20, 20, XPScreenWidth - 40, 30);
            [self.btn setImage:[UIImage imageNamed:@"blog_detail_comment"] forState:UIControlStateNormal];
        [self.btn setTitle:@" 投递名单&方式" forState:UIControlStateNormal];
        [self.btn addTarget:self action:@selector(onBTn:) forControlEvents:UIControlEventTouchUpInside];
        self.btn.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
        self.btn.layer.borderWidth = 0.5;
        self.btn.layer.borderColor = [UIColor grayColor].CGColor;
        [self.btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        self.btn.layer.cornerRadius = 5;
        self.btn.layer.masksToBounds = YES;
        [self addSubview:self.btn];
    }
    return self;

}

- (void)onBTn:(UIButton *)sender
{
    
    //self.viewBlock(sender.selected);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PASSVIEW" object:nil userInfo:@{@"senderBool":[NSNumber numberWithBool:sender.selected]}];
}

@end
