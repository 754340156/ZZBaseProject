//
//  BaseVC.h
//  ZZBaseProject
//
//  Created by zhaozhe on 16/12/7.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseVC : UIViewController<UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate, UIWebViewDelegate>
/**  是否使用键盘管理者(默认使用) */
@property (nonatomic, assign) BOOL isUseKeyboardManager;
/**  导航条底部的黑线（系统和自定义）隐藏和颜色的设置 */
@property (nonatomic, assign) BOOL naviBarSystemLine_hidden;
@property (nonatomic, assign) BOOL naviBarCustomLine_hidden;
@property (nonatomic, strong) UIColor *naviBarCustomLine_color;
/**  下拉刷新 */
@property (nonatomic, strong) MJRefreshNormalHeader *refreshHeader;
/**  上拉加载 */
@property (nonatomic, strong) MJRefreshAutoNormalFooter *refreshFooter;
/**  数据源 */
@property (nonatomic, strong) NSMutableArray *listArray;
/**  页码 */
@property (nonatomic, assign) NSInteger pageIndex;

//配置初始化的参数 (供子类重写)
- (void)configParams;

//配置容器类 (供子类重写)
- (void)configContainer;

//添加views (供子类重写)
- (void)addOwnViews;

//配置,布局views (供子类重写)
- (void)configOwnViews;

//为热更新预留的方法
- (void)reserveJS;

#pragma mark - handle action

//列表数据网络请求
- (void)requestListDataAnimation:(BOOL)animated;

//点击某个按钮执行的事件（确定/删除/完成）
- (void)handleComplete:(UIButton *)sender;

//左侧按钮 dismiss
- (void)handleDismiss;

//左侧返回按钮 -- pop
- (void)handlePop;

//下拉刷新 -- 触发事件
- (void)onDownPullRefresh:(MJRefreshNormalHeader *)refreshHeader;

//上拉加载 -- 触发事件
- (void)onUpPullRefresh:(MJRefreshAutoNormalFooter *)refreshFooter;

//停止刷新
- (void)endRefreshing;
#pragma mark - BarButtonItem
//设置导航栏图片按钮文字按钮
- (void)addLeftImage:(UIImage *)image action:(SEL)action;
- (void)addRightImage:(UIImage *)image action:(SEL)action;
- (void)addLeftTitle:(NSString *)title action:(SEL)action;
- (void)addRightTitle:(NSString *)title action:(SEL)action;
- (void)addLeftBtn:(UIButton *)btn action:(SEL)action;
- (void)addRightBtn:(UIButton *)btn action:(SEL)action;
- (void)removeAllLeftBtns;
- (void)removeAllRightBtns;
#pragma mark - network
//单纯的网络请求
- (void)POST_:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(NSDictionary*dic))success fail:(void(^)(NSError*error))fail;

//耦合视图层的请求
- (void)POST:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(NSDictionary*dic))success fail:(void(^)(NSError*error))fail sendView:(UIView *)sendView animSuperView:(UIView *)animSuperView animated:(BOOL)animated;
@end
