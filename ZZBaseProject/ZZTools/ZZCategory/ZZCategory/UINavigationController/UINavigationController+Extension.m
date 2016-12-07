//
//  UINavigationController+Extension.m
//  ZZCategory
//
//  Created by zhaozhe on 16/12/7.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import "UINavigationController+Extension.h"

@implementation UINavigationController (Extension)
- (void)pushVC:(UIViewController *)vc withBackTitle:(NSString *)backTitle animated:(BOOL)animated
{
    vc.hidesBottomBarWhenPushed = YES;
    
    if (backTitle.length != 0 )
    {
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
        backItem.title = backTitle;
        self.topViewController.navigationItem.backBarButtonItem = backItem;
    }
    [self pushViewController:vc animated:animated];
}

- (UIViewController *)popVCAnimated:(BOOL)animated
{
    return [self popViewControllerAnimated:animated];
}
@end
