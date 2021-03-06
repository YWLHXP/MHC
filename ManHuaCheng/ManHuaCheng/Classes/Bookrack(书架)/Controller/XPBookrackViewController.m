//
//  XPBookrackViewController.m
//  ManHuaCheng
//
//  Created by dragon on 16/6/28.
//  Copyright © 2016年 win. All rights reserved.
//

#import "XPBookrackViewController.h"
#import "CollectionViewCell.h"
#import "NetworkManager.h"
#import "DataManager.h"
#import "BookrackListModel.h"
#import "UIImageView+WebCache.h"

#define LeftInset 60
#define TopInset 5
#define NaviHeight 44
#define ItemSpace 15
#define LineSpace 25
#define ItemHeight 130
#define TabBarHeight 49

@interface XPBookrackViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong)UISegmentedControl *sc;

@property (nonatomic, strong)UITableView *tableView;

@property(nonatomic,retain)UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *ListArray;

@end

@implementation XPBookrackViewController

-(UISegmentedControl *)sc{
    if (!_sc) {
        NSArray *arrList = [NSArray arrayWithObjects:@"历史",@"收藏",@"下载", nil];
        _sc = [[UISegmentedControl alloc]initWithItems:arrList];
        _sc.frame = CGRectMake(LeftInset, TopInset, XPScreenWidth-2*LeftInset, NaviHeight-2*TopInset);
        _sc.selectedSegmentIndex = 1;
        
        _sc.tintColor = [UIColor colorWithRed:223/255.0 green:32/255.0 blue:14/255.0 alpha:1];
        
        NSDictionary *dicSelect = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor, nil];
        [_sc setTitleTextAttributes:dicSelect forState:UIControlStateSelected];
        
        NSDictionary *dicNormal = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],UITextAttributeTextColor, nil];
        [_sc setTitleTextAttributes:dicNormal forState:UIControlStateNormal];
    }
    return _sc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //配置分段控件
    self.navigationItem.titleView = self.sc;
    
    UITableView *tv = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    tv.dataSource = self;
    tv.delegate = self;
    
    //设置表头视图
    tv.tableHeaderView = [[NSBundle mainBundle]loadNibNamed:@"BookrackHeaderView" owner:nil options:nil].lastObject;
    
    //设置表尾视图
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = ItemSpace;
    flowLayout.minimumLineSpacing = LineSpace;
    flowLayout.sectionInset = UIEdgeInsetsMake(TopInset, 20, TopInset, 20);
    flowLayout.itemSize = CGSizeMake((XPScreenWidth-70)/3, ItemHeight);
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0 , XPScreenWidth, XPScreenHeight-TabBarHeight+TopInset) collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"BR"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.scrollEnabled = NO;
    
    tv.tableFooterView = self.collectionView;
    
    [self.view addSubview:tv];
    
    self.tableView = tv;
    
    //发送请求
    [self sendRequestToServer];
    
    // Do any additional setup after loading the view.
}

-(void)sendRequestToServer{
    NSDictionary *params=@{@"appVersionName":@"3.4.7",
                           @"channel":@"appstore",
                           @"channelId":@"appstore",
                           @"apptype":@"1",
                           @"appversion":@"3.4.7",
                           @"osVersionCode":@"9.2.1",
                           @"timestamp":@"1467199092.895776",
                           @"mobileModel":@"iPhone7,2",};
    
    [NetworkManager sendRequestWithUrl:@"http://mhjk.1391.com/comic/gltj_v2" parameters:params success:^(id responseObject) {
        self.ListArray = [DataManager getBookrackListData:responseObject];
        [self.collectionView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"服务器请求失败:%@", error.userInfo);
        [self sendRequestToServer];
    }];
}


#pragma mark - TableView DataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"大家都在看";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - CollectionView DataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (collectionView == self.collectionView) {
        return self.ListArray.count;
    }
    else {
        return 0;
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BookrackListModel *listModel = [self.ListArray objectAtIndex:indexPath.item];
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BR" forIndexPath:indexPath];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:listModel.coverurl]placeholderImage:[UIImage imageNamed:@"place_hold_img_v"]];
    cell.label.text = listModel.bigbook_name;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
