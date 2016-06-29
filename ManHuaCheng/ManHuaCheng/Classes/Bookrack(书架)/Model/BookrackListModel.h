//
//  BookrackListModel.h
//  ManHuaCheng
//
//  Created by tarena on 16/6/29.
//  Copyright © 2016年 win. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookrackListModel : NSObject

@property (nonatomic, assign) NSInteger bigbook_id;

@property (nonatomic, copy) NSString *coverurl;

@property (nonatomic, copy) NSString *superscript;

@property (nonatomic, copy) NSString *bigbook_name;

+ (instancetype)parseListJSON:(NSDictionary *)dict;

@end

