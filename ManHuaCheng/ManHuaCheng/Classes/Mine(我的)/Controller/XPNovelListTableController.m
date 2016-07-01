//
//  XPNovelListTableController.m
//  ManHuaCheng
//
//  Created by dragon on 16/6/29.
//  Copyright © 2016年 win. All rights reserved.
//

#import "XPNovelListTableController.h"
#import "XPTableViewCell.h"
#import "XPNovel.h"
#import <AFNetworking.h>

@interface XPNovelListTableController ()
/** 小说列表 */
@property (nonatomic, strong) NSMutableArray *novelList;
@end

@implementation XPNovelListTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"小说";
    self.novelList = [NSMutableArray array];
 
    NSString *path = [NSString stringWithFormat:@"http://api.zhuishushenqi.com/outside/book-list?target=comicIsland"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
      
        NSLog(@"%@", dic);
        NSArray *novel = dic[@"books"];
        for (NSDictionary *dicBook in novel) {
            XPNovel *n = [[XPNovel alloc] initWithDic:dicBook];
            [self.novelList addObject:n];
            [self.tableView reloadData];
        }
       
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"解析失败");
    }];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"XPTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.novelList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    XPNovel *n = self.novelList[indexPath.row];
    cell.novel = n;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 91;
}
@end
