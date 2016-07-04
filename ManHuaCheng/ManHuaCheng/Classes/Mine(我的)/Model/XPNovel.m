//
//  XPNovel.m
//  ManHuaCheng
//
//  Created by dragon on 16/6/29.
//  Copyright © 2016年 win. All rights reserved.
//

#import "XPNovel.h"

@implementation XPNovel
- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.cover = dic[@"cover"];
        self.title = dic[@"title"];
        self.shortIntro = dic[@"shortIntro"];
        self.latelyFollower = [dic[@"latelyFollower"] intValue];
    }
    return self;
}

@end
