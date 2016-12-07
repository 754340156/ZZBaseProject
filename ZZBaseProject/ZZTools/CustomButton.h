//
//  CustomButton.h
//  ZZTools
//
//  Created by zhaozhe on 16/12/6.
//  Copyright © 2016年 zhaozhe. All rights reserved.
// 自定义button布局

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, CustomButtonStyle)
{
    CustomButtonStyleNormal = 0,
    CustomButtonStyleImageRight,
    CustomButtonStyleImageTop,
    CustomButtonStyleImageBottom,
};

typedef NS_ENUM(NSInteger, CustomButtonLayoutStyle)
{
    CustomButtonLayoutStyleNone = 0,
    CustomButtonLayoutStyleLeft,
    CustomButtonLayoutStyleRight,
    CustomButtonLayoutStyleTop,
    CustomButtonLayoutStyleBottom,
};

typedef NS_ENUM(NSUInteger, CustomButtonState)
{
    CustomButtonNormalStateNormal       = 0,
    CustomButtonNormalStateSelected     = 1,
    CustomButtonSelectedStateNormal     = 2,
    CustomButtonSelectedStateSelected   = 3
};
@interface CustomButton : UIButton
/**
 CustomButton的自动布局
 
 @param frame 若autoSize为YES，frame.size的宽高为最大
 @param style 按钮的类型（根据图片和标题的位置区分）
 @param layoutStyle 按钮（图片和标题控件整体偏移）的方向
 @param font  按钮标题的字体
 @param title 按钮标题
 @param image 按钮的图标
 @param space 按钮中图片与标题之间的间距
 @param margin 按钮（图片和标题控件整体偏移）的距离
 @param autoSize 是否自动适配为最小的size
 @return self
 */
+ (instancetype)btnType:(UIButtonType)btnType
                  frame:(CGRect)frame
                  style:(CustomButtonStyle)style
            layoutStyle:(CustomButtonLayoutStyle)layoutStyle
                   font:(UIFont *)font
                  title:(NSString *)title
                  image:(UIImage *)image
                  space:(CGFloat)space
                 margin:(CGFloat)margin
               autoSize:(BOOL)autoSize;

- (instancetype)initWithFrame:(CGRect)frame
                        style:(CustomButtonStyle)style
                  layoutStyle:(CustomButtonLayoutStyle)layoutStyle
                         font:(UIFont *)font
                        title:(NSString *)title
                        image:(UIImage *)image
                        space:(CGFloat)space
                       margin:(CGFloat)margin
                     autoSize:(BOOL)autoSize;

- (instancetype)initWithFrame:(CGRect)frame
                        style:(CustomButtonStyle)style
                         font:(UIFont *)font
                        title:(NSString *)title
                        image:(UIImage *)image
                        space:(CGFloat)space
                     autoSize:(BOOL)autoSize;

- (instancetype)initWithFrame:(CGRect)frame
                  layoutStyle:(CustomButtonLayoutStyle)layoutStyle
                         font:(UIFont *)font
                        title:(NSString *)title
                     autoSize:(BOOL)autoSize;

@property (nonatomic ,assign) CustomButtonStyle style;
@property (nonatomic ,assign) CustomButtonLayoutStyle layoutStyle;
@property (nonatomic ,assign) CGFloat space;
@property (nonatomic ,assign) CGFloat margin;

@property (nonatomic ,assign) BOOL autoSize;
@property (nonatomic, assign) CGSize minSize;

//默认的背景色
@property (nonatomic, strong) UIColor *normalBgColor;
//选中的背景色
@property (nonatomic, strong) UIColor *selectedBgColor;

//默认的边框颜色
@property (nonatomic, strong) UIColor *normalBorderColor;
//选中的边框颜色
@property (nonatomic, strong) UIColor *selectedBorderColor;

@property (nonatomic, strong) UIColor *highlightColor;

@property (nonatomic, assign) BOOL transparentWhenhighlight;
@property (nonatomic, assign) BOOL qbSelected;

- (void)setImage:(UIImage *)image forCustomButtonState:(CustomButtonState)state;
@end
