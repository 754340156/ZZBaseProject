//
//  BaseAppDelegate.h
//  ZZBaseProject
//
//  Created by zhaozhe on 16/12/7.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseAppDelegate : UIResponder<UIApplicationDelegate>
+ (instancetype)sharedAppDelegate;

@property (strong, nonatomic) UIWindow *window;
/**  单例 */
- (void)configureSingle;

/** 模块入口 */
- (void)configAppLaunch;

/**  进入登录 */
- (void)enterLoginUI;
@end
