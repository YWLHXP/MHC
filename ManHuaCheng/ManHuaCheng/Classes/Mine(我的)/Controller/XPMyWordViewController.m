//
//  XPMyWordViewController.m
//  ManHuaCheng
//
//  Created by dragon on 16/7/6.
//  Copyright © 2016年 win. All rights reserved.
//

#import "XPMyWordViewController.h"

@interface XPMyWordViewController ()<UITableViewDataSource,UITableViewDelegate>
/** tableView */
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation XPMyWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的话题";
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor grayColor];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}
@end
