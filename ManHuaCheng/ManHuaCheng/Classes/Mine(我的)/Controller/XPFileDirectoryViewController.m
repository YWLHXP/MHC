//
//  XPFileDirectoryViewController.m
//  ManHuaCheng
//
//  Created by dragon on 16/7/6.
//  Copyright © 2016年 win. All rights reserved.
//

#import "XPFileDirectoryViewController.h"

@interface XPFileDirectoryViewController ()<UITableViewDataSource,UITableViewDelegate>
/** tableView */
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation XPFileDirectoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"手机文件目录";
    self.view.backgroundColor = [UIColor colorWithRed:234/255.0 green:235/255.0 blue:237/255.0 alpha:1];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, XPScreenWidth, 44) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.imageView.image = [UIImage imageNamed:@"mine_local_folder"];
    cell.textLabel.text = @"wifi传送目录";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}
@end
