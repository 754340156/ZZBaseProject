//
//  Font.h
//  ZZCategory
//
//  Created by zhaozhe on 16/12/6.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#ifndef Font_h
#define Font_h

#pragma mark - 通用
#define Font(x)      [UIFont systemFontOfSize:x]
#define BoldFont(x)  [UIFont boldSystemFontOfSize:x]

#define AdaptedFont(x)     [UIFont systemFontOfSize:FloatAdapted(x)]
#define AdaptedBoldFont(x) [UIFont boldSystemFontOfSize:FloatAdapted(x)]

#define LightAdaptedFont(x)     [UIFont systemFontOfSize:LightAdapted(x)]

/********************定义通用颜色********************/
#define kBlackColor         [UIColor blackColor]
#define kDarkGrayColor      [UIColor darkGrayColor]
#define kLightGrayColor     [UIColor lightGrayColor]
#define kWhiteColor         [UIColor whiteColor]
#define kGrayColor          [UIColor grayColor]
#define kRedColor           [UIColor redColor]
#define kGreenColor         [UIColor greenColor]
#define kBlueColor          [UIColor blueColor]
#define kCyanColor          [UIColor cyanColor]
#define kYellowColor        [UIColor yellowColor]
#define kMagentaColor       [UIColor magentaColor]
#define kOrangeColor        [UIColor orangeColor]
#define kPurpleColor        [UIColor purpleColor]
#define kClearColor         [UIColor clearColor]
#endif /* Font_h */
