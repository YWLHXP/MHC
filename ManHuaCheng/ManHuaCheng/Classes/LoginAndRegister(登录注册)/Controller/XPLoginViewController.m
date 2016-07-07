//
//  XPLoginViewController.m
//  ManHuaCheng
//
//  Created by dragon on 16/6/29.
//  Copyright © 2016年 win. All rights reserved.
//

#import "XPLoginViewController.h"
#import "XPRegisterViewController.h"
#import "XPForgetPasswordViewController.h"
#import "AppDelegate.h"
#import "XPTabBarController.h"

@interface XPLoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (nonatomic,strong)BmobUser *user;
@end

@implementation XPLoginViewController

//登录按钮
- (IBAction)login:(id)sender {
    [BmobUser loginInbackgroundWithAccount:self.nameTextField.text andPassword:self.pwdTextField.text block:^(BmobUser *user, NSError *error) {
        
        if (user) {
            //添加显示首页的代码
            AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
            app.window.rootViewController = [[XPTabBarController alloc] init];
        }
        
        if (error) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:[error localizedDescription] preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            
            UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                //确定时做的事
            }];
            
            [alert addAction:cancel];
            [alert addAction:confirm];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
}
- (IBAction)free:(id)sender {
    self.user = [[BmobUser alloc] init];
    self.user.username = @"游客577东城99";
    self.user.password = @"123456";
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

- (IBAction)forgetPassword:(id)sender {
    [self.navigationController pushViewController:[XPForgetPasswordViewController new] animated:YES];
}
@end
