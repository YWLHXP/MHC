//
//  XPAboutMHCViewController.m
//  ManHuaCheng
//
//  Created by dragon on 16/6/30.
//  Copyright © 2016年 win. All rights reserved.
//

#import "XPAboutMHCViewController.h"

@interface XPAboutMHCViewController ()<UITableViewDataSource,UITableViewDelegate>
/** tableView */
@property (nonatomic, strong) UITableView *tableView;
/** titles */
@property (nonatomic, strong) NSArray *titles;
@end

@implementation XPAboutMHCViewController

- (void)viewDidLoad {
    self.titles = @[@"去评分吧",@"免责声明",@"关于我们",@"加入我们"];
   self.navigationItem.title = @"关于漫画城";
   self.view.backgroundColor = [UIColor colorWithRed:234/255.0 green:235/255.0 blue:237/255.0 alpha:1];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 185, XPScreenWidth, 175) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.titles[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

@end
