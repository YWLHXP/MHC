//
//  XPBookcityViewController.m
//  ManHuaCheng
//
//  Created by dragon on 16/6/28.
//  Copyright © 2016年 win. All rights reserved.
//

#import "XPBookcityViewController.h"
#import "UIImage+UIImageCategory.h"
#import "BookCityCollectionViewCell.h"

@interface XPBookcityViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UIImageView *LImageView;
@property (nonatomic, strong) UICollectionView *collectionView;

//记录按钮高度
@property (nonatomic, assign) CGSize size;


@end

@implementation XPBookcityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.automaticallyAdjustsScrollViewInsets = NO;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XPScreenWidth, self.navigationController.navigationBar.frame.size.height)];
    view.backgroundColor = [UIColor clearColor];
    
    
    
    //****************推荐按钮****************
    UIButton *recomendButton = [UIButton buttonWithType:UIButtonTypeSystem];
    recomendButton.frame = CGRectMake(0, 0, (XPScreenWidth-3)/4, view.frame.size.height);
    [recomendButton setTitle:@"推荐" forState:UIControlStateNormal];
    [recomendButton setTitleColor:[UIColor colorWithRed:223/255.0 green:32/255.0 blue:14/255.0 alpha:1] forState:UIControlStateHighlighted];
    [recomendButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [recomendButton setImage:[UIImage imageNamed:@"city_nav_recomend_nor"]  forState:UIControlStateNormal];
    [recomendButton setImage:[UIImage imageNamed:@"city_nav_recomend_sel"]  forState:UIControlStateHighlighted];
    recomendButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    //文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [recomendButton setTitleEdgeInsets:UIEdgeInsetsMake(recomendButton.imageView.frame.size.height ,-recomendButton.imageView.frame.size.width, 0,0)];
    //图片距离右边框距离减少图片的宽度，其它不边
    [recomendButton setImageEdgeInsets:UIEdgeInsetsMake(-20, 0,0, -recomendButton.titleLabel.bounds.size.width)];
    
    [recomendButton addTarget:self action:@selector(recomendButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:recomendButton];
    
    //按钮下端图片
    self.LImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, recomendButton.bounds.size.height-10, (XPScreenWidth-3)/4, 10)];
    self.LImageView.image = [UIImage imageNamed:@"navigationSelLine"];
    self.size = recomendButton.bounds.size;
    [view addSubview:self.LImageView];
    
    //按钮右端图片
    UIImageView *PHImageView = [[UIImageView alloc]initWithFrame:CGRectMake(recomendButton.frame.size.width, 0, 1, recomendButton.frame.size.height)];
    PHImageView.image = [UIImage imageNamed:@"navigationLine"];
    [view addSubview:PHImageView];
    
    
    
    //****************榜单按钮****************
    UIButton *rankingListButton = [UIButton buttonWithType:UIButtonTypeSystem];
    rankingListButton.frame = CGRectMake(PHImageView.frame.origin.x+1, 0, (XPScreenWidth-3)/4, view.frame.size.height);
    [rankingListButton setTitle:@"榜单" forState:UIControlStateNormal];
    [rankingListButton setTitleColor:[UIColor colorWithRed:223/255.0 green:32/255.0 blue:14/255.0 alpha:1] forState:UIControlStateHighlighted];
    [rankingListButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rankingListButton setImage:[UIImage imageNamed:@"city_nav_rankingList_nor"]  forState:UIControlStateNormal];
    [rankingListButton setImage:[UIImage imageNamed:@"city_nav_rankingList_sel"]  forState:UIControlStateHighlighted];
    rankingListButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    //文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [rankingListButton setTitleEdgeInsets:UIEdgeInsetsMake(rankingListButton.imageView.frame.size.height ,-rankingListButton.imageView.frame.size.width, 0,0)];
    //图片距离右边框距离减少图片的宽度，其它不边
    [rankingListButton setImageEdgeInsets:UIEdgeInsetsMake(-20, 0,0, -rankingListButton.titleLabel.bounds.size.width)];
    
    [rankingListButton addTarget:self action:@selector(rankingListButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:rankingListButton];
    
    //按钮右端图片
    UIImageView *PHImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(rankingListButton.frame.origin.x+rankingListButton.frame.size.width, 0, 1, rankingListButton.frame.size.height)];
    PHImageView1.image = [UIImage imageNamed:@"navigationLine"];
    [view addSubview:PHImageView1];
    
    
    
    //****************原创按钮****************
    UIButton *creatButton = [UIButton buttonWithType:UIButtonTypeSystem];
    creatButton.frame = CGRectMake(PHImageView1.frame.origin.x+1, 0, (XPScreenWidth-3)/4, view.frame.size.height);
    [creatButton setTitle:@"原创" forState:UIControlStateNormal];
    [creatButton setTitleColor:[UIColor colorWithRed:223/255.0 green:32/255.0 blue:14/255.0 alpha:1] forState:UIControlStateHighlighted];
    [creatButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [creatButton setImage:[UIImage imageNamed:@"city_nav_creat_nor"]  forState:UIControlStateNormal];
    [creatButton setImage:[UIImage imageNamed:@"city_nav_creat_sel"]  forState:UIControlStateHighlighted];
    creatButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    //文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [creatButton setTitleEdgeInsets:UIEdgeInsetsMake(creatButton.imageView.frame.size.height ,-rankingListButton.imageView.frame.size.width, 0,0)];
    //图片距离右边框距离减少图片的宽度，其它不边
    [creatButton setImageEdgeInsets:UIEdgeInsetsMake(-20, 0,0, -creatButton.titleLabel.bounds.size.width)];
    
    [creatButton addTarget:self action:@selector(creatButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:creatButton];
    
    //按钮右端图片
    UIImageView *PHImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(creatButton.frame.origin.x+creatButton.frame.size.width, 0, 1, creatButton.frame.size.height)];
    PHImageView2.image = [UIImage imageNamed:@"navigationLine"];
    [view addSubview:PHImageView2];
    
    
    
    //****************书单按钮****************
    UIButton *specialButton = [UIButton buttonWithType:UIButtonTypeSystem];
    specialButton.frame = CGRectMake(PHImageView2.frame.origin.x+1, 0, (XPScreenWidth-3)/4, view.frame.size.height);
    [specialButton setTitle:@"书单" forState:UIControlStateNormal];
    [specialButton setTitleColor:[UIColor colorWithRed:223/255.0 green:32/255.0 blue:14/255.0 alpha:1] forState:UIControlStateHighlighted];
    [specialButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [specialButton setImage:[UIImage imageNamed:@"city_nav_special_nor"]  forState:UIControlStateNormal];
    [specialButton setImage:[UIImage imageNamed:@"city_nav_special_sel"]  forState:UIControlStateHighlighted];
    specialButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    //文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [specialButton setTitleEdgeInsets:UIEdgeInsetsMake(specialButton.imageView.frame.size.height ,-specialButton.imageView.frame.size.width, 0,0)];
    //图片距离右边框距离减少图片的宽度，其它不边
    [specialButton setImageEdgeInsets:UIEdgeInsetsMake(-20, 0,0, -specialButton.titleLabel.bounds.size.width)];
    
    [specialButton addTarget:self action:@selector(specialButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:specialButton];
    
    [self.navigationController.navigationBar addSubview:view];
    
    
    
    
    
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(XPScreenWidth, XPScreenHeight);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, XPScreenWidth, XPScreenHeight) collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;
    self.collectionView.backgroundColor = [UIColor colorWithRed:245/255.0 green:242/255.0 blue:246/255.0 alpha:1];
    
    
    
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerClass:[/*BookCityCollectionViewCell*/UICollectionViewCell class] forCellWithReuseIdentifier:@"BCCV"];
    
    // Do any additional setup after loading the view.
}

