//
//  BookcityRecomendModel.m
//  ManHuaCheng
//
//  Created by tarena on 16/7/5.
//  Copyright © 2016年 win. All rights reserved.
//

#import "BookcityRecomendModel.h"

@implementation BookcityRecomendModel

+(instancetype)parseListJSON:(NSDictionary *)dict{
    return [[self alloc] parseDailylJson:dict];
}

- (BookcityRecomendModel *)parseDailylJson:(NSDictionary *)dic {
    self.cornermark = dic[@"cornermark"];
    self.endtime = dic[@"endtime"];
    self.starttime = dic[@"starttime"];
    self.targetargument = dic[@"targetargume"];
    self.imageurl = dic[@"imageurl"];
    self.name = dic[@"name"];
    self.title = dic[@"title"];
    self.targetmethod = [dic[@"targetmeth"] integerValue];
    self.height = [dic[@"height"] integerValue];
    self.Id = [dic[@"id"] integerValue];
    self.width = [dic[@"width"] integerValue];
    self.desc = dic[@"description"];
    return self;
}

@end


