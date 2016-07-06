//
//  DataManager.h
//  ManHuaCheng
//
//  Created by tarena on 16/6/29.
//  Copyright © 2016年 win. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

+ (NSArray *)getBookrackListData:(id)responseObject;
+ (NSArray *)getBookcitySpecialsData:(id)responseObject;
+ (NSArray *)getBookcityCreatData:(id)responseObject;
+ (NSArray *)getBookcityRankingListData:(id)responseObject;
+ (NSArray *)getBookcityRecomendData:(id)responseObject;

@end
