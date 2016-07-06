//
//  XPBookcityViewController.m
//  ManHuaCheng
//
//  Created by dragon on 16/6/28.
//  Copyright © 2016年 win. All rights reserved.
//

#import "XPBookcityViewController.h"
#import "UIImage+UIImageCategory.h"
#import "DataManager.h"
#import "UIImageView+WebCache.h"
#import "NetworkManager.h"
#import "SMPageControl.h"

#import "BookcitySpecialsModel.h"
#import "BookcitySpecialsCollectionViewCell.h"

#import "BookcityCreatModel.h"
#import "BookcityCreatCollectionViewCell.h"
#import "ADBookcityCreatCollectionViewCell.h"

#import "BookcityRankingListModel.h"
#import "ADBookcityRankingListCollectionViewCell.h"

#import "BookcityRecomendModel.h"
#import "BookcityRecomendCollectionViewCell.h"
#import "ADBookcityRecomendCollectionViewCell.h"



#define Space 15
#define NaviHeight 44
#define StatusHeight 20
#define TabBarHeight 49
#define LabelHeight 30
#define ADRCollectionWidth self.ADRecomendCollectionView.bounds.size.width
#define ADRCollectionHeight self.ADRecomendCollectionView.bounds.size.height
#define ADRLCollectionWidth self.ADRankingListCollectionView.bounds.size.width
#define ADRLCollectionHeight self.ADRankingListCollectionView.bounds.size.height
#define ADCCollectionWidth self.ADCreatCollectionView.bounds.size.width
#define ADCCollectionHeight self.ADCreatCollectionView.bounds.size.height
#define ViewWidth self.view.bounds.size.width
#define ViewHeight self.view.bounds.size.height

@interface XPBookcityViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIImageView *LImageView;
@property (nonatomic, strong) UICollectionView *mainCollectionView;

@property (nonatomic, strong) UIButton *recomendButton;
@property (nonatomic, strong) UIButton *rankingListButton;
@property (nonatomic, strong) UIButton *creatButton;
@property (nonatomic, strong) UIButton *specialButton;

//记录按钮高度
@property (nonatomic, assign) CGSize size;
//记录右端图片
@property (nonatomic, strong) UIImageView *PHImageView;

//书单使用
@property (nonatomic, strong) UICollectionView *specialsListCollectionView;
@property (nonatomic, strong) NSArray *specialsListArray;

//原创使用
@property (nonatomic, strong) NSArray *creatListArray;
@property (nonatomic, strong) UICollectionView *creatCollectionView;
@property (nonatomic, strong) NSMutableArray *ADCreatArray;
@property (nonatomic, strong) UICollectionView *ADCreatCollectionView;
@property (nonatomic, strong) SMPageControl *creatPageControl;
@property (nonatomic, strong) UITableView *creatTableView;

//榜单使用
@property (nonatomic, strong) UITableView *rankingListTableView;
@property (nonatomic, strong) NSArray *rankingListArray;
@property (nonatomic, strong) NSMutableArray *ADRankingListArray;
@property (nonatomic, strong) UICollectionView *ADRankingListCollectionView;
@property (nonatomic, strong) SMPageControl *rankingListPageControl;

//推荐使用
@property (nonatomic, strong) UITableView *recomendTableView;
@property (nonatomic, strong) SMPageControl *recomendPageControl;
@property (nonatomic, strong) NSArray *recomendArray;
@property (nonatomic, strong) NSMutableArray *ADRecomendArray;
@property (nonatomic, strong) UICollectionView *recomendCollectionView;
@property (nonatomic, strong) UICollectionView *ADRecomendCollectionView;

@end

