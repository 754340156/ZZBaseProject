//
//  CustomSwitch.h
//  ZZTools
//
//  Created by zhaozhe on 16/12/6.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomSwitch : UIView
- (instancetype)initWithFrame:(CGRect)frame
                  onBackColor:(UIColor *)onBackColor
                 offBackColor:(UIColor *)offBackColor
                 onFrontColor:(UIColor *)onFrontColor
                offFrontColor:(UIColor *)offFrontColor
                    lineWidth:(CGFloat )lineWidth;

- (void)switchOn;
- (void)switchOff;

@property (nonatomic, strong) UIView * ballView;
@end
