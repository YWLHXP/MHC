//
//  XPNovelListTableController.m
//  ManHuaCheng
//
//  Created by dragon on 16/6/29.
//  Copyright © 2016年 win. All rights reserved.
//

#import "XPNovelListTableController.h"
#import "XPTableViewCell.h"
#import "XPNetworkRequest.h"

@interface XPNovelListTableController ()
/** 小说列表 */
@property (nonatomic, strong) NSArray *novelList;
@end

@implementation XPNovelListTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"小说";
    
    [XPNetworkRequest requestNovelListWithCallback:^(id obj) {
        self.novelList = obj;
        [self.tableView reloadData];
    }];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.novelList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[XPTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 91;
}
@end