@implementation XPBookcityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XPScreenWidth, self.navigationController.navigationBar.frame.size.height)];
    view.backgroundColor = [UIColor clearColor];
    
    //推荐按钮
    self.recomendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.recomendButton.frame = CGRectMake(0, 0, (XPScreenWidth-3)/4, view.frame.size.height);
    self.recomendButton.tag = 1;
    [self setButtonWithSender:self.recomendButton Title:@"推荐" andNorImage:[UIImage imageNamed:@"city_nav_recomend_nor"] andHighImage:[UIImage imageNamed:@"city_nav_recomend_sel"]];
    self.recomendButton.selected = YES;
    [self.recomendButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:self.recomendButton];
    //按钮下端图片
    self.LImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.recomendButton.bounds.size.height-10, (XPScreenWidth-3)/4, 10)];
    self.LImageView.image = [UIImage imageNamed:@"navigationSelLine"];
    self.size = self.recomendButton.bounds.size;
    [view addSubview:self.LImageView];
    //按钮右端图片
    [self setImageWithFrameButton:self.recomendButton andSuperView:view];
    
    //榜单按钮
    self.rankingListButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rankingListButton.frame = CGRectMake(self.PHImageView.frame.origin.x+1, 0, (XPScreenWidth-3)/4, view.frame.size.height);
    self.rankingListButton.tag = 2;
    [self setButtonWithSender:self.rankingListButton Title:@"榜单" andNorImage:[UIImage imageNamed:@"city_nav_rankingList_nor"] andHighImage:[UIImage imageNamed:@"city_nav_rankingList_sel"]];
    [self.rankingListButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:self.rankingListButton];
    [self setImageWithFrameButton:self.rankingListButton andSuperView:view];
    
    //原创按钮
    self.creatButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.creatButton.frame = CGRectMake(self.PHImageView.frame.origin.x+1, 0, (XPScreenWidth-3)/4, view.frame.size.height);
    self.creatButton.tag = 3;
    [self setButtonWithSender:self.creatButton Title:@"原创" andNorImage:[UIImage imageNamed:@"city_nav_creat_nor"] andHighImage:[UIImage imageNamed:@"city_nav_creat_sel"]];
    [self.creatButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:self.creatButton];
    [self setImageWithFrameButton:self.creatButton andSuperView:view];
    
    //书单按钮
    self.specialButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.specialButton.frame = CGRectMake(self.PHImageView.frame.origin.x+1, 0, (XPScreenWidth-3)/4, view.frame.size.height);
    self.specialButton.tag = 4;
    [self setButtonWithSender:self.specialButton Title:@"书单" andNorImage:[UIImage imageNamed:@"city_nav_special_nor"] andHighImage:[UIImage imageNamed:@"city_nav_special_sel"]];
    [self.specialButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:self.specialButton];
    
    [self.navigationController.navigationBar addSubview:view];
    
    //主界面配置
    [self configCollectionView:self.mainCollectionView];
    
    //书单配置
    [self sendSpecialsRequestToServer];
    [self configCollectionView:self.specialsListCollectionView];
    
    //原创配置
    [self sendCreatRequestToServer];
    [self configCollectionView:self.creatCollectionView];
    [self configTableView:self.creatTableView];
    [self configADCollectionView:self.ADCreatCollectionView];
    [self sendADandRecomendRequestToServer:@"70"];
    
    //榜单配置
    [self configTableView:self.rankingListTableView];
    [self sendRankingListRequestToServer];
    [self configADCollectionView:self.ADRankingListCollectionView];
    [self sendADandRecomendRequestToServer:@"72"];
    
    //推荐配置
    [self sendADandRecomendRequestToServer:@"71"];
    [self configCollectionView:self.recomendCollectionView];
    [self configTableView:self.recomendTableView];
    [self configADCollectionView:self.ADRecomendCollectionView];
    [self sendADandRecomendRequestToServer:@"69"];
    
    // Do any additional setup after loading the view.
}

