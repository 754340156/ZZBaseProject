//
//  AdvertiseHelper.h
//  ZZTools
//
//  Created by zhaozhe on 16/12/6.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdvertiseView.h"

@interface AdvertiseHelper : NSObject
+ (instancetype)sharedInstance;

+(void)showAdvertiserView:(NSArray *)imageArray;

@end
