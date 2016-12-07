//
//  GuidePagesHelper.h
//  ZZTools
//
//  Created by zhaozhe on 16/12/6.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GuidePagesView.h"
@interface GuidePagesHelper : NSObject
+ (instancetype)shareInstance;

+ (void)showGuidePagesView:(NSArray *)imageArray;

@end