#pragma mark - 按钮右端图片
-(void)setImageWithFrameButton:(UIButton *)button
                  andSuperView:(UIView *)view{
    UIImageView *ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(button.frame.origin.x+button.frame.size.width, 0, 1, button.frame.size.height)];
    ImageView.image = [UIImage imageNamed:@"navigationLine"];
    self.PHImageView = ImageView;
    [view addSubview:ImageView];
}
#pragma mark - 按钮属性
-(void)setButtonWithSender:(UIButton *)sender
                     Title:(NSString *)title
               andNorImage:(UIImage *)norImage
              andHighImage:(UIImage *)highImage{
    [sender setTitle:title forState:UIControlStateNormal];
    sender.font = [UIFont systemFontOfSize:15];
    [sender setTitleColor:[UIColor colorWithRed:222/255.0 green:32/255.0 blue:14/255.0 alpha:1] forState:UIControlStateSelected];
    [sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [sender setImage:norImage  forState:UIControlStateNormal];
    [sender setImage:highImage  forState:UIControlStateSelected];
    sender.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    //文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [sender setTitleEdgeInsets:UIEdgeInsetsMake(sender.imageView.frame.size.height ,-sender.imageView.frame.size.width, 0,0)];
    //图片距离右边框距离减少图片的宽度，其它不边
    [sender setImageEdgeInsets:UIEdgeInsetsMake(-20, 0,0, -sender.titleLabel.bounds.size.width)];
}
#pragma mark - 按钮事件
- (void)buttonAction:(UIButton *)btn{
    if (btn.tag == 1) {
        btn.selected = YES;
        self.rankingListButton.selected = NO;
        self.creatButton.selected = NO;
        self.specialButton.selected = NO;
        [self.mainCollectionView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    if (btn.tag == 2) {
        btn.selected = YES;
        self.recomendButton.selected = NO;
        self.creatButton.selected = NO;
        self.specialButton.selected = NO;
        [self.mainCollectionView setContentOffset:CGPointMake(XPScreenWidth, 0) animated:YES];
    }
    if (btn.tag == 3) {
        btn.selected = YES;
        self.recomendButton.selected = NO;
        self.rankingListButton.selected = NO;
        self.specialButton.selected = NO;
        [self.mainCollectionView setContentOffset:CGPointMake(XPScreenWidth*2, 0) animated:YES];
    }
    if (btn.tag == 4) {
        btn.selected = YES;
        self.recomendButton.selected = NO;
        self.creatButton.selected = NO;
        self.rankingListButton.selected = NO;
        [self.mainCollectionView setContentOffset:CGPointMake(XPScreenWidth*3, 0) animated:YES];
    }
}

#pragma mark - TV界面
-(void)configTableView:(UITableView *)tableView{
    //推荐界面
    if (tableView == self.recomendTableView) {
        self.recomendTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, XPScreenWidth, XPScreenHeight) style:UITableViewStylePlain];
        self.recomendTableView.contentInset = UIEdgeInsetsMake(NaviHeight+StatusHeight, 0, TabBarHeight, 0);
        self.recomendTableView.delegate = self;
        self.recomendTableView.dataSource = self;
        self.recomendTableView.backgroundColor = [UIColor colorWithRed:245/255.0 green:242/255.0 blue:246/255.0 alpha:1];
        self.recomendTableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ViewWidth, ViewHeight/7*2)];
        self.recomendTableView.tableFooterView = self.recomendCollectionView;
        self.recomendTableView.rowHeight = 0.1;
    }
    //榜单界面
    if (tableView == self.rankingListTableView) {
        self.rankingListTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, XPScreenWidth, XPScreenHeight) style:UITableViewStylePlain];
        self.rankingListTableView.contentInset = UIEdgeInsetsMake(NaviHeight+StatusHeight, 0, TabBarHeight, 0);
        self.rankingListTableView.dataSource = self;
        self.rankingListTableView.delegate = self;
        self.rankingListTableView.rowHeight=100;
        self.rankingListTableView.backgroundColor = [UIColor colorWithRed:245/255.0 green:242/255.0 blue:246/255.0 alpha:1];
        self.rankingListTableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ViewWidth, ViewHeight/7*2)];
    }
    //原创界面
    if (tableView == self.creatTableView) {
        self.creatTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, XPScreenWidth, XPScreenHeight) style:UITableViewStylePlain];
        self.creatTableView.contentInset = UIEdgeInsetsMake(NaviHeight+StatusHeight, 0, TabBarHeight, 0);
        self.creatTableView.delegate = self;
        self.creatTableView.dataSource = self;
        self.creatTableView.backgroundColor = [UIColor colorWithRed:245/255.0 green:242/255.0 blue:246/255.0 alpha:1];
        self.creatTableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ViewWidth, ViewHeight/7*2)];
        self.creatTableView.tableFooterView = self.creatCollectionView;
        self.creatTableView.rowHeight = 0.1;
    }
}

#pragma mark - CV界面
-(void)configCollectionView:(UICollectionView *)collectionView{
    //主界面
    if (collectionView == self.mainCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize = CGSizeMake(XPScreenWidth, XPScreenHeight);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.mainCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, XPScreenWidth, XPScreenHeight) collectionViewLayout:flowLayout];
        self.mainCollectionView.delegate = self;
        self.mainCollectionView.dataSource = self;
        self.mainCollectionView.pagingEnabled = YES;
        self.mainCollectionView.showsHorizontalScrollIndicator = NO;
        self.mainCollectionView.bounces = NO;
        self.mainCollectionView.backgroundColor = [UIColor colorWithRed:245/255.0 green:242/255.0 blue:246/255.0 alpha:1];
        [self.view addSubview:self.mainCollectionView];
        [self.mainCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"MC"];
    }
    //推荐界面
    if (collectionView == self.recomendCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize = CGSizeMake((XPScreenWidth-Space*3)/2, (XPScreenWidth-Space*3)/2-LabelHeight);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.minimumLineSpacing = Space;
        flowLayout.minimumInteritemSpacing = Space;
        flowLayout.sectionInset = UIEdgeInsetsMake(Space, Space, Space+TabBarHeight, Space);
        self.recomendCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, XPScreenWidth, XPScreenHeight*59) collectionViewLayout:flowLayout];
        self.recomendCollectionView.delegate = self;
        self.recomendCollectionView.dataSource = self;
        self.recomendCollectionView.backgroundColor = [UIColor colorWithRed:245/255.0 green:242/255.0 blue:246/255.0 alpha:1];
        self.recomendCollectionView.scrollEnabled = NO;
        [self.recomendCollectionView registerClass:[BookcityRecomendCollectionViewCell class] forCellWithReuseIdentifier:@"RC"];
    }
    //原创界面
    if (collectionView == self.creatCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize = CGSizeMake((XPScreenWidth-Space*3)/2, (XPScreenWidth-Space*3)/2-LabelHeight);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.minimumLineSpacing = Space;
        flowLayout.minimumInteritemSpacing = Space;
        flowLayout.sectionInset = UIEdgeInsetsMake(Space, Space, Space+TabBarHeight, Space);
        self.creatCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, XPScreenWidth, XPScreenHeight+TabBarHeight/2) collectionViewLayout:flowLayout];
        self.creatCollectionView.delegate = self;
        self.creatCollectionView.dataSource = self;
        self.creatCollectionView.backgroundColor = [UIColor colorWithRed:245/255.0 green:242/255.0 blue:246/255.0 alpha:1];
        self.creatCollectionView.scrollEnabled = NO;
        [self.creatCollectionView registerClass:[BookcityCreatCollectionViewCell class] forCellWithReuseIdentifier:@"CC"];
    }
    //书单界面
    if (collectionView == self.specialsListCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize = CGSizeMake((XPScreenWidth-Space*3)/2, (XPScreenWidth-Space*3)/2+LabelHeight);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.minimumLineSpacing = Space;
        flowLayout.minimumInteritemSpacing = Space;
        flowLayout.sectionInset = UIEdgeInsetsMake(NaviHeight+StatusHeight+Space, Space, Space+TabBarHeight, Space);
        self.specialsListCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, XPScreenWidth, XPScreenHeight) collectionViewLayout:flowLayout];
        self.specialsListCollectionView.delegate = self;
        self.specialsListCollectionView.dataSource = self;
        self.specialsListCollectionView.backgroundColor = [UIColor colorWithRed:245/255.0 green:242/255.0 blue:246/255.0 alpha:1];
        [self.specialsListCollectionView registerClass:[BookcitySpecialsCollectionViewCell class] forCellWithReuseIdentifier:@"SLC"];
    }
}

