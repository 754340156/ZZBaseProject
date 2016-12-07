//
//  NSObject+Extension.m
//  ZZCategory
//
//  Created by zhaozhe on 16/12/6.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import "NSObject+Extension.h"

@implementation NSObject (Extension)
#pragma mark -  block
- (void)excuteBlock:(CommonBlock)block
{
    __weak id selfPtr = self;
    if (block) {
        block(selfPtr);
    }
}

- (void)performBlock:(CommonBlock)block
{
    if (block)
    {
        [self performSelector:@selector(excuteBlock:) withObject:block];
    }
}

- (void)performBlock:(CommonBlock)block afterDelay:(NSTimeInterval)delay
{
    if (block)
    {
        [self performSelector:@selector(excuteBlock:) withObject:block afterDelay:delay];
    }
}

- (void)cancelBlock:(CommonBlock)block
{
    [[NSRunLoop currentRunLoop] cancelPerformSelector:@selector(excuteBlock:) target:self argument:block];
}


- (void)excuteCompletion:(CommonCompletionBlock)block withFinished:(NSNumber *)finished
{
    __weak id selfPtr = self;
    if (block) {
        block(selfPtr, finished.boolValue);
    }
}

- (void)performCompletion:(CommonCompletionBlock)block withFinished:(BOOL)finished
{
    if (block)
    {
        [self performSelector:@selector(excuteCompletion:withFinished:) withObject:block withObject:[NSNumber numberWithBool:finished]];
    }
}

- (void)cancelCompletion:(CommonCompletionBlock)block
{
    [[NSRunLoop currentRunLoop] cancelPerformSelector:@selector(excuteCompletion:withFinished:) target:self argument:block];
}
- (void)asynExecuteCompletion:(CommonBlock)completion tasks:(CommonBlock)task, ... NS_REQUIRES_NIL_TERMINATION
{
    va_list arguments;
    
    if (task)
    {
        if (task)
        {
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                if (task)
                {
                    task(self);
                }
            });
            
            va_start(arguments, task);
            NSLog(@"%@ <<<<<<<<<=============", task);
            BOOL next = YES;
            do
            {
                CommonBlock eachObject = va_arg(arguments, CommonBlock);
                NSLog(@"%@ <<<<<<<<<=============", eachObject);
                if (eachObject)
                {
                    dispatch_async(dispatch_get_global_queue(0, 0), ^{
                        if (eachObject)
                        {
                            eachObject(self);
                        }
                    });
                }
                else
                {
                    next = NO;
                }
                
            }while (next);
            va_end(arguments);
        }
        
        dispatch_barrier_async(dispatch_get_global_queue(0, 0), ^{
            if (completion)
            {
                completion(self);
            }
        });
    }
}
#pragma mark -
- (NSString *)className
{
    return [NSString stringWithUTF8String:object_getClassName(self)];
}

+ (NSString *)className
{
    return NSStringFromClass(self);
}
@end