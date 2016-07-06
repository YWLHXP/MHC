//
//  ADBookcityRankingListCollectionViewCell.m
//  ManHuaCheng
//
//  Created by tarena on 16/7/6.
//  Copyright © 2016年 win. All rights reserved.
//

#import "ADBookcityRankingListCollectionViewCell.h"

@implementation ADBookcityRankingListCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.imageView];
        
        self.underTextView = [[UIView alloc]init];
        self.underTextView.backgroundColor = [UIColor colorWithRed:213/255.0 green:24/255.0 blue:20/255.0 alpha:0.8];
        [self.contentView addSubview:self.underTextView];
        
        self.underTextLabel = [[UILabel alloc]init];
        self.underTextLabel.textColor = [UIColor whiteColor];
        self.underTextLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:self.underTextLabel];
    }
    return self;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
    self.imageView.frame = CGRectMake(0, 0, layoutAttributes.size.width, layoutAttributes.size.height);
    self.underTextLabel.frame = CGRectMake(10, layoutAttributes.size.height/7*6, layoutAttributes.size.width, layoutAttributes.size.height/7);
    self.underTextView.frame = CGRectMake(0, layoutAttributes.size.height/7*6, layoutAttributes.size.width, layoutAttributes.size.height/7);
}

@end
