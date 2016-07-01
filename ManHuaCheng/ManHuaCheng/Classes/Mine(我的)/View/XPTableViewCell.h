//
//  XPTableViewCell.h
//  ManHuaCheng
//
//  Created by dragon on 16/6/29.
//  Copyright © 2016年 win. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XPNovel.h"
#import <UIImageView+AFNetworking.h>

@interface XPTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cover;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *shortIntro;
@property (weak, nonatomic) IBOutlet UILabel *latelyFollower;
/** novel */
@property (nonatomic, strong) XPNovel *novel;
@end
