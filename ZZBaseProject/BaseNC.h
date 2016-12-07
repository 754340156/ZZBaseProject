//
//  BaseNC.h
//  ZZBaseProject
//
//  Created by zhaozhe on 16/12/7.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNC : UINavigationController
//初始化带返回按钮的,用于登录模态出的控制器
- (instancetype)initWithBackBtnStyleRootViewController:(UIViewController *)rootViewController;

@end