#pragma mark -按钮事件
- (void)recomendButtonAction:(UIButton *)btn
{
    [self.collectionView setContentOffset:CGPointMake(0, 0) animated:YES];
}
- (void)rankingListButtonAction:(UIButton *)btn
{
    [self.collectionView setContentOffset:CGPointMake(XPScreenWidth, 0) animated:YES];
}
- (void)creatButtonAction:(UIButton *)btn
{
    [self.collectionView setContentOffset:CGPointMake(XPScreenWidth*2, 0) animated:YES];
}
- (void)specialButtonAction:(UIButton *)btn
{
    [self.collectionView setContentOffset:CGPointMake(XPScreenWidth*3, 0) animated:YES];
}

#pragma mark - CollectionView DataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //BookCityCollectionViewCell
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BCCV" forIndexPath:indexPath];
    if (indexPath.item == 0) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XPScreenWidth, XPScreenHeight)];
        view.backgroundColor = [UIColor redColor];
        [cell.contentView addSubview:view];
        //        [cell createCollectionView];
        
    }
    if (indexPath.item == 1) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XPScreenWidth, XPScreenHeight)];
        view.backgroundColor = [UIColor greenColor];
        [cell.contentView addSubview:view];
        //        [cell createHotCollectionView];
    }
    if (indexPath.item == 2) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XPScreenWidth, XPScreenHeight)];
        view.backgroundColor = [UIColor yellowColor];
        [cell.contentView addSubview:view];
    }
    if (indexPath.item == 3) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XPScreenWidth, XPScreenHeight)];
        view.backgroundColor = [UIColor blueColor];
        [cell.contentView addSubview:view];
    }
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.collectionView) {
        NSLog(@"%lf",self.collectionView.contentOffset.x);
        self.LImageView.frame = CGRectMake(self.collectionView.contentOffset.x/4, self.size.height-10, (XPScreenWidth-3)/4, 10);
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
