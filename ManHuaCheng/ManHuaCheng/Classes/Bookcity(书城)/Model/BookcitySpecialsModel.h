//
//  BookcitySpecialsModel.h
//  ManHuaCheng
//
//  Created by tarena on 16/7/4.
//  Copyright © 2016年 win. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookcitySpecialsModel : NSObject

@property (nonatomic, copy) NSString *sdid;

@property (nonatomic, assign) NSInteger position;

@property (nonatomic, assign) NSInteger collectcount;

@property (nonatomic, copy) NSString *coverurl;

@property (nonatomic, copy) NSString *screenname;

@property (nonatomic, assign) NSInteger specialid;

@property (nonatomic, copy) NSString *profileimageurl;

@property (nonatomic, copy) NSString *name;

//description -> desc
@property (nonatomic, copy) NSString *desc;

+ (instancetype)parseListJSON:(NSDictionary *)dict;

@end

