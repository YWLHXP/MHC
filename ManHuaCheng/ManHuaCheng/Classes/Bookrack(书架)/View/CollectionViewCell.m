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
        self.imageView.layer.cornerRadius = self.contentView.bounds.size.width/10;
        self.imageView.layer.masksToBounds = YES;
        [self.contentView addSubview:self.imageView];
        
        self.label = [[UILabel alloc]init];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.textColor = [UIColor grayColor];
        self.label.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:self.label];
        
    }
    return self;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
    self.imageView.frame = CGRectMake(0, 0, layoutAttributes.size.width, layoutAttributes.size.height);
    self.label.frame = CGRectMake(0, layoutAttributes.size.height+5, layoutAttributes.size.width, 15);
}

@end
