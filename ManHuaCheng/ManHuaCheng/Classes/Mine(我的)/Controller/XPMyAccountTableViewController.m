//
//  XPMyAccountTableViewController.m
//  ManHuaCheng
//
//  Created by dragon on 16/7/6.
//  Copyright © 2016年 win. All rights reserved.
//

#import "XPMyAccountTableViewController.h"

@interface XPMyAccountTableViewController ()
@property (strong, nonatomic) IBOutlet UITableViewCell *myAccount;
@property (strong, nonatomic) IBOutlet UITableViewCell *myVIP;

@end

@implementation XPMyAccountTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor colorWithRed:234/255.0 green:235/255.0 blue:237/255.0 alpha:1];
    self.navigationItem.title = @"我的账户";
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
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
    if (indexPath.section == 0) {
        self.myAccount.selectionStyle = UITableViewCellSelectionStyleNone;
        return self.myAccount;
    }else
    {
        self.myVIP.selectionStyle = UITableViewCellSelectionStyleNone;
        return self.myVIP;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 171;
    }else
    {
        return 222;
    }
}

@end
