//
//  GCViewController.m
//  ManHuaCheng
//
//  Created by tarena21 on 16/7/1.
//  Copyright © 2016年 win. All rights reserved.
//
//#import "SVPullToRefresh.h"
#import "GCViewController.h"
#import "XPViewController.h"
@interface GCViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UITableViewCell *weiboCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *huaTicell;
@property (strong, nonatomic) IBOutlet UITableViewCell *quanzi;
@property (strong, nonatomic) IBOutlet UITableViewCell *touxiang;

@property (nonatomic,strong)UIScrollView *sv1;
@property (nonatomic,strong)UIScrollView *sv2;
@property(nonatomic,strong)UITableView *tbv;
@property (nonatomic,strong)UIView *vc;
@end

@implementation GCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *vc = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    vc.delegate =self;
    vc.dataSource = self;
    [self.view addSubview:vc];
    self.tbv = vc;
    self.tbv.separatorColor = [UIColor clearColor];
    __block UIViewController *weakSelf = self;
//    [self.tbv addPullToRefreshWithActionHandler:^{
//         [weakSelf performSelector:@selector(loading) withObject:nil afterDelay:2];
//    }];
    
    [self creatSv];
    [self Action];
}
//-(void)loading
//{
//    [self.tbv.pullToRefreshView stopAnimating];
//}
-(void)creatSv
{
    self.sv1 = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,60 )];
    self.sv1.delegate = self;
    self.sv1.contentSize = CGSizeMake(420, 0);
    
    [self.quanzi.contentView addSubview:self.sv1];
    
    self.sv2 = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,60 )];
    
    self.sv2.delegate = self;
    self.sv2.contentSize = CGSizeMake(420, 0);
    
    [self.touxiang.contentView addSubview:self.sv2];


}
-(void)Action
{
    for (int i= 0; i<6; i++)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i*60+i*10, 0, 60, 60)];
        
        NSString *pic = [NSString stringWithFormat:@"3%d.png",i];
        [btn setTitle:@"ddd" forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:pic] forState:UIControlStateNormal ];
        [self.sv1 addSubview:btn];
    }
    for (int i= 0; i<7; i++)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i*60+i*10, 0, 60, 60)];
        btn.layer.cornerRadius = 30;
        btn.layer.masksToBounds = YES;
         NSString *pic = [NSString stringWithFormat:@"2%d.jpg",i+2];
         [btn setImage:[UIImage imageNamed:pic] forState:UIControlStateNormal ];
        [self.sv2 addSubview:btn];
    }
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (indexPath.section == 0)
    {
        return self.weiboCell;
    }else if (indexPath.section == 2)
    {
        return self.huaTicell;
    }else if (indexPath.section == 1)
    {
        //[self.quanzi.contentView addSubview:self.sv1];
        return self.quanzi;
    }else
    {
        return self.touxiang;
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
            return 174;
            break;
        case 1:
            return 70;
            break;
        case 2:
            return 90;
            break;
        default:
           return 70;
    }
}
@end
