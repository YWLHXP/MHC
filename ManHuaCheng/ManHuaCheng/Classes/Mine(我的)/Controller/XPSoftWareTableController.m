//
//  XPSoftWareTableController.m
//  ManHuaCheng
//
//  Created by dragon on 16/6/29.
//  Copyright © 2016年 win. All rights reserved.
//

#import "XPSoftWareTableController.h"

@interface XPSoftWareTableController ()

@end

@implementation XPSoftWareTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"软件设置";
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:234/255.0 green:235/255.0 blue:237/255.0 alpha:1];
    [self.tabBarController.tabBar setHidden:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 7;
    }else
    {
        return 4;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"横竖屏设置";
            cell.detailTextLabel.text = @"竖屏";
            UISwitch *shuPingSwitch = [[UISwitch alloc] init];
            shuPingSwitch.on = YES;
            shuPingSwitch.onTintColor = [UIColor redColor];
            //添加事件
            [shuPingSwitch addTarget:self action:@selector(shuPingSwitch:) forControlEvents:UIControlEventValueChanged];
            //用创建好的控件 给 accessoryView 赋值
            cell.accessoryView = shuPingSwitch;
        }else if(indexPath.row == 1)
        {
            cell.textLabel.text = @"左右手习惯";
            cell.detailTextLabel.text = @"右手";
            UISwitch *rightSwitch = [[UISwitch alloc] init];
            rightSwitch.on = YES;
            rightSwitch.onTintColor = [UIColor redColor];
            //添加事件
            [rightSwitch addTarget:self action:@selector(rightSwitch:) forControlEvents:UIControlEventValueChanged];
            //用创建好的控件 给 accessoryView 赋值
            cell.accessoryView = rightSwitch;
        }else if(indexPath.row == 2)
        {
            cell.textLabel.text = @"图片显示";
            cell.detailTextLabel.text = @"适应";
            UISwitch *fitSwitch = [[UISwitch alloc] init];
            fitSwitch.on = YES;
            fitSwitch.onTintColor = [UIColor redColor];
            //添加事件
            [fitSwitch addTarget:self action:@selector(fitSwitch:) forControlEvents:UIControlEventValueChanged];
            //用创建好的控件 给 accessoryView 赋值
            cell.accessoryView = fitSwitch;
        }else if(indexPath.row == 3)
        {
            cell.textLabel.text = @"预下载";
            cell.detailTextLabel.text = @"打开";
            UISwitch *openDownloadSwitch = [[UISwitch alloc] init];
            openDownloadSwitch.on = YES;
            openDownloadSwitch.onTintColor = [UIColor redColor];
            //添加事件
            [openDownloadSwitch addTarget:self action:@selector(openDownloadSwitch:) forControlEvents:UIControlEventValueChanged];
            //用创建好的控件 给 accessoryView 赋值
            cell.accessoryView = openDownloadSwitch;
        }else if(indexPath.row == 4)
        {
            cell.textLabel.text = @"阅读时下载";
            cell.detailTextLabel.text = @"关闭";
            UISwitch *closeSwitch = [[UISwitch alloc] init];
            closeSwitch.on = NO;
            closeSwitch.onTintColor = [UIColor redColor];
            //添加事件
            [closeSwitch addTarget:self action:@selector(closeSwitch:) forControlEvents:UIControlEventValueChanged];
            //用创建好的控件 给 accessoryView 赋值
            cell.accessoryView = closeSwitch;
        }else if(indexPath.row == 5)
        {
            cell.textLabel.text = @"弹幕";
            cell.detailTextLabel.text = @"打开";
            UISwitch *openScreenSwitch = [[UISwitch alloc] init];
            openScreenSwitch.on = YES;
            openScreenSwitch.onTintColor = [UIColor redColor];
            //添加事件
            [openScreenSwitch addTarget:self action:@selector(openScreenSwitch:) forControlEvents:UIControlEventValueChanged];
            //用创建好的控件 给 accessoryView 赋值
            cell.accessoryView = openScreenSwitch;
        }else if(indexPath.row == 6)
        {
            cell.textLabel.text = @"自动购买";
            cell.detailTextLabel.text = @"关闭";
            UISwitch *autoBuy = [[UISwitch alloc] init];
            autoBuy.on = NO;
            autoBuy.onTintColor = [UIColor redColor];

            //添加事件
            [autoBuy addTarget:self action:@selector(autoBuy:) forControlEvents:UIControlEventValueChanged];
            //用创建好的控件 给 accessoryView 赋值
            cell.accessoryView = autoBuy;
        }else //避免辅助视图重用时出现意外
        {
            cell.accessoryView = nil;
        }
    }else if(indexPath.section == 1)
    {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"下载完成提示";
            UISwitch *downloadDid = [[UISwitch alloc] init];
            downloadDid.on = YES;
            downloadDid.onTintColor = [UIColor redColor];
            [downloadDid addTarget:self action:@selector(downloadDid:) forControlEvents:UIControlEventValueChanged];
            cell.accessoryView = downloadDid;
            
        }if (indexPath.row == 1) {
            cell.textLabel.text = @"漫画更新提醒";
            UISwitch *update = [[UISwitch alloc] init];
            update.on = YES;
            update.onTintColor = [UIColor redColor];
            [update addTarget:self action:@selector(update:) forControlEvents:UIControlEventValueChanged];
            cell.accessoryView = update;
            
        }if (indexPath.row == 2) {
            cell.textLabel.text = @"仅适用WIFI网络";
            UISwitch *wifi = [[UISwitch alloc] init];
            wifi.on = YES;
            wifi.onTintColor = [UIColor redColor];

            [wifi addTarget:self action:@selector(wifi:) forControlEvents:UIControlEventValueChanged];
            cell.accessoryView = wifi;
        }if (indexPath.row == 3)
        {
            cell.textLabel.text = @"清除在线缓存";
            cell.detailTextLabel.text = @"0.00MB";
        }
    }
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return [self backViewWithTitle:@"阅读设置"];
    }else
    {
        return [self backViewWithTitle:@"操作设置"];
    }
    
}

- (UIView *)backViewWithTitle:(NSString *)title
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor colorWithRed:234/255.0 green:235/255.0 blue:237/255.0 alpha:1];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(17, 15, XPScreenWidth, 20)];
    label.font = [UIFont systemFontOfSize:13];
    label.text = title;
    label.textColor = [UIColor colorWithRed:105/255.0 green:106/255.0 blue:108/255.0 alpha:1];
    [view addSubview:label];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (void)shuPingSwitch:(UISwitch*)sender
{

    
}

- (void)rightSwitch:(UISwitch*)sender
{
    
}

- (void)fitSwitch:(UISwitch*)sender
{
    
}

- (void)openDownloadSwitch:(UISwitch*)sender
{
    
}

- (void)closeSwitch:(UISwitch*)sender
{
    
}

- (void)openScreenSwitch:(UISwitch*)sender
{
    
}

- (void)autoBuy:(UISwitch*)sender
{
    
}

- (void)downloadDid:(UISwitch*)sender
{
    
}

- (void)update:(UISwitch*)sender
{
    
}

- (void)wifi:(UISwitch*)sender
{
    
}

@end
