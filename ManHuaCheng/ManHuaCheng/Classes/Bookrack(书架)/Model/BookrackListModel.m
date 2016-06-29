//
//  BookrackListModel.m
//  ManHuaCheng
//
//  Created by tarena on 16/6/29.
//  Copyright © 2016年 win. All rights reserved.
//

#import "BookrackListModel.h"

@implementation BookrackListModel

+(instancetype)parseListJSON:(NSDictionary *)dict{
    return [[self alloc] parseDailylJson:dict];
}

- (BookrackListModel *)parseDailylJson:(NSDictionary *)dic {
    self.bigbook_id = [dic[@"bigbook_id"] integerValue];
    self.bigbook_name = dic[@"bigbook_name"];
    self.superscript = dic[@"superscript"];
    self.coverurl = dic[@"coverurl"];
    return self;
}

@end