#pragma mark - 广告界面
-(void)configADCollectionView:(UICollectionView *)collectionView{
    //推荐界面
    if (collectionView == self.ADRecomendCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize = CGSizeMake(ViewWidth, ViewHeight/7*2);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing = 0;
        self.ADRecomendCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ViewWidth, ViewHeight/7*2) collectionViewLayout:flowLayout];
        self.ADRecomendCollectionView.showsHorizontalScrollIndicator = NO;
        self.ADRecomendCollectionView.backgroundColor = [UIColor whiteColor];
        self.ADRecomendCollectionView.dataSource = self;
        self.ADRecomendCollectionView.delegate = self;
        self.ADRecomendCollectionView.pagingEnabled = YES;
        [self.recomendTableView.tableHeaderView addSubview:self.ADRecomendCollectionView];
        self.recomendPageControl = [[SMPageControl alloc]initWithFrame:CGRectMake(ADRCollectionWidth/2, ADRCollectionHeight-20, 180, 20)];
        self.recomendPageControl.alignment = SMPageControlAlignmentRight;
        self.recomendPageControl.userInteractionEnabled = NO;
        [self.recomendPageControl setPageIndicatorImage:[UIImage imageNamed:@"bookcity_ad_nor"]];
        [self.recomendPageControl setCurrentPageIndicatorImage:[UIImage imageNamed:@"bookcity_ad_sel"]];
        self.recomendPageControl.indicatorMargin = 2.0f;
        [self.recomendTableView.tableHeaderView addSubview:self.recomendPageControl];
        //轮播计时器
        [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(timerRecomendAction:) userInfo:nil repeats:YES];
        [self.ADRecomendCollectionView registerClass:[ADBookcityRecomendCollectionViewCell class] forCellWithReuseIdentifier:@"ADRC"];
    }
    //榜单界面
    if (collectionView == self.ADRankingListCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize = CGSizeMake(ViewWidth, ViewHeight/7*2);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing = 0;
        self.ADRankingListCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ViewWidth, ViewHeight/7*2) collectionViewLayout:flowLayout];
        self.ADRankingListCollectionView.showsHorizontalScrollIndicator = NO;
        self.ADRankingListCollectionView.backgroundColor = [UIColor whiteColor];
        self.ADRankingListCollectionView.dataSource = self;
        self.ADRankingListCollectionView.delegate = self;
        self.ADRankingListCollectionView.pagingEnabled = YES;
        [self.rankingListTableView.tableHeaderView addSubview:self.ADRankingListCollectionView];
        self.rankingListPageControl = [[SMPageControl alloc]initWithFrame:CGRectMake(ADRLCollectionWidth/2, ADRLCollectionHeight-20, 180, 20)];
        self.rankingListPageControl.alignment = SMPageControlAlignmentRight;
        self.rankingListPageControl.userInteractionEnabled = NO;
        [self.rankingListPageControl setPageIndicatorImage:[UIImage imageNamed:@"bookcity_ad_nor"]];
        [self.rankingListPageControl setCurrentPageIndicatorImage:[UIImage imageNamed:@"bookcity_ad_sel"]];
        self.rankingListPageControl.indicatorMargin = 2.0f;
        [self.rankingListTableView.tableHeaderView addSubview:self.rankingListPageControl];
        //轮播计时器
        [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(timerRankingListAction:) userInfo:nil repeats:YES];
        [self.ADRankingListCollectionView registerClass:[ADBookcityRankingListCollectionViewCell class] forCellWithReuseIdentifier:@"ADRLC"];
    }
    //原创界面
    if (collectionView == self.ADCreatCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize = CGSizeMake(ViewWidth, ViewHeight/7*2);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing = 0;
        self.ADCreatCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ViewWidth, ViewHeight/7*2) collectionViewLayout:flowLayout];
        self.ADCreatCollectionView.showsHorizontalScrollIndicator = NO;
        self.ADCreatCollectionView.backgroundColor = [UIColor whiteColor];
        self.ADCreatCollectionView.dataSource = self;
        self.ADCreatCollectionView.delegate = self;
        self.ADCreatCollectionView.pagingEnabled = YES;
        [self.creatTableView.tableHeaderView addSubview:self.ADCreatCollectionView];
        self.creatPageControl = [[SMPageControl alloc]initWithFrame:CGRectMake(ADRLCollectionWidth/2, ADRLCollectionHeight-20, 180, 20)];
        self.creatPageControl.alignment = SMPageControlAlignmentRight;
        self.creatPageControl.userInteractionEnabled = NO;
        [self.creatPageControl setPageIndicatorImage:[UIImage imageNamed:@"bookcity_ad_nor"]];
        [self.creatPageControl setCurrentPageIndicatorImage:[UIImage imageNamed:@"bookcity_ad_sel"]];
        self.creatPageControl.indicatorMargin = 2.0f;
        [self.creatTableView.tableHeaderView addSubview:self.creatPageControl];
        //轮播计时器
        [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(timerCreatAction:) userInfo:nil repeats:YES];
        [self.ADCreatCollectionView registerClass:[ADBookcityCreatCollectionViewCell class] forCellWithReuseIdentifier:@"ADCC"];
    }
}

