//
//  AppDelegate.m
//  ZZBaseProject
//
//  Created by zhaozhe on 16/12/7.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

+ (instancetype)sharedAppDelegate
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}
//入口配置 （重写父类）
- (void)configAppLaunch
{
    
}

//配置单例
- (void)configureSingle
{
    
}
/**  进入登录 */
- (void)enterLoginUI
{
    
}
@end
