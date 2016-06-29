//
//  DataManager.m
//  ManHuaCheng
//
//  Created by tarena on 16/6/29.
//  Copyright © 2016年 win. All rights reserved.
//

#import "DataManager.h"
#import "BookrackListModel.h"

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
        BookrackListModel *list=[BookrackListModel parseListJSON:dict];
        [mutableArray addObject:list];
    }
    return [mutableArray copy];
}
@end
