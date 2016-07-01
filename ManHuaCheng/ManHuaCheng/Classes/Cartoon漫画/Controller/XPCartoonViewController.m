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
#import <MBProgressHUD.h>
//#import <AwAlertViewlib/AwAlertViewlib.h>

@interface XPCartoonViewController ()
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


//@property (strong, nonatomic) IBOutlet NSLayoutConstraint *DetailHeigth;//漫画头部简介详情的高度

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
    
    [self showFourButton];
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
}


- (void)onLeftBtn:(UIBarButtonItem *)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
//右按钮
- (void)onRightBtn:(UIButton *)sender{
    
    if (sender.selected) {
        
        [sender setBackgroundImage:[UIImage imageNamed:@"comicDetail_collectBt_nor"] forState:UIControlStateNormal];
       // [self showAlerController:@"很可惜，漫画已从书架删除！"];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = NSLocalizedString(@"很可惜，漫画已从书架删除！", @"HUD message title");
        [hud hide:YES afterDelay:2];
        [sender setSelected:NO];

    } else {
        [sender setBackgroundImage:[UIImage imageNamed:@"comicDetail_collectBt_hl"] forState:UIControlStateNormal];
       // [self showAlerController:@"添加漫画成功，请进入“书架”查看！"];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = NSLocalizedString(@"添加漫画成功，请进入“书架”查看！", @"HUD message title");
        [hud hide:YES afterDelay:2];
        [sender setSelected:NO];

        [sender setSelected:YES];

        
    }
}

//显示提示框
//- (void)showAlerController:(NSString *) str {
//    AwTipView *tipView=[[AwTipView alloc]initWithView:self.view title:str message:nil posY:XPScreenHeight - 280];
//    tipView.showTime=2;
//    [tipView showAnimated:YES];
//}

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
        [btn setTitle:array[i] forState:UIControlStateNormal];
        
        if (i < 3) {
            UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(width + (width + 2) * i, 0, 2, 40)];
            img.image = [UIImage imageNamed:@"navigationLine"];
            [self.middleHV addSubview:img];
        }
    }
    self.middleHV.layer.borderWidth = .5;
    self.middleHV.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    //scrollView初始化
    self.middleScrollView.contentSize = CGSizeMake(XPScreenWidth * 4, 0);
    CGFloat scrootHeigth = self.middleScrollView.frame.size.height;
    self.cartoonSectionsTV.frame = CGRectMake(0, 0, XPScreenWidth, scrootHeigth);
    [self.middleScrollView addSubview:self.cartoonSectionsTV];
    self.cartoonDiscussTV.frame = CGRectMake(XPScreenWidth, 0, XPScreenWidth, scrootHeigth);
    [self.middleScrollView addSubview:self.cartoonDiscussTV];
    self.cartoonRecommendCV.frame = CGRectMake(XPScreenWidth * 2, 0, XPScreenWidth, scrootHeigth);
    [self.middleScrollView addSubview:self.cartoonRecommendCV];
    
}



@end
