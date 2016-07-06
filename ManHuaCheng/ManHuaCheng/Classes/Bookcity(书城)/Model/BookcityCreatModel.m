//
//  BookcityCreatModel.m
//  ManHuaCheng
//
//  Created by tarena on 16/7/4.
//  Copyright © 2016年 win. All rights reserved.
//

#import "BookcityCreatModel.h"

@implementation BookcityCreatModel

+(instancetype)parseListJSON:(NSDictionary *)dict{
    return [[self alloc] parseDailylJson:dict];
}

- (BookcityCreatModel *)parseDailylJson:(NSDictionary *)dic {
    self.bigbook_author = dic[@"bigbook_author"];
    self.progresstype = [dic[@"progresstype"] integerValue];
    self.cover_width = [dic[@"cover_width"] integerValue];
    self.coverurl = dic[@"coverurl"];
    self.cover_height = [dic[@"cover_height"] integerValue];
    self.subject_name = dic[@"subject_name"];
    self.bigbook_id = [dic[@"bigbook_id"] integerValue];
    self.key_name = dic[@"key_name"];
    self.bigbookview = [dic[@"bigbookview"] integerValue];
    self.bigbook_name = dic[@"bigbook_name"];
    self.lastpartname = dic[@"lastpartname"];
    return self;
}

@end

