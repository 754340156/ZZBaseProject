//
//  PhotosCollectionViewCell.m
//  ZZBaseProject
//
//  Created by zhaozhe on 16/12/7.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import "PhotosCollectionViewCell.h"

@implementation PhotosCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = kWhiteColor;
        [self createViews];
        [self layoutViews];
    }
    return self;
}
//创建子视图
- (void)createViews
{
    self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self.contentView addSubview:self.imageView];
}

//布局子视图
- (void)layoutViews
{
    
}
@end
