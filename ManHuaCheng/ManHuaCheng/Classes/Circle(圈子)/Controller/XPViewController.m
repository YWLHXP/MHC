//
//  XPViewController.m
//  ManHuaCheng
//
//  Created by tarena21 on 16/6/29.
//  Copyright © 2016年 win. All rights reserved.
//

#import "XPViewController.h"
#import "XPLoginViewController.h"
//#import "SVPullToRefresh.h"
@interface XPViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *MySv;
@property (strong, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UIImageView *leftimage;
@property (weak, nonatomic) IBOutlet UIImageView *Rightimage;
@property (weak, nonatomic) IBOutlet UITableView *Mytable;
@property (nonatomic,strong)NSMutableArray *allDatas;
@property (strong, nonatomic) IBOutlet UITableViewCell *cell1;
@property (strong, nonatomic) IBOutlet UITableViewCell *cell2;
@property (strong, nonatomic) IBOutlet UITableViewCell *cell3;
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property (weak, nonatomic) IBOutlet UIImageView *image3;
@property(nonatomic,strong)UIPageControl *pageControl;
@property (nonatomic)int index;
@property (nonatomic,strong)NSTimer *timer;


@end

@implementation XPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.titleView = self.titleView;
    self.titleView.backgroundColor = [UIColor whiteColor];
    [self setBarButtonItem];
    [self Action];
    self.allDatas = [NSMutableArray array];
    self.navigationController.navigationBar.tintColor = [UIColor clearColor];

    //上拉刷新
//    [self.Mytable addInfiniteScrollingWithActionHandler:^{
//        NSLog(@"=====");
//        [self performSelector:@selector(loading) withObject:nil afterDelay:2];
//        
//        
//    }];
    [self setBarButtonItem];
    [self configPageControl];
    [self awakeFromNib];
   

}
//把头像变成圆形
-(void)awakeFromNib
{
    self.image1.layer.cornerRadius = self.image1.frame.size.width/2;
    self.image1.layer.masksToBounds = YES;
    self.image2.layer.cornerRadius = self.image2.frame.size.width/2;
    self.image2.layer.masksToBounds = YES;
    self.image3.layer.cornerRadius = self.image3.frame.size.width/2;
    self.image3.layer.masksToBounds = YES;
}
-(void)setBarButtonItem
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"v3_post_topic_nor"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(Login:)];


}
//-(void)loading
//{
//    [self.Mytable.infiniteScrollingView stopAnimating];
//}

-(void)Login:(UIBarButtonItem*)btn
{
    XPLoginViewController *vc = [XPLoginViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    [self.tabBarController.tabBar setHidden:YES];
}

//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    //return self.sections.count;
//    return 1;
//}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   //NSArray *arr = self.alldates[section];
    //return arr.count;
   
   return 3;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"cell"];
        
    }
    if (indexPath.row == 0)
    {
        return self.cell1;
    }else if (indexPath.row ==1)
    {
        return self.cell2;
    }else
    {
        return self.cell3;
    }

  
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XPLoginViewController *vc = [XPLoginViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"推荐达人";
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(void)Action
{
    self.MySv.contentSize = CGSizeMake(self.MySv.frame.size.width*2, 0);
    for (int i = 0; i<2; i++)
    {
        NSString *name = [NSString stringWithFormat:@"1%d.jpg",i+1];
        UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(i*375, 0, self.MySv.frame.size.width, self.MySv.frame.size.height)];
        iv.image = [UIImage imageNamed:name];
        [self.MySv addSubview:iv];
        iv.userInteractionEnabled = YES;
        
    }
    //去掉水平方向 和 垂直方向滑动条
    self.MySv.showsHorizontalScrollIndicator = NO;
    self.MySv.showsVerticalScrollIndicator = NO;
    //是否可以进行画面切换
    self.MySv.pagingEnabled = YES;
    //关闭弹性
    self.MySv.bounces = NO;
    

     self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(changedImage) userInfo:nil repeats:YES];
    
}
-(void)viewDidDisappear:(BOOL)animated
{
    [self.timer invalidate];
}
-(void)changedImage
{
    
    //[self.MySv setContentOffset:CGPointMake(++self.index%2*375, 0)];
    if (self.pageControl.currentPage == 0)
    {
        [self.MySv setContentOffset:CGPointMake(self.view.frame.size.width,0 ) animated:YES];
        self.pageControl.currentPage = 1;

    }
    else
    {
        [self.MySv setContentOffset:CGPointMake(0, 0) animated:NO];
        self.pageControl.currentPage = 0;
    }
    
    
}

-(void)configPageControl
{
    self.pageControl = [[UIPageControl alloc]init];
    self.pageControl.frame = CGRectMake((375-40)/2, 150, 40,10);
    //设置一共有几个点
    self.pageControl.numberOfPages = 2;
    //设置当前选中的 是 第几个点
    self.pageControl.currentPage = 0;
    //设置没有选中点 的颜色
    self.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    //设置当前选中的 点 的颜色
    self.pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    //关闭 pageControl 的交互
    self.pageControl.userInteractionEnabled = NO;
    
    [self.view addSubview:self.pageControl];
}

@end
