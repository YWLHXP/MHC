//
//  XPRegisterViewController.m
//  ManHuaCheng
//
//  Created by dragon on 16/6/29.
//  Copyright © 2016年 win. All rights reserved.
//

#import "XPRegisterViewController.h"
#import "AppDelegate.h"
#import "XPTabBarController.h"
#import <MBProgressHUD.h>

@interface XPRegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *onePWTextField;
@property (weak, nonatomic) IBOutlet UITextField *twoTextField;
@property (nonatomic,strong)BmobUser *user;
@end

@implementation XPRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"用户注册";
    
}

- (IBAction)login:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

//注册按钮
- (IBAction)registerBtn:(id)sender {
    self.user = [[BmobUser alloc] init];
    self.user.username = self.nameTextField.text;
    self.user.password = self.onePWTextField.text = self.twoTextField.text;
    if (self.nameTextField.text.length < 6) {
        [self showTooltip:@"账号内容长度必须是6到20位，请确认你的账号"];
        return;
    }
       
    [self.user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            NSLog(@"注册成功!");
            AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
            app.window.rootViewController = [[XPTabBarController alloc] init];
            
        }else{
            NSLog(@"%@",error);
        }
    }];

}

- (void)showTooltip:(NSString *)tip
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = NSLocalizedString(tip, @"HUD message title");
    [hud hide:YES afterDelay:2];
}

@end
