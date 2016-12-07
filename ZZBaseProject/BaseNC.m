//
//  BaseNC.m
//  ZZBaseProject
//
//  Created by zhaozhe on 16/12/7.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import "BaseNC.h"

@interface BaseNC ()

@end

@implementation BaseNC

//初始化带返回按钮的
- (instancetype)initWithBackBtnStyleRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self)
    {
        rootViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"这里添加返回按钮"] style:UIBarButtonItemStylePlain target:rootViewController action:@selector(handleDismiss)];
    }
    return self;
}
- (void)handleDismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
