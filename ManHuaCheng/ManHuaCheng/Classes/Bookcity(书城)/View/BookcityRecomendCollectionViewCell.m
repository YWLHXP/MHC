//
//  BookcityRecomendCollectionViewCell.m
//  ManHuaCheng
//
//  Created by tarena on 16/7/5.
//  Copyright © 2016年 win. All rights reserved.
//

#import "BookcityRecomendCollectionViewCell.h"

@implementation BookcityRecomendCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.whiteView = [[UIView alloc]init];
        self.whiteView.backgroundColor = [UIColor whiteColor];
        self.whiteView.layer.cornerRadius = self.contentView.bounds.size.width/20;
        self.whiteView.layer.masksToBounds = YES;
        
        self.label = [[UILabel alloc]init];
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:15];
        
        self.imageView = [[UIImageView alloc] init];
        self.imageView.layer.cornerRadius = self.contentView.bounds.size.width/20;
        self.imageView.layer.masksToBounds = YES;
        
        [self.whiteView addSubview:self.label];
        [self.whiteView addSubview:self.imageView];
        [self.contentView addSubview:self.whiteView];
    }
    return self;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
    self.whiteView.frame = CGRectMake(0, 0, layoutAttributes.size.width, layoutAttributes.size.height);
    self.imageView.frame = CGRectMake(0, 0, self.whiteView.frame.size.width, self.whiteView.frame.size.height-30);
    self.label.frame = CGRectMake(5, self.imageView.frame.size.height+5, self.whiteView.frame.size.width-5, 20);
}

@end
