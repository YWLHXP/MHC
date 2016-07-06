//
//  XPCartoonViewController.m
//  ManHuaCheng
//
//  Created by 罗惠 on 16/6/29.
//  Copyright © 2016年 win. All rights reserved.
//

#import "XPCartoonViewController.h"
#import "CalculateHeight.h"
#import "XPCartoonSectionsTV.h"
#import "XPCartoonDiscussTV.h"
#import "XPCartoonRecommendCV.h"
#import "XPCartoonActionV.h"
#import "XPPassRoadDetailViewController.h"

#import <MBProgressHUD.h>

@interface XPCartoonViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *middleHV;//四个按钮底部view
@property (strong, nonatomic) IBOutlet UIView *HeaderView;
@property (strong, nonatomic) IBOutlet UIView *MiddleView;
@property (strong, nonatomic) IBOutlet UIView *footView;
@property (strong, nonatomic) IBOutlet UIImageView *CartoonImageView;//卡通头像
@property (strong, nonatomic) IBOutlet UIImageView *CartoonHV;//卡通头像标签
@property (strong, nonatomic) IBOutlet UILabel *detailLable;//漫画头部简介详情
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *superHeaderView;//头部视图的长度约束
@property (strong, nonatomic) IBOutlet UIScrollView *middleScrollView;



@property (nonatomic, strong) XPCartoonSectionsTV *cartoonSectionsTV;
@property (nonatomic, strong) XPCartoonRecommendCV *cartoonRecommendCV;
@property (nonatomic, strong) XPCartoonDiscussTV *cartoonDiscussTV;
@property (nonatomic, strong) XPCartoonActionV *cartoonActionV;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *middleSVContraint;
@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic) NSMutableArray<UIButton *> *btnArray;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *footViewConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *headerViewConstraint;

@property (strong, nonatomic) UISwipeGestureRecognizer *swipUp;
@property (strong, nonatomic) UISwipeGestureRecognizer *swipDown;

@end

@implementation XPCartoonViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"测试title";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(onLeftBtn:)];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 5, 77, 30)];
    [btn setBackgroundImage:[UIImage imageNamed:@"comicDetail_collectBt_nor"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onRightBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    //卡通头像设置
    self.CartoonImageView.layer.cornerRadius = 10;
    self.CartoonImageView.layer.masksToBounds = YES;
    self.CartoonImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.CartoonImageView.layer.borderWidth = .5;
    
    
    _btnArray = [NSMutableArray array];
    [self showFourButton];
    
    
    //添加手势动画
    [self addSwipeGesture];
    
    
    //self.middleScrollView.decelerating
    
    
    
}

#pragma mark - 添加手势动画
- (void) addSwipeGesture
{
    
    
    _swipUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipeGesture:)];
    _swipUp.direction = UISwipeGestureRecognizerDirectionUp;
    //swipUp.delegate = self;
    [self.view addGestureRecognizer:_swipUp];
    
    _swipDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipeGesture:)];
    _swipDown.direction= UISwipeGestureRecognizerDirectionDown;
    //swipDown.delegate = self;
    [self.view addGestureRecognizer:_swipDown];
    
    //手势冲突解决方案
    [self.cartoonSectionsTV.panGestureRecognizer requireGestureRecognizerToFail:_swipUp];
    [self.cartoonDiscussTV.panGestureRecognizer requireGestureRecognizerToFail:_swipUp];
    [self.cartoonSectionsTV.panGestureRecognizer requireGestureRecognizerToFail:_swipDown];
    [self.cartoonDiscussTV.panGestureRecognizer requireGestureRecognizerToFail:_swipDown];
    
    
}


#pragma mark - 移动手势
- (void)onSwipeGesture:(UISwipeGestureRecognizer *)swipe
{
    
    
    CGPoint starPoint;
    CGPoint stopPoint;
    CGFloat space = 0.0;
    if (swipe.state == UIGestureRecognizerStateBegan) {
        starPoint = [swipe locationInView:self.view];
    }else if(swipe.state == UIGestureRecognizerStateEnded){
        stopPoint = [swipe locationInView:self.view];
        space = stopPoint.y - starPoint.y;
    }
    

    if (swipe.direction == UISwipeGestureRecognizerDirectionUp) {
        self.footViewConstraint.constant = -50;
        NSLog(@"up");
        
        [UIView animateWithDuration:3. animations:^{
            self.headerViewConstraint.constant = - self.superHeaderView.constant - 64;
            self.navigationController.navigationBar.hidden = YES;
            
        }];
        
        
    }else if(swipe.direction == UISwipeGestureRecognizerDirectionDown){
        self.footViewConstraint.constant = 0;
        NSLog(@"Down");
       
        [UIView animateWithDuration:3. animations:^{
            self.navigationController.navigationBar.hidden = NO;
            self.headerViewConstraint.constant = 0;
            
        }];
    
        
        
    }
    
}




