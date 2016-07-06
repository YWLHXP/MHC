//
//  NSString+JSON.h
//  demo1_AFNetworking
//
//  Created by tarena on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JSON)

+(NSString *)jsonStringWithDictionary:(NSDictionary *)dictionary;
+(NSString *)jsonStringWithArray:(NSArray *)array;
+(NSString *)jsonStringWithString:(NSString *)string;
+(NSString *)jsonStringWithObject:(id)object;
+(NSArray *)arrayWithJsonString:(NSString *)jsonString;

@end
