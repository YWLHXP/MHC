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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"横竖屏设置";
            cell.detailTextLabel.text = @"竖屏";
            UISwitch *shuPingSwitch = [[UISwitch alloc] init];
            //添加事件
            [shuPingSwitch addTarget:self action:@selector(shuPingSwitch) forControlEvents:UIControlEventValueChanged];
            //用创建好的控件 给 accessoryView 赋值
            cell.accessoryView = shuPingSwitch;
        }else if(indexPath.row == 1)
        {
            cell.textLabel.text = @"左右手习惯";
            cell.detailTextLabel.text = @"右手";
            UISwitch *rightSwitch = [[UISwitch alloc] init];
            //添加事件
            [rightSwitch addTarget:self action:@selector(rightSwitch) forControlEvents:UIControlEventValueChanged];
            //用创建好的控件 给 accessoryView 赋值
            cell.accessoryView = rightSwitch;
        }else if(indexPath.row == 2)
        {
            cell.textLabel.text = @"图片显示";
            cell.detailTextLabel.text = @"适应";
            UISwitch *fitSwitch = [[UISwitch alloc] init];
            //添加事件
            [fitSwitch addTarget:self action:@selector(fitSwitch) forControlEvents:UIControlEventValueChanged];
            //用创建好的控件 给 accessoryView 赋值
            cell.accessoryView = fitSwitch;
        }else if(indexPath.row == 3)
        {
            cell.textLabel.text = @"预下载";
            cell.detailTextLabel.text = @"打开";
            UISwitch *openDownloadSwitch = [[UISwitch alloc] init];
            //添加事件
            [openDownloadSwitch addTarget:self action:@selector(openDownloadSwitch) forControlEvents:UIControlEventValueChanged];
            //用创建好的控件 给 accessoryView 赋值
            cell.accessoryView = openDownloadSwitch;
        }else if(indexPath.row == 4)
        {
            cell.textLabel.text = @"阅读时下载";
            cell.detailTextLabel.text = @"关闭";
            UISwitch *closeSwitch = [[UISwitch alloc] init];
            //添加事件
            [closeSwitch addTarget:self action:@selector(closeSwitch) forControlEvents:UIControlEventValueChanged];
            //用创建好的控件 给 accessoryView 赋值
            cell.accessoryView = closeSwitch;
        }else if(indexPath.row == 5)
        {
            cell.textLabel.text = @"弹幕";
            cell.detailTextLabel.text = @"打开";
            UISwitch *openScreenSwitch = [[UISwitch alloc] init];
            //添加事件
            [openScreenSwitch addTarget:self action:@selector(openScreenSwitch) forControlEvents:UIControlEventValueChanged];
            //用创建好的控件 给 accessoryView 赋值
            cell.accessoryView = openScreenSwitch;
        }else
        {
            cell.textLabel.text = @"自动购买";
            cell.detailTextLabel.text = @"关闭";
            UISwitch *autoBuy = [[UISwitch alloc] init];
            //添加事件
            [autoBuy addTarget:self action:@selector(autoBuy) forControlEvents:UIControlEventValueChanged];
            //用创建好的控件 给 accessoryView 赋值
            cell.accessoryView = autoBuy;
        }
    }else
    {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"下载完成提示";
            UISwitch *downloadDid = [[UISwitch alloc] init];
            //添加事件
            [downloadDid addTarget:self action:@selector(downloadDid) forControlEvents:UIControlEventValueChanged];
            //用创建好的控件 给 accessoryView 赋值
            cell.accessoryView = downloadDid;
            
        }if (indexPath.row == 1) {
            cell.textLabel.text = @"漫画更新提醒";
            UISwitch *update = [[UISwitch alloc] init];
            //添加事件
            [update addTarget:self action:@selector(update) forControlEvents:UIControlEventValueChanged];
            //用创建好的控件 给 accessoryView 赋值
            cell.accessoryView = update;
            
        }if (indexPath.row == 2) {
            cell.textLabel.text = @"仅适用WIFI网络";
            UISwitch *wifi = [[UISwitch alloc] init];
            //添加事件
            [wifi addTarget:self action:@selector(wifi) forControlEvents:UIControlEventValueChanged];
            //用创建好的控件 给 accessoryView 赋值
            cell.accessoryView = wifi;
            
        }else
        {
            cell.textLabel.text = @"清除在线缓存";
            cell.detailTextLabel.text = @"0.00MB";
        }
        
    }
    return cell;
}

- (void)shuPingSwitch
{
    
}

- (void)rightSwitch
{
    
}

- (void)fitSwitch
{
    
}

- (void)openDownloadSwitch
{
    
}

- (void)closeSwitch
{
    
}

- (void)openScreenSwitch
{
    
}

- (void)autoBuy
{
    
}

- (void)downloadDid
{
    
}

- (void)update
{
    
}

- (void)wifi
{
    
}

@end
