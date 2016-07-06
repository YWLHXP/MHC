//
//  XPMineTableController.m
//  ManHuaCheng
//
//  Created by dragon on 16/6/29.
//  Copyright © 2016年 win. All rights reserved.
//

#import "XPMineTableController.h"
#import "XPSoftWareTableController.h"
#import "XPLoginViewController.h"
#import <MBProgressHUD.h>
#import "XPFeedbackViewController.h"
#import "XPNovelListTableController.h"
#import "XPAboutMHCViewController.h"
#import "XPCartoonViewController.h"
#import "XPNavigationController.h"
#import "HLActionSheet.h"
#import "XPFileDirectoryViewController.h"
#import "XPMyWordViewController.h"
#import "XPMyAccountTableViewController.h"

@interface XPMineTableController ()
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (strong, nonatomic) IBOutlet UITableViewCell *loginOrRegister;
@property (strong, nonatomic) IBOutlet UITableViewCell *myAccount;
@property (strong, nonatomic) IBOutlet UITableViewCell *myTopic;
@property (strong, nonatomic) IBOutlet UITableViewCell *shareToFriends;
@property (strong, nonatomic) IBOutlet UITableViewCell *bookBack;
@property (strong, nonatomic) IBOutlet UITableViewCell *localRead;
@property (strong, nonatomic) IBOutlet UITableViewCell *novelRoom;
@property (strong, nonatomic) IBOutlet UITableViewCell *invate;
@property (strong, nonatomic) IBOutlet UITableViewCell *about;
@property (strong, nonatomic) IBOutlet UITableViewCell *alerdyLogin;

@end

@implementation XPMineTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor colorWithRed:234/255.0 green:235/255.0 blue:237/255.0 alpha:1];
    self.navigationItem.title = @"我的";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_reader_set"] style:UIBarButtonItemStylePlain target:self action:@selector(set)];
    //去掉分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //获取用户名
    self.nickNameLabel.text = [BmobUser getCurrentUser].username;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:110/255.0 green:111/255.0 blue:112/255.0 alpha:1];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //[self.tabBarController.tabBar setHidden:YES];
}

- (void)set
{
    XPSoftWareTableController *softWare = [XPSoftWareTableController new];
    [self.navigationController pushViewController:softWare animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else if(section == 1)
    {
        return 2;
    }else if(section == 2)
    {
        return 2;
    }
    else if(section == 3)
    {
        return 3;
    }else
    {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    switch (indexPath.section) {
        case 0:
        {
            if ([BmobUser getCurrentUser]) {
                return self.alerdyLogin;
            }else
            {
                return self.loginOrRegister;
            }
        }
            break;
        case 1:
            if (indexPath.row == 0) {
               
                return self.myAccount;
            }else
            {
                
                return self.myTopic;
            }
            break;
        case 2:
            if (indexPath.row == 0) {
                return self.shareToFriends;
            }else
            {
                return self.bookBack;
            }
            break;
        case 3:
            if (indexPath.row == 0) {
                return self.localRead;
            }else if(indexPath.row == 1)
            {
                return self.novelRoom;
            }else
            {
                return self.invate;
            }
            break;
        default:
            return self.about;
            break;
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            if ([BmobUser getCurrentUser]) {
                NSLog(@"此功能暂未实现，敬请期待哦~");
            }else
            {
                XPLoginViewController *login = [XPLoginViewController new];
                [self.navigationController pushViewController:login animated:YES];
            }
        }
            break;
        case 1:
        {
            if (indexPath.row == 0) {
                if ([BmobUser getCurrentUser]) {
                    [self.navigationController pushViewController:[XPMyAccountTableViewController new] animated:YES];
                }else
                {
                    [self.navigationController pushViewController:[XPLoginViewController new] animated:YES];
                    [self showTooltip:@"登录后再去账号中心哦"];
                }

            }else
            {
                if ([BmobUser getCurrentUser]) {
                    [self.navigationController pushViewController:[XPMyWordViewController new] animated:YES];
                }else
                {
                    [self showTooltip:@"登录后再去我的话题哦"];
                    
                    [self.navigationController pushViewController:[XPLoginViewController new] animated:YES];
                }
            }
        }
            break;
        case 2:
        {
            if (indexPath.row == 0) {
                NSArray *titles = @[@"微信好友",@"新浪微博",@"微信朋友圈",@"QQ空间",@"QQ",@"微信收藏"];
                NSArray *imageNames = @[@"sns_icon_22",@"sns_icon_1",@"sns_icon_23",@"sns_icon_6",@"sns_icon_24",@"sns_icon_37"];
                HLActionSheet *sheet = [[HLActionSheet alloc] initWithTitles:titles iconNames:imageNames];
                [sheet showActionSheetWithClickBlock:^(int btnIndex) {
                    if (btnIndex == 0) {
                        NSLog(@"亲,你还没有安装微信App哦~");
                    }else if (btnIndex == 1)
                    {
                        NSLog(@"亲,你还没有安装新浪微博App哦~");
                    }else if (btnIndex == 2)
                    {
                         NSLog(@"亲,你还没有安装微信,无法使用朋友圈");
                    }else if(btnIndex == 3)
                    {
                         NSLog(@"亲,你还没有安装QQ,无法使用QQ空间");
                    }else if(btnIndex == 4)
                    {
                         NSLog(@"亲,你还没有安装QQ哦~");
                    }else{
                        NSLog(@"亲,你还没有安装微信,无法使用微信收藏");
                    }
                    
                } cancelBlock:^{
                    NSLog(@"亲，你已经取消分享了哦~");
                }];

            }else
            {
                [self.navigationController pushViewController:[XPFeedbackViewController new] animated:YES];
            }
        }
            break;
        case 3:
        {
            if (indexPath.row == 0) {
                [self.navigationController pushViewController:[XPFileDirectoryViewController new] animated:YES];
                
            }else if(indexPath.row == 1)
            {
                [self.navigationController pushViewController:[XPNovelListTableController new] animated:YES];
            }else
            {
//                [self.navigationController pushViewController:[XPCartoonViewController new] animated:YES];
                [self presentViewController:[[XPNavigationController alloc]initWithRootViewController:[[XPCartoonViewController alloc] init]] animated:YES completion:nil];
                
            }
        }
            break;

        default:
            [self.navigationController pushViewController:[XPAboutMHCViewController new] animated:YES];
            break;
    }
    
}

- (void)showTooltip:(NSString *)tip
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = NSLocalizedString(tip, @"HUD message title");
    [hud hide:YES afterDelay:2];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }else
    {
        return 10;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 74;
    }else
    {
        return 44;
    }
}
@end
