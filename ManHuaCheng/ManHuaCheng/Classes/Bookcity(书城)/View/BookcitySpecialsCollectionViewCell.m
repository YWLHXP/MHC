//
//  BookcitySpecialsCollectionViewCell.m
//  ManHuaCheng
//
//  Created by tarena on 16/7/4.
//  Copyright © 2016年 win. All rights reserved.
//

#import "BookcitySpecialsCollectionViewCell.h"

@implementation BookcitySpecialsCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.whiteView = [[UIView alloc]init];
        self.whiteView.backgroundColor = [UIColor whiteColor];
        
        self.maskImage = [[UIImageView alloc]init];
        self.maskImage.layer.masksToBounds = YES;
        self.maskImage.image = [UIImage imageNamed:@"city_bg_shadow"];
        
        self.starImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"city_bg_star"]];
        self.starImageView.frame = CGRectMake(5, 10, 10, 10);
        
        self.detailLabel = [[UILabel alloc]init];
        self.detailLabel.textColor = [UIColor whiteColor];
        self.detailLabel.font = [UIFont systemFontOfSize:10];
        [self.maskImage addSubview:self.starImageView];
        [self.maskImage addSubview:self.detailLabel];
        
        self.label = [[UILabel alloc]init];
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:12];
        [self.whiteView addSubview:self.label];
        
        self.imageView = [[UIImageView alloc] init];
        self.imageView.layer.cornerRadius = self.contentView.bounds.size.width/20;
        self.imageView.layer.masksToBounds = YES;
        [self.imageView addSubview:self.whiteView];
        [self.imageView addSubview:self.maskImage];
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
    self.imageView.frame = CGRectMake(0, 0, layoutAttributes.size.width, layoutAttributes.size.height);
    self.whiteView.frame = CGRectMake(0, self.imageView.frame.size.height-30, self.imageView.frame.size.width, 30);
    self.maskImage.frame = CGRectMake(0, self.imageView.frame.size.height-30*2, self.imageView.frame.size.width, 30);
    self.detailLabel.frame = CGRectMake(20, 5, self.maskImage.frame.size.width-30, 20);
    self.label.frame = CGRectMake(5, 5, self.whiteView.frame.size.width-5, 20);
}

@end
