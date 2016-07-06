//
//  DataManager.m
//  ManHuaCheng
//
//  Created by tarena on 16/6/29.
//  Copyright © 2016年 win. All rights reserved.
//

#import "DataManager.h"
#import "BookrackListModel.h"
#import "BookcitySpecialsModel.h"
#import "BookcityCreatModel.h"
#import "BookcityRankingListModel.h"
#import "BookcityRecomendModel.h"
#import "NSString+JSON.h"

@implementation DataManager

static DataManager *_dataManager = nil;
+ (DataManager *)sharedDataManger {
    if (!_dataManager) {
        _dataManager = [[DataManager alloc]init];
    }
    return _dataManager;
}

+(NSArray *)getBookrackListData:(id)responseObject{
    NSArray *Array=responseObject[@"info"][@"topBigBooks"];
    
    NSMutableArray *mutableArray=[@[]mutableCopy];
    
    for (NSDictionary *dict in Array) {
        BookrackListModel *rackList=[BookrackListModel parseListJSON:dict];
        [mutableArray addObject:rackList];
    }
    return [mutableArray copy];
}

+ (NSArray *)getBookcitySpecialsData:(id)responseObject{
    NSArray *Array=responseObject[@"info"][@"specials"];
    
    NSMutableArray *mutableArray=[@[]mutableCopy];
    
    for (NSDictionary *dict in Array) {
        BookcitySpecialsModel *Specials=[BookcitySpecialsModel parseListJSON:dict];
        [mutableArray addObject:Specials];
    }
    return [mutableArray copy];
}

+ (NSArray *)getBookcityCreatData:(id)responseObject{
    NSArray *Array=responseObject[@"info"][@"comicsList"];
    
    NSMutableArray *mutableArray=[@[]mutableCopy];
    
    for (NSDictionary *dict in Array) {
        BookcityCreatModel *Creat=[BookcityCreatModel parseListJSON:dict];
        [mutableArray addObject:Creat];
    }
    return [mutableArray copy];
}

+ (NSArray *)getBookcityRankingListData:(id)responseObject{
    NSArray *Array=responseObject[@"info"][@"specials"];
    
    NSMutableArray *mutableArray=[@[]mutableCopy];
    
    for (NSDictionary *dict in Array) {
        BookcityRankingListModel *rankingList=[BookcityRankingListModel parseListJSON:dict];
        [mutableArray addObject:rankingList];
    }
    return [mutableArray copy];
}

+ (NSArray *)getBookcityRecomendData:(id)responseObject{
    NSString *str=responseObject[@"info"][@"adlistjson"];
    
    NSArray *Array = [NSString arrayWithJsonString:str];
    
    NSMutableArray *mutableArray=[@[]mutableCopy];
    
    for (NSDictionary *dict in Array) {
        BookcityRecomendModel *recomend=[BookcityRecomendModel parseListJSON:dict];
        [mutableArray addObject:recomend];
    }
    return [mutableArray copy];
}

@end
