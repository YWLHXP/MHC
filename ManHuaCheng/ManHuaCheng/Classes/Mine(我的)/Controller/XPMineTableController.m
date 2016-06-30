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

@interface XPMineTableController ()
@property (strong, nonatomic) IBOutlet UITableViewCell *loginOrRegister;
@property (strong, nonatomic) IBOutlet UITableViewCell *myAccount;
@property (strong, nonatomic) IBOutlet UITableViewCell *myTopic;
@property (strong, nonatomic) IBOutlet UITableViewCell *shareToFriends;
@property (strong, nonatomic) IBOutlet UITableViewCell *bookBack;
@property (strong, nonatomic) IBOutlet UITableViewCell *localRead;
@property (strong, nonatomic) IBOutlet UITableViewCell *novelRoom;
@property (strong, nonatomic) IBOutlet UITableViewCell *invate;
@property (strong, nonatomic) IBOutlet UITableViewCell *about;

@end

@implementation XPMineTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor colorWithRed:234/255.0 green:235/255.0 blue:237/255.0 alpha:1];
    self.navigationItem.title = @"我的";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_reader_set"] style:UIBarButtonItemStylePlain target:self action:@selector(set)];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:110/255.0 green:111/255.0 blue:112/255.0 alpha:1];
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
            return self.loginOrRegister;
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
            XPLoginViewController *login = [XPLoginViewController new];
            [self.navigationController pushViewController:login animated:YES];
        }
            break;
        case 1:
        {
            if (indexPath.row == 0) {
                [self.navigationController pushViewController:[XPLoginViewController new] animated:YES];
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
                hud.mode = MBProgressHUDModeText;
                hud.labelText = NSLocalizedString(@"登录后再去账号中心哦", @"HUD message title");
                [hud hide:YES afterDelay:2];

            }else
            {
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
                hud.mode = MBProgressHUDModeText;
                hud.labelText = NSLocalizedString(@"登录后再去我的话题哦", @"HUD message title");
                [hud hide:YES afterDelay:2];

                 [self.navigationController pushViewController:[XPLoginViewController new] animated:YES];
            }
        }
            break;
        case 2:
        {
            if (indexPath.row == 0) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];

                                         
                UIAlertAction *shareAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
        
                [alert addAction:shareAction];
                [self presentViewController:alert animated:YES completion:nil];
            }else
            {
                [self.navigationController pushViewController:[XPFeedbackViewController new] animated:YES];
            }
        }
            break;
        case 3:
        {
            if (indexPath.row == 0) {
                
            }else
            {
                [self.navigationController pushViewController:[XPNovelListTableController new] animated:YES];
            }
        }
            break;

        default:
            break;
    }
    [self.tabBarController.tabBar setHidden:YES];
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