#pragma mark - 网络请求
-(void)sendRankingListRequestToServer{
    NSDictionary *params=@{@"system":@"2",
                           @"channel":@"appstore",
                           @"channelId":@"appstore",
                           @"apptype":@"1",
                           @"retype":@"1",
                           @"appVersionName":@"3.4.7",
                           @"appversion":@"3.4.7",
                           @"osVersionCode":@"9.2.1",
                           @"timestamp":@"1467199092.895776",
                           @"appType":@"1",
                           @"mobileModel":@"iPhone7,2"};
    [NetworkManager sendRequestWithUrl:@"http://mhjk.1391.com/comic/recommendspecial_sb" parameters:params success:^(id responseObject) {
        self.rankingListArray = [DataManager getBookcityRankingListData:responseObject];
        [self.rankingListTableView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"服务器请求失败:%@", error.userInfo);
        [self sendRankingListRequestToServer];
    }];
}
-(void)sendCreatRequestToServer{
    NSDictionary *params=@{@"appVersionName":@"3.4.7",
                           @"channel":@"appstore",
                           @"channelId":@"appstore",
                           @"apptype":@"1",
                           @"appversion":@"3.4.7",
                           @"osVersionCode":@"9.2.1",
                           @"appType":@"1",
                           @"timestamp":@"1467199092.895776",
                           @"mobileModel":@"iPhone7,2"};
    [NetworkManager sendRequestWithUrl:@"http://mhjk.1391.com/comic/comicslist_v2_sb" parameters:params success:^(id responseObject) {
        self.creatListArray = [DataManager getBookcityCreatData:responseObject];
        [self.creatCollectionView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"服务器请求失败:%@", error.userInfo);
        [self sendCreatRequestToServer];
    }];
}
-(void)sendSpecialsRequestToServer{
    NSDictionary *params=@{@"system":@"2",
                           @"channel":@"appstore",
                           @"channelId":@"appstore",
                           @"apptype":@"1",
                           @"retype":@"3",
                           @"appVersionName":@"3.4.7",
                           @"appversion":@"3.4.7",
                           @"osVersionCode":@"9.2.1",
                           @"timestamp":@"1467199092.895776",
                           @"appType":@"1",
                           @"mobileModel":@"iPhone7,2"};
    [NetworkManager sendRequestWithUrl:@"http://mhjk.1391.com/comic/recommendspecial_sb" parameters:params success:^(id responseObject) {
        self.specialsListArray = [DataManager getBookcitySpecialsData:responseObject];
        [self.specialsListCollectionView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"服务器请求失败:%@", error.userInfo);
        [self sendSpecialsRequestToServer];
    }];
}
-(void)sendADandRecomendRequestToServer:(NSString *)str{
    NSDictionary *params=@{@"apptype":@"1",
                           @"mobileModel":@"iPhone7,2",
                           @"channelid":@"appstore",
                           @"channelId":@"appstore",
                           @"channel":@"appstore",
                           @"osVersionCode":@"9.2.1",
                           @"timestamp":@"1467682690.010667",
                           @"appversion":@"3.4.8",
                           @"appType":@"1",
                           @"adgroupid":str,//71,69,72,70
                           @"maxtargetmethod":@"99",
                           @"appVersionName":@"3.4.8",
                           @"platformtype":@"2"};
    [NetworkManager sendRequestWithUrl:@"http://mhjk.1391.com/comic/getproad" parameters:params success:^(id responseObject) {
        if ([str isEqualToString:@"71"]) {
            self.recomendArray = [DataManager getBookcityRecomendData:responseObject];
            [self.recomendCollectionView reloadData];
        }
        if ([str isEqualToString:@"69"]) {
            self.ADRecomendArray = [NSMutableArray arrayWithArray:[DataManager getBookcityRecomendData:responseObject]];
            [self handleImages:self.ADRecomendCollectionView];
            self.ADRecomendCollectionView.contentOffset = CGPointMake(ADRCollectionWidth, 0);
            self.recomendPageControl.numberOfPages = self.ADRecomendArray.count-2;
            [self.ADRecomendCollectionView reloadData];
        }
        if ([str isEqualToString:@"72"]) {
            self.ADRankingListArray = [NSMutableArray arrayWithArray:[DataManager getBookcityRecomendData:responseObject]];
            [self handleImages:self.ADRankingListCollectionView];
            self.ADRankingListCollectionView.contentOffset = CGPointMake(ADRLCollectionWidth, 0);
            self.rankingListPageControl.numberOfPages = self.ADRankingListArray.count-2;
            [self.ADRankingListCollectionView reloadData];
        }
        if ([str isEqualToString:@"70"]) {
            self.ADCreatArray = [NSMutableArray arrayWithArray:[DataManager getBookcityRecomendData:responseObject]];
            [self handleImages:self.ADCreatCollectionView];
            self.ADCreatCollectionView.contentOffset = CGPointMake(ADCCollectionWidth, 0);
            self.creatPageControl.numberOfPages = self.ADCreatArray.count-2;
            [self.ADCreatCollectionView reloadData];
        }
    } failure:^(NSError *error) {
        NSLog(@"服务器请求失败:%@", error.userInfo);
        [self sendADandRecomendRequestToServer:str];
    }];
}

