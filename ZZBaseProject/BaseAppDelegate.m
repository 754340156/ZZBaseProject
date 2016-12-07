//
//  BaseAppDelegate.m
//  ZZBaseProject
//
//  Created by zhaozhe on 16/12/7.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import "BaseAppDelegate.h"

@implementation BaseAppDelegate
+ (instancetype)sharedAppDelegate
{
    return (BaseAppDelegate *)[UIApplication sharedApplication].delegate;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [NetWork startWorkReachability]; //开启网络监听
    [self configAppearance];         //配置app的通用外观
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _window.backgroundColor = [UIColor whiteColor];
    [self configureSingle];         //配置单例
    [self configAppLaunch];         //模块入口
    [self configureBoardManager];   //配置键盘管理
    [self configureUMSocial];       //配置友盟分享
    [self enterLoginUI];            // 进入登录界面
    
    [_window makeKeyAndVisible];
    
    //引导页面加载
    [self setupGuidePage];
    
    //启动广告（记得放最后，才可以盖在页面上面）
    [self setupAdveriseView];
    return YES;
}
// 配置App中的控件的默认属性
- (void)configAppearance
{
    [[UINavigationBar appearance] setTintColor:kBlackColor];
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = kWhiteColor;
    shadow.shadowOffset = CGSizeMake(0, 0);

    UIFont *font = [UIFont boldSystemFontOfSize:18.0];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:kBlackColor,NSShadowAttributeName:shadow,NSFontAttributeName:font}];
    [[UITableViewCell appearance] setBackgroundColor:[UIColor whiteColor]];
    [[UILabel appearance] setTextColor:kBlackColor];
    [[UIButton appearance] setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //设置搜索框取消按钮的样式
    [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], [UINavigationBar class], nil]setTitleTextAttributes:@{NSForegroundColorAttributeName:kBlackColor,NSFontAttributeName:[UIFont systemFontOfSize:17]}forState:UIControlStateNormal];
}
//配置友盟分享
- (void)configureUMSocial
{
    //友盟分享
    [UMSocialData setAppKey:UmengAppKey];
    //打开调试log的开关
    //    [UMSocialData openLog:YES];
    //微信和朋友圈分享
    [UMSocialWechatHandler setWXAppId:WeiChatShareAPPID appSecret:WeiChatShareAPPKEY url:AppShareURL];
    //QQ和QQ空间分享
    [UMSocialQQHandler setSupportWebView:YES];//设置支持没有客户端情况下使用SSO授权
    [UMSocialQQHandler setQQWithAppId:QQShareAPPID appKey:QQShareAPPKEY url:AppShareURL];//设置分享到QQ空间的应用Id，和分享url 链接
    //
    // 打开新浪微博的SSO开关
    // 将在新浪微博注册的应用appkey、redirectURL替换下面参数，并在info.plist的URL Scheme中相应添加wb+appkey，如"wb3921700954"，详情请参考官方文档。
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:SinaShare
                                              secret:SinaSecret
                                         RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    
    //[UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToSina, UMShareToQQ, UMShareToQzone, UMShareToWechatSession, UMShareToWechatTimeline]];
}
- (void)configureSingle
{
    
}
//模块入口
- (void)configAppLaunch
{
    // 作App配置
#if kSupportNetReachablity
    [[NetworkUtility sharedNetworkUtility] startCheckWifi];
#endif
}
//进入登录
- (void)enterLoginUI
{
    
}
//配置广告
- (void)setupAdveriseView
{
    NSArray *imageArray = @[@"http://imgsrc.baidu.com/forum/pic/item/9213b07eca80653846dc8fab97dda144ad348257.jpg", @"http://pic.paopaoche.net/up/2012-2/20122220201612322865.png", @"http://img5.pcpop.com/ArticleImages/picshow/0x0/20110801/2011080114495843125.jpg", @"http://www.mangowed.com/uploads/allimg/130410/1-130410215449417.jpg"];
    
    [AdvertiseHelper showAdvertiserView:imageArray];
}
//配置引导页
- (void)setupGuidePage
{
    if ([ReadForLocation(@"IsNotFirstLaunch_Key") boolValue])
    {
        return;
    }
    WriteForLocation(@(YES), @"IsNotFirstLaunch_Key");
    NSArray *images = @[@"introductoryPage1",@"introductoryPage2",@"introductoryPage3",@"introductoryPage4"];
    [GuidePagesHelper showGuidePagesView:images];
}
//键盘管理
-(void)configureBoardManager
{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.keyboardDistanceFromTextField=60;
    manager.enableAutoToolbar = NO;
}
@end
