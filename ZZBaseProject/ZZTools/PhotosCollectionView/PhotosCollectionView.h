//
//  PhotosCollectionView.h
//  ZZBaseProject
//
//  Created by zhaozhe on 16/12/7.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import <UIKit/UIKit.h>
//一行的数量
#define singleLineCount 3
//最多上传
#define maxCount 5

@interface PhotosCollectionView : UIView
/** 初始化方法（默认宽度是屏幕宽） */
- (instancetype)initWithFrame:(CGRect)frame withItemWidth:(CGFloat)itemWidth ItemHeight:(CGFloat)itemHeight kMargin:(CGFloat)kMargin ViewController:(UIViewController *)viewController ItemImage:(NSString *)itemImage;

/**  选完图片的block回调有可能改变了高度 */
@property(nonatomic,copy) void (^refreshEndBlock)(CGFloat height);
@end
