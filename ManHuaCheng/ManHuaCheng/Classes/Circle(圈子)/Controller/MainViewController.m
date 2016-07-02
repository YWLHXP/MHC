//
//  MainViewController.m
//  ManHuaCheng
//
//  Created by tarena21 on 16/6/30.
//  Copyright © 2016年 win. All rights reserved.
//

#import "MainViewController.h"
#import "XPLoginViewController.h"
#import "GCViewController.h"
//#import "GZViewController.h"
#import "XPViewController.h"
@interface MainViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *MytabrVC;
@property (weak, nonatomic) IBOutlet UIButton *leftbtn;
@property (weak, nonatomic) IBOutlet UIScrollView *Mysvc;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UIImageView *leftimage;
;
@property (nonatomic)int index;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.titleView = self.MytabrVC;
    self.Mysvc.contentSize = CGSizeMake(2*self.Mysvc.frame.size.width,self.Mysvc.frame.size.width-64);
    self.Mysvc.showsHorizontalScrollIndicator = NO;
    self.Mysvc.showsVerticalScrollIndicator = NO;
    self.Mysvc.pagingEnabled = YES;
    self.Mysvc.bounces = NO;
    
    [self configScrollView];
    [self setBarbuttonItem];

}
-(void)setBarbuttonItem
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"blog_nav_left"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(skip:)];
}
-(void)skip:(UIBarButtonItem*)btn
{
    XPLoginViewController *vc = [XPLoginViewController new];
    
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)configScrollView
{
   

    
    for (int i =0; i<2; i++)
    {

        XPViewController *Xvc = [[XPViewController alloc]init];
        GCViewController *Cvc = [[GCViewController alloc]init];
       [self addChildViewController:Xvc];
       [self addChildViewController:Cvc];
        
    }
    // 默认显示第0个子控制器
   [self scrollViewDidEndScrollingAnimation:self.Mysvc];
   
}
//显示关注，广场这两个页面
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    for (int i=2; i>=0; i--)
    {
       [self.Mysvc setContentOffset:CGPointMake(i*375, 0)];
        NSInteger index = scrollView.contentOffset.x/self.view.frame.size.width;
        NSLog(@"%ld",(long)index);
        // 取出需要显示的控制器
    UIViewController *willShowVc = self.childViewControllers[index];
 
    willShowVc.view.frame = CGRectMake(scrollView.contentOffset.x, 0, scrollView.frame.size.width, scrollView.frame.size.height);
    [scrollView addSubview:willShowVc.view];
    }

}
//页面滑动
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    float offset = scrollView.contentOffset.x ;
    int i = offset/self.view.frame.size.width;

    NSLog(@"当前第几页%d",i);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect f = self.leftimage.frame;
        f.origin.x = i*90;
        self.leftimage.frame = f;
    }];
    
    UIButton *btn = [self.view viewWithTag:10+i];
    for (UIButton *b in btn.superview.subviews) {
        if ([b isKindOfClass:[UIButton class]]) {
            b.selected = (b==btn)?YES:NO;
        }
    }

    
}

- (IBAction)button:(UIButton *)sender
{
    sender.backgroundColor = [UIColor clearColor];
    for (UIButton *button in sender.superview.subviews)
    {
        if ([button isKindOfClass:[UIButton class]]) {
            button.selected = (button != sender) ? NO : YES;
        }
    }
    [UIView animateWithDuration:0.3 animations:^{
        CGRect f = self.leftimage.frame;
        f.origin.x = (sender.tag-10)*90;
        self.leftimage.frame = f;
        self.Mysvc.contentOffset = CGPointMake((sender.tag-10)*self.view.frame.size.width, 0);
    }];

}

@end
