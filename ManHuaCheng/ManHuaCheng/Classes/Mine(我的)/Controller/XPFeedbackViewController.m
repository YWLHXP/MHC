//
//  XPFeedbackViewController.m
//  ManHuaCheng
//
//  Created by dragon on 16/6/29.
//  Copyright © 2016年 win. All rights reserved.
//

#import "XPFeedbackViewController.h"
#import <YYTextView.h>
#import <MBProgressHUD.h>

@interface XPFeedbackViewController ()
/** textView */
@property (nonatomic, strong) YYTextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *QQnumberField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberField;
@end

@implementation XPFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"求书&反馈";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(submit)];
    
   
    self.textView = [[YYTextView alloc] initWithFrame:CGRectMake(15, 74, XPScreenWidth - 30, 180)];
    self.textView.placeholderText = @"请输入求书或反馈内容，500字以内哦~喵~";
    self.textView.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1];
    [self.view addSubview:self.textView];
                                               
}

#pragma mark -提交反馈内容
- (void)submit
{
    if ([self.textView.text isEqualToString:@""]) {
        [self hubWithTitle:@"请填写反馈内容"];
        return;
    }
    if ([self.QQnumberField.text isEqualToString:@""] && [self.phoneNumberField.text isEqualToString:@""]) {
        [self hubWithTitle:@"QQ或手机号至少选择一项"];
        return;
    }
    [self hubWithTitle:@"提交成功"];
}

- (void)hubWithTitle:(NSString *)title
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = NSLocalizedString(title, @"HUD message title");
    [hud hide:YES afterDelay:2];
}
@end