#pragma mark - 其他处理
-(void)timerRecomendAction:(NSTimer *)timer{
    [self.ADRecomendCollectionView setContentOffset:CGPointMake(ADRCollectionWidth*(self.recomendPageControl.currentPage+2), 0) animated:YES];
}
-(void)timerRankingListAction:(NSTimer *)timer{
    [self.ADRankingListCollectionView setContentOffset:CGPointMake(ADRLCollectionWidth*(self.rankingListPageControl.currentPage+2), 0) animated:YES];
}
-(void)timerCreatAction:(NSTimer *)timer{
    [self.ADCreatCollectionView setContentOffset:CGPointMake(ADCCollectionWidth*(self.creatPageControl.currentPage+2), 0) animated:YES];
}
-(void)handleImages:(UICollectionView *)collectionView{
    //推荐广告
    if (collectionView == self.ADRecomendCollectionView) {
        BookcityRecomendModel *ADRecomendModelFirst = [self.ADRecomendArray firstObject];
        BookcityRecomendModel *ADRecomendModelLast = [self.ADRecomendArray lastObject];
        [self.ADRecomendArray insertObject:ADRecomendModelLast atIndex:0];
        [self.ADRecomendArray addObject:ADRecomendModelFirst];
    }
    //榜单广告
    if (collectionView == self.ADRankingListCollectionView) {
        BookcityRecomendModel *ADRankingListModelFirst = [self.ADRankingListArray firstObject];
        BookcityRecomendModel *ADRankingListModelLast = [self.ADRankingListArray lastObject];
        [self.ADRankingListArray insertObject:ADRankingListModelLast atIndex:0];
        [self.ADRankingListArray addObject:ADRankingListModelFirst];
    }
    //原创广告
    if (collectionView == self.ADCreatCollectionView) {
        BookcityRecomendModel *ADCreatModelFirst = [self.ADCreatArray firstObject];
        BookcityRecomendModel *ADCreatModelLast = [self.ADCreatArray lastObject];
        [self.ADCreatArray insertObject:ADCreatModelLast atIndex:0];
        [self.ADCreatArray addObject:ADCreatModelFirst];
    }
}

