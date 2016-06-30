//
//  XPNetworkRequest.m
//  ManHuaCheng
//
//  Created by dragon on 16/6/29.
//  Copyright © 2016年 win. All rights reserved.
//

#import "XPNetworkRequest.h"

@implementation XPNetworkRequest
+(void)requestNovelListWithCallback:(MyCallback)callback
{
    NSString *path = [NSString stringWithFormat:@"http://api.zhuishushenqi.com/outside/book-list?target=comicIsland"];
    path = [path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:path]];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@",dic);
        
        
        
              
    }];

    [task resume];

}
@end
