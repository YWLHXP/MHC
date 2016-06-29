//
//  CollectionViewCell.m
//  ManHuaCheng
//
//  Created by tarena on 16/6/29.
//  Copyright © 2016年 win. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] init];
        //        self.imageView.layer.cornerRadius = self.contentView.bounds.size.width/2;
        //        self.imageView.layer.masksToBounds = YES;
        [self.contentView addSubview:self.imageView];
        
        self.label = [[UILabel alloc]init];
        [self.contentView addSubview:self.label];
        self.label.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
    self.imageView.frame = CGRectMake(0, 5 + 20, layoutAttributes.size.width, layoutAttributes.size.width);
    self.label.frame = CGRectMake(0, layoutAttributes.size.width+30, layoutAttributes.size.width, 30);
}

@end
