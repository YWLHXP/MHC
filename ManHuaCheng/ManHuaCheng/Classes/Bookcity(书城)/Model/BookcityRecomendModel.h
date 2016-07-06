//
//  BookcityRecomendModel.h
//  ManHuaCheng
//
//  Created by tarena on 16/7/5.
//  Copyright © 2016年 win. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookcityRecomendModel : NSObject

@property (nonatomic, copy) NSString *cornermark;
//description -> desc
@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *endtime;

@property (nonatomic, copy) NSString *starttime;

@property (nonatomic, copy) NSString *targetargument;

@property (nonatomic, assign) NSInteger targetmethod;

@property (nonatomic, assign) NSInteger height;
//id -> Id
@property (nonatomic, assign) NSInteger Id;

@property (nonatomic, copy) NSString *imageurl;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger width;

+ (instancetype)parseListJSON:(NSDictionary *)dict;

@end

