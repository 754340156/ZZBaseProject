//
//  UINavigationController+Extension.h
//  ZZCategory
//
//  Created by zhaozhe on 16/12/7.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Extension)
- (void)pushVC:(UIViewController *)vc withBackTitle:(NSString *)backTitle animated:(BOOL)animated;
- (UIViewController *)popVCAnimated:(BOOL)animated;
@end
