//
//  XPNetworkRequest.h
//  ManHuaCheng
//
//  Created by dragon on 16/6/29.
//  Copyright © 2016年 win. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^MyCallback)(id obj);
@interface XPNetworkRequest : NSObject
+(void)requestNovelListWithCallback:(MyCallback)callback;
@end
