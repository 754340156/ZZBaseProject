//
//  BaseModel.m
//  ZZBaseProject
//
//  Created by zhaozhe on 16/12/7.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
MJLogAllIvars

MJCodingImplementation

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID":@"id"};
}

//null的字段处理
- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property
{
    //把null属性处理成空
    if ([oldValue isKindOfClass:[NSNull class]])
    {
        if (property.type.isNumberType)
        {
            return 0;
        }
        else if (property.type.isBoolType)
        {
            return 0;
        }
        else if ([property.type.code isEqualToString:@"NSArray"])
        {
            return @[];
        }
        else
        {
            return @"";
        }
    }
    //把没有的字段处理成空字符串
    if (!oldValue)
    {
        if (property.type.isNumberType)
        {
            return 0;
        }
        else if (property.type.isBoolType)
        {
            return 0;
        }
        else if ([property.type.code isEqualToString:@"NSArray"])
        {
            return @[];
        }
        else
        {
            return @"";
        }
    }
    return oldValue;
}
@end
