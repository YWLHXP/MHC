//
//  XPTableViewCell.m
//  ManHuaCheng
//
//  Created by dragon on 16/6/29.
//  Copyright © 2016年 win. All rights reserved.
//

#import "XPTableViewCell.h"

@implementation XPTableViewCell

-(void)setNovel:(XPNovel *)novel
{
    _novel = novel;
    self.title.text = novel.title;
    self.shortIntro.text = novel.shortIntro;
    self.latelyFollower.text = [NSString stringWithFormat:@"%d",novel.latelyFollower];
    [self.cover sd_setImageWithURL:[NSURL URLWithString:novel.cover]];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