#pragma mark - TableView DataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.rankingListTableView) {
        return self.rankingListArray.count;
    }
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //榜单
    if (tableView == self.rankingListTableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RLC"];
        NSObject *model=self.rankingListArray[indexPath.row];
        if ([model isKindOfClass:[BookcityRankingListModel class]]) {
            BookcityRankingListModel *rankingListModel=self.rankingListArray[indexPath.row];
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RLC"];
            
            tableView.separatorColor = [UIColor    colorWithRed:246/255.0 green:243/255.0 blue:248/255.0 alpha:1];
            
            UILabel *RLabel=[[UILabel alloc]init];
            RLabel.frame=CGRectMake(155, 10, 200, 35);
            RLabel.font=[UIFont systemFontOfSize:18];
            RLabel.text=rankingListModel.name;
            
            UIImageView *RImageView=[[UIImageView alloc]init];
            [RImageView sd_setImageWithURL:[NSURL URLWithString:rankingListModel.coverurl] placeholderImage:[UIImage imageNamed:@"place_hold_img_v"]];
            RImageView.frame=CGRectMake(10, 10, 130, 80);
            RImageView.layer.cornerRadius = RImageView.bounds.size.width/20;
            RImageView.layer.masksToBounds = YES;
            
            UILabel *RDLabel=[[UILabel alloc]init];
            RDLabel.frame=CGRectMake(155, 45, 200, 45);
            RDLabel.font=[UIFont systemFontOfSize:14];
            RDLabel.textColor = [UIColor grayColor];
            RDLabel.text=rankingListModel.desc;
            RDLabel.numberOfLines=0;
            
            UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
            [view addSubview:RLabel];
            [view addSubview:RDLabel];
            [view addSubview:RImageView];
            [cell.contentView addSubview:view];
        }
        return cell;
    }
    //推荐
    if (tableView == self.rankingListTableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RTVCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RTVCell"];
        }
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CTVCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CTVCell"];
    }
    return cell;
}