- (void)onLeftBtn:(UIBarButtonItem *)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
//右按钮
- (void)onRightBtn:(UIButton *)sender{
    
    if (sender.selected) {
        
        [sender setBackgroundImage:[UIImage imageNamed:@"comicDetail_collectBt_nor"] forState:UIControlStateNormal];
        
        [self showTooltip:@"很可惜，漫画已从书架删除！"];
        [sender setSelected:NO];

    } else {
        [sender setBackgroundImage:[UIImage imageNamed:@"comicDetail_collectBt_hl"] forState:UIControlStateNormal];

        [self showTooltip:@"添加漫画成功，请进入“书架”查看！"];
        [sender setSelected:YES];

        
    }
}


//文本按钮
- (IBAction)DetailLableShowTextWithButton:(UIButton *)sender {
    
    if (sender.selected) {
        self.detailLable.numberOfLines = 2;
        self.superHeaderView.constant = 210;
        [sender setImage:[UIImage imageNamed:@"vdetail_brief_down"] forState:UIControlStateNormal];
        [sender setSelected:NO];
    }else
    {
        CGFloat h = [CalculateHeight getSpaceLabelHeight:self.detailLable.text withWidth:[UIScreen mainScreen].bounds.size.height withFont:self.detailLable.font];
        self.detailLable.numberOfLines = 0;
        //更新HeaderView的高度
        self.superHeaderView.constant = 164  + h;
        [self.view layoutIfNeeded];
        
        [sender setImage:[UIImage imageNamed:@"vdetail_brief_up"] forState:UIControlStateNormal];
        [sender setSelected:YES];
    }
    
    
   
    

}

//四个按钮和页面
- (void)showFourButton
{
    NSArray *array = @[@"章节",@"评论",@"推荐",@"活动"];
    CGFloat width = (XPScreenWidth - 6) / 4;
    for (int i = 0; i < 4; i ++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.middleHV addSubview:btn];
        btn.frame = CGRectMake((width + 2) * i, 5, width, 30);
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal ];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.tag = i + 100;
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(onSelectedButton:) forControlEvents:UIControlEventTouchUpInside];
        [_btnArray addObject:btn];
        
        if (i < 3) {
            UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(width + (width + 2) * i, 0, 2, 40)];
            img.image = [UIImage imageNamed:@"navigationLine"];
            [self.middleHV addSubview:img];
        }
    }
    self.middleHV.layer.borderWidth = .5;
    self.middleHV.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    //scrollView初始化
    self.middleSVContraint.constant = XPScreenHeight - 55;
    self.middleScrollView.contentSize = CGSizeMake(XPScreenWidth * 4, 0);
    self.middleScrollView.delegate = self;
    
    self.cartoonSectionsTV = [[XPCartoonSectionsTV alloc] initWithFrame:CGRectMake(0, 0, XPScreenWidth, XPScreenHeight)];
    [self.middleScrollView addSubview:self.cartoonSectionsTV];
    
    self.cartoonDiscussTV = [[XPCartoonDiscussTV alloc] initWithFrame:CGRectMake(XPScreenWidth, 0, XPScreenWidth, XPScreenHeight)];
    [self.middleScrollView addSubview:self.cartoonDiscussTV];
    
    self.cartoonRecommendCV = [[XPCartoonRecommendCV alloc] initWithFrame:CGRectMake(XPScreenWidth * 2, 0, XPScreenWidth, XPScreenHeight)];
    [self.middleScrollView addSubview:self.cartoonRecommendCV];
    
    self.cartoonActionV = [[XPCartoonActionV alloc] initWithFrame:CGRectMake(XPScreenWidth * 3, 0, XPScreenWidth, XPScreenHeight)];
    
    [self.middleScrollView addSubview:self.cartoonActionV];
    
    //设置移动图
    
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, _middleHV.frame.size.height - 8, (XPScreenWidth- 6)/4, 8)];
    [_middleHV addSubview:_imgView];
    _imgView.image = [UIImage imageNamed:@"navigationSelLine"];
    
    //添加通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onNotification:) name:@"PASSVIEW" object:nil];
    
}

#pragma mark - scrollView的移动动画

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    if (scrollView == self.middleScrollView) {
        int num = targetContentOffset->x / scrollView.frame.size.width ;
        [UIView animateWithDuration:0.3 animations:^{
            CGRect f = _imgView.frame;
            f.origin.x = num *(scrollView.frame.size.width/4);
            _imgView.frame = f;
        }];
    }
}

#pragma mark - 四个按钮的点击事件
- (void)onSelectedButton:(UIButton *)sender
{
    for (UIButton *btn in _btnArray) {
        if (sender.tag == btn.tag) {
            //动画
            [UIView animateWithDuration:0.3 animations:^{
                CGRect f = _imgView.frame;
                f.origin.x = (btn.tag-100) *(_middleHV.frame.size.width/4);
                _imgView.frame = f;
                _middleScrollView.contentOffset = CGPointMake((btn.tag-100)*XPScreenWidth, 0);
            }];
            
            
        }
    }
    
}

- (void)onNotification:(NSNotification *)notification
{
    if ([notification.userInfo[@"senderBool"] boolValue]== NO) {
        [self presentViewController:[[UINavigationController alloc] initWithRootViewController:[[XPPassRoadDetailViewController alloc] init]] animated:YES completion:nil];
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"PASSVIEW" object:nil];
}

- (void)showTooltip:(NSString *)tip
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = NSLocalizedString(tip, @"HUD message title");
    [hud hide:YES afterDelay:2];
}


@end
