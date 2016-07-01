//
//  XPNovel.h
//  ManHuaCheng
//
//  Created by dragon on 16/6/29.
//  Copyright © 2016年 win. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>

@interface XPNovel : JSONModel
/** 图片 */
@property (nonatomic, strong) NSString *cover;
/** 书名 */
@property (nonatomic, strong) NSString *title;
/** 简介 */
@property (nonatomic, strong) NSString *shortIntro;
/** 鲜花数 */
@property (nonatomic, strong) NSString *latelyFollower;

-(instancetype)initWithDic:(NSDictionary *)dic;
@end