#pragma mark - TableView 分割线设置
-(void)viewDidLayoutSubviews{
    if ([self.rankingListTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.rankingListTableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    if ([self.rankingListTableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.rankingListTableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - CollectionView DataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (collectionView == self.mainCollectionView) {
        return 4;
    }
    if (collectionView == self.specialsListCollectionView) {
        return self.specialsListArray.count;
    }
    if (collectionView == self.creatCollectionView) {
        return self.creatListArray.count;
    }
    if (collectionView == self.recomendCollectionView) {
        return self.recomendArray.count;
    }
    if (collectionView == self.ADRecomendCollectionView) {
        return self.ADRecomendArray.count;
    }
    if (collectionView == self.ADRankingListCollectionView) {
        return self.ADRankingListArray.count;
    }
    if (collectionView == self.ADCreatCollectionView) {
        return self.ADCreatArray.count;
    }
    return 0;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView == self.mainCollectionView) {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MC" forIndexPath:indexPath];
        if (indexPath.item == 0) {
            [cell.contentView addSubview:self.recomendTableView];
        }
        if (indexPath.item == 1) {
            [cell.contentView addSubview:self.rankingListTableView];
        }
        if (indexPath.item == 2) {
            [cell.contentView addSubview:self.creatTableView];
        }
        if (indexPath.item == 3) {
            [cell.contentView addSubview:self.specialsListCollectionView];
        }
        return cell;
    }
    if (collectionView == self.specialsListCollectionView) {
        BookcitySpecialsModel *specialslistModel = [self.specialsListArray objectAtIndex:indexPath.item];
        BookcitySpecialsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SLC" forIndexPath:indexPath];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:specialslistModel.coverurl]placeholderImage:[UIImage imageNamed:@"place_hold_img_v"]];
        cell.label.text = specialslistModel.name;
        cell.detailLabel.text = [NSString stringWithFormat:@"%ld",specialslistModel.collectcount];
        return cell;
    }
    if (collectionView == self.creatCollectionView) {
        BookcityCreatModel *creatlistModel = [self.creatListArray objectAtIndex:indexPath.item];
        BookcityCreatCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CC" forIndexPath:indexPath];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:creatlistModel.coverurl]placeholderImage:[UIImage imageNamed:@"place_hold_img_v"]];
        cell.label.text = creatlistModel.bigbook_name;
        return cell;
    }
    if (collectionView == self.recomendCollectionView) {
        BookcityRecomendModel *recomendModel = [self.recomendArray objectAtIndex:indexPath.item];
        BookcityRecomendCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RC" forIndexPath:indexPath];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:recomendModel.imageurl]placeholderImage:[UIImage imageNamed:@"place_hold_img_v"]];
        cell.label.text = recomendModel.title;
        return cell;
    }
    if (collectionView == self.ADRecomendCollectionView) {
        ADBookcityRecomendCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ADRC" forIndexPath:indexPath];
        BookcityRecomendModel *ADRecomendModel = [self.ADRecomendArray objectAtIndex:indexPath.item];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:ADRecomendModel.imageurl] placeholderImage:[UIImage imageNamed:@"place_hold_img_v"]];
        cell.underTextLabel.text = ADRecomendModel.title;
        return cell;
    }
    if (collectionView == self.ADRankingListCollectionView) {
        ADBookcityRankingListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ADRLC" forIndexPath:indexPath];
        BookcityRecomendModel *ADRankingListModel = [self.ADRankingListArray objectAtIndex:indexPath.item];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:ADRankingListModel.imageurl] placeholderImage:[UIImage imageNamed:@"place_hold_img_v"]];
        cell.underTextLabel.text = ADRankingListModel.title;
        return cell;
    }
    if (collectionView == self.ADCreatCollectionView) {
        ADBookcityCreatCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ADCC" forIndexPath:indexPath];
        BookcityRecomendModel *ADCreatModel = [self.ADCreatArray objectAtIndex:indexPath.item];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:ADCreatModel.imageurl] placeholderImage:[UIImage imageNamed:@"place_hold_img_v"]];
        cell.underTextLabel.text = ADCreatModel.title;
        return cell;
    }
    return nil;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView == self.recomendCollectionView) {
        if (indexPath.item >= 4) {
            return CGSizeMake((XPScreenWidth-Space*3)/2, (XPScreenWidth-Space*3)/2+LabelHeight*3);
        }
        return CGSizeMake((XPScreenWidth-Space*3)/2, (XPScreenWidth-Space*3)/2-LabelHeight-Space);
    }
    if (collectionView == self.creatCollectionView) {
        return CGSizeMake((XPScreenWidth-Space*3)/2, (XPScreenWidth-Space*3)/2-LabelHeight-Space);
    }
    if (collectionView == self.specialsListCollectionView) {
        return CGSizeMake((XPScreenWidth-Space*3)/2, (XPScreenWidth-Space*3)/2+LabelHeight);
    }
    if (collectionView == self.ADRecomendCollectionView||collectionView == self.ADRankingListCollectionView||collectionView == self.ADCreatCollectionView) {
        return CGSizeMake(ViewWidth, ViewHeight/7*2);
    }
    return CGSizeMake(XPScreenWidth, XPScreenHeight);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.mainCollectionView) {
        NSLog(@"%lf",self.mainCollectionView.contentOffset.x);
        self.LImageView.frame = CGRectMake(self.mainCollectionView.contentOffset.x/4, self.size.height-10, (XPScreenWidth-3)/4, 10);
    }
    if (scrollView == self.ADRecomendCollectionView) {
        int halfX = self.ADRecomendCollectionView.frame.size.width/2;
        self.recomendPageControl.currentPage = (self.ADRecomendCollectionView.contentOffset.x-ADRCollectionWidth-halfX)/(ADRCollectionWidth)+1;
        if (self.ADRecomendCollectionView.contentOffset.x >=ADRCollectionWidth*(self.ADRecomendArray.count-1)) {
            self.ADRecomendCollectionView.contentOffset = CGPointMake(ADRCollectionWidth, 0);
            // self.recomendPageControl.currentPage =0;
        }
        if (self.ADRecomendCollectionView.contentOffset.x <= 0) {
            self.ADRecomendCollectionView.contentOffset = CGPointMake(ADRCollectionWidth*(self.ADRecomendArray.count-2),0);
        }
    }
    if (scrollView == self.ADRankingListCollectionView) {
        int halfX = self.ADRankingListCollectionView.frame.size.width/2;
        self.rankingListPageControl.currentPage = (self.ADRankingListCollectionView.contentOffset.x-ADRLCollectionWidth-halfX)/(ADRLCollectionWidth)+1;
        if (self.ADRankingListCollectionView.contentOffset.x >=ADRLCollectionWidth*(self.ADRankingListArray.count-1)) {
            self.ADRankingListCollectionView.contentOffset = CGPointMake(ADRLCollectionWidth, 0);
        }
        if (self.ADRankingListCollectionView.contentOffset.x <= 0) {
            self.ADRankingListCollectionView.contentOffset = CGPointMake(ADRLCollectionWidth*(self.ADRankingListArray.count-2),0);
        }
    }
    if (scrollView == self.ADCreatCollectionView) {
        int halfX = self.ADCreatCollectionView.frame.size.width/2;
        self.creatPageControl.currentPage = (self.ADCreatCollectionView.contentOffset.x-ADCCollectionWidth-halfX)/(ADCCollectionWidth)+1;
        if (self.ADCreatCollectionView.contentOffset.x >=ADCCollectionWidth*(self.ADCreatArray.count-1)) {
            self.ADCreatCollectionView.contentOffset = CGPointMake(ADCCollectionWidth, 0);
        }
        if (self.ADCreatCollectionView.contentOffset.x <= 0) {
            self.ADCreatCollectionView.contentOffset = CGPointMake(ADCCollectionWidth*(self.ADCreatArray.count-2),0);
        }
    }
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
