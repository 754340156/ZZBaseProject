//
//  BaseTBC.m
//  ZZBaseProject
//
//  Created by zhaozhe on 16/12/7.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import "BaseTBC.h"
#import "BaseNC.h"
@interface BaseTBC ()<UITabBarControllerDelegate>
@property (nonatomic, assign) NSInteger indexFlag;

@end

@implementation BaseTBC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configTabBar];    //配置tabbar
    [self addOwnViews];     //添加子视图
    [self updateUserInfo];  //更新用户信息
    [self reserveJS];       //为热更新预留
}
//配置tabbar
- (void)configTabBar
{
//    [[UITabBar appearance] setShadowImage:[UIImage imageWithColor:MainCol size:CGSizeMake(kScreenW, 1)]];
    //选中状态颜色
//    self.tabBar.tintColor = MainCol;
    self.delegate = self;
}

//添加子视图
- (void)addOwnViews
{
    
}

- (void)updateUserInfo
{
    
//    NSDictionary *params = @{};
    
//    [NetWork POST_:@"" parameters:params success:^(NSDictionary *dic) {
//        
//        NSInteger code = [dic[@"code"] integerValue];
//        if (code == 0)
//        {
//            //解析用户数据
//            
//        }
//        
//    } fail:^(NSError *error) {
//        
//    }];
}

- (void)reserveJS
{
    
}

//添加子控制器
- (void)addChildVC:(UIViewController *)vc title:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage
{
    vc.title = title;
    
    BaseNC *naviC = [[BaseNC alloc] initWithRootViewController:vc];
    
    //把图片渲染成指定颜色
    UIImage *normalImage = image;
    naviC.tabBarItem.image = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    naviC.tabBarItem.selectedImage = selectedImage;
    naviC.tabBarItem.title = title;
    [naviC.tabBarItem setImageInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    [self addChildViewController:naviC];
    //    //设置tabBarItem的选中状态文字颜色
    //    [naviC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : MainCol} forState:UIControlStateSelected];
    //    //设置tabBarItem的默认状态文字颜色
    //    [naviC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : kGrayColor} forState:UIControlStateNormal];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSInteger index = [self.tabBar.items indexOfObject:item];
    
    if (self.indexFlag != index) {
        [self animationWithIndex:index];
    }
}

// 动画
- (void)animationWithIndex:(NSInteger) index {
    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarbuttonArray addObject:tabBarButton];
        }
    }
    CABasicAnimation*pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulse.duration = 0.1;
    pulse.repeatCount= 1;
    pulse.autoreverses= YES;
    pulse.fromValue= [NSNumber numberWithFloat:0.8];
    pulse.toValue= [NSNumber numberWithFloat:1.2];
    [[tabbarbuttonArray[index] layer]
     addAnimation:pulse forKey:nil];
    
    self.indexFlag = index;
}
@end
