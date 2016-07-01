//
//  XPNetworkRequest.m
//  ManHuaCheng
//
//  Created by dragon on 16/6/29.
//  Copyright © 2016年 win. All rights reserved.
//

#import "XPNetworkRequest.h"
#import "XPNovel.h"
#import <AFNetworking.h>

@implementation XPNetworkRequest
+(void)requestNovelListWithCallback:(MyCallback)callback
{
    NSString *path = [NSString stringWithFormat:@"http://api.zhuishushenqi.com/outside/book-list?target=comicIsland"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
       //开始解析
        XPNovel *novel = [[XPNovel alloc] initWithDictionary:dic error:nil];
        NSLog(@"%@", dic);
        callback(novel);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"解析失败");
    }];


}
@end
