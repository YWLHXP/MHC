//
//  BookcityCreatModel.h
//  ManHuaCheng
//
//  Created by tarena on 16/7/4.
//  Copyright © 2016年 win. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookcityCreatModel : NSObject

@property (nonatomic, copy) NSString *bigbook_author;

@property (nonatomic, assign) NSInteger progresstype;

@property (nonatomic, assign) NSInteger cover_width;

@property (nonatomic, copy) NSString *coverurl;

@property (nonatomic, assign) NSInteger cover_height;

@property (nonatomic, copy) NSString *subject_name;

@property (nonatomic, assign) NSInteger bigbook_id;

@property (nonatomic, copy) NSString *key_name;

@property (nonatomic, assign) NSInteger bigbookview;

@property (nonatomic, copy) NSString *bigbook_name;

@property (nonatomic, copy) NSString *lastpartname;

+ (instancetype)parseListJSON:(NSDictionary *)dict;

@end
