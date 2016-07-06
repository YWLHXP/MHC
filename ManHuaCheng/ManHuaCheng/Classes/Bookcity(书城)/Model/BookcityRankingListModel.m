//
//  BookcityRankingListModel.m
//  ManHuaCheng
//
//  Created by tarena on 16/7/5.
//  Copyright © 2016年 win. All rights reserved.
//

#import "BookcityRankingListModel.h"

@implementation BookcityRankingListModel

+(instancetype)parseListJSON:(NSDictionary *)dict{
    return [[self alloc] parseDailylJson:dict];
}

- (BookcityRankingListModel *)parseDailylJson:(NSDictionary *)dic {
    self.sdid = dic[@"sdid"];
    self.position = [dic[@"position"] integerValue];
    self.collectcount = [dic[@"collectcount"] integerValue];
    self.coverurl = dic[@"coverurl"];
    self.screenname = dic[@"screenname"];
    self.specialid = [dic[@"specialid"] integerValue];
    self.profileimageurl = dic[@"profileimageurl"];
    self.name = dic[@"name"];
    self.desc = dic[@"description"];
    return self;
}

@end


