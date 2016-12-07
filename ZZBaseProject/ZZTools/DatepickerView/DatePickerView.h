//
//  DatePickerView.h
//  ZZTools
//
//  Created by zhaozhe on 16/12/6.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DatePickerViewType)
{
    DatePickerViewTypeNormal = 0,
    DatePickerViewTypeHaveBtn,
    DatePickerViewTypeAutoComputeAge,
    DatePickerViewTypeAutoComputeConstellation,
    DatePickerViewTypeAutoComputeAgeAndConstellation
};

typedef  void(^DatePickerViewBlock)(NSDate *selectedDate, NSInteger age, NSString *constellation);

@interface DatePickerView : UIView

- (instancetype)initWithStyle:(DatePickerViewType)style date:(NSDate *)date block:(DatePickerViewBlock)block;

//显示
- (void)show;

//隐藏
- (void)dismiss;

//设置顶部的按钮Bar的颜色  和  按钮标题的颜色
- (void)setBtnBarColor:(UIColor *)barColor btnTitleColor:(UIColor *)btnTitleColor;

@end
