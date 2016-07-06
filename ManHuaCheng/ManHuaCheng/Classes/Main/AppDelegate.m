//
//  AppDelegate.m
//  ManHuaCheng
//
//  Created by dragon on 16/6/28.
//  Copyright © 2016年 win. All rights reserved.
//

#import "AppDelegate.h"
#import "XPWelcomeViewController.h"
#import "XPTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //初始化Bmob
    [Bmob registerWithAppKey:@"df7dc327fd6e3c136d96a357d2281aa6"];
    
    //创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // 显示窗口
    [self.window makeKeyAndVisible];
    
    //判断是否登录
    if ([BmobUser getCurrentUser]) {
        //登录过显示主页
        self.window.rootViewController = [[XPTabBarController alloc] init];
    }else
    {
        self.window.rootViewController = [[XPWelcomeViewController alloc] init];
    }

    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (![defaults boolForKey:@"first"]) {
        // 设置窗口的根控制器
        self.window.rootViewController = [[XPWelcomeViewController alloc] init];
        self.isFirst = YES;
        [defaults setBool:self.isFirst forKey:@"first"];
        //同步 可以使内存中数据改变完之后 立即保存到文件中   不加也能保存 但是有可能不够及时
        [defaults synchronize];
    }else
    {
        // 设置窗口的根控制器
        self.window.rootViewController = [[XPTabBarController alloc] init];
    }
   

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
