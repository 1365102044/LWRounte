//
//  LWRouteManager.m
//  HaoYu
//
//  Created by 刘文强 on 2018/11/26.
//  Copyright © 2018年 LWQ. All rights reserved.
//

#import "LWRouteManager.h"
#import "LWRouteHeader.h"
@interface LWRouteManager ()
@property (nonatomic, copy) void (^actionBlock) (NSString *actionName,NSDictionary *data);
@end
@implementation LWRouteManager

+ (instancetype)shareInstance
{
    static LWRouteManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LWRouteManager alloc] init];
    });
    return instance;
}

/**
 开启URL路由访问功能

 @param urlchemes 允许的urlschemes
 @param pageHost 代表page访问的host
 @param actionHost 代表方法访问的host
 @param actionBlock 回调
 */
+ (void)startWithUrlSchemes:(NSArray<NSString *> *)urlchemes
                   pageHost:(NSString *)pageHost
                 actionHost:(NSString *)actionHost
                actionBlock:(void (^)(NSString *actionName,NSDictionary *data))actionBlock
{
    LWRouteConfig.share.urlSchems = urlchemes;
    [LWRouteConfig.share setOpenPageHost:pageHost];
    [LWRouteConfig.share setActionHost:actionHost];
    LWRouteManager.shareInstance.actionBlock = actionBlock;
}

/**
 处理app间的通信、跳转等事件 可以打开appe内所有controller

 @param url URL
 @return return value description
 */
- (BOOL)appActionWithUrl:(NSURL *)url
{
    if (![LWRouteConfig.share.urlSchems containsObject:url.scheme]) {
        return NO;
    }
    LWRouteURLData *urldata = [LWRouteURLData urlDataWithUrl:url];
    if (urldata.rountType == LWRountTypeOpenPage) {
        return [self pushWithTargetVcName:urldata.controllerName fromVc:nil data:urldata.data];
    }else{
        NSString *actionName = urldata.actionName;
        NSDictionary *actionData = urldata.data;
        if (self.actionBlock) {
            self.actionBlock(actionName, actionData);
        }
    }
    return YES;
}

#pragma --- 跳转界面

/**
 通过控制器跳转 push

 @param targetVc 目标控制器
 @param fromVc 来源控制器
 @param data 参数字典
 @return 成功YES；失败NO
 */
- (BOOL)pushWithTargetVc:(UIViewController *)targetVc
                  fromVc:(UIViewController *)fromVc
                    data:(NSDictionary *)data
{
    UIViewController *tem = [self getCurrentVcWithFromVc:fromVc andCheckTargetVc:targetVc];
    if (!tem) return NO;
    [self handleParamDataWithTargetVc:targetVc data:data];
    targetVc.hidesBottomBarWhenPushed = YES;
    NSAssert(tem.navigationController != nil, @"该控制器没有导航控制器，无法push操作");
    [tem.navigationController pushViewController:targetVc animated:YES];
    return YES;
}

/**
 通过控制器跳转 present
 
 @param targetVc 目标控制器
 @param fromVc 来源控制器
 @param data 参数字典
 @return 成功YES；失败NO
 */
- (BOOL)presentWithTarget:(UIViewController *)targetVc
                   fromVc:(UIViewController *)fromVc
                     data:(NSDictionary *)data
{
    UIViewController *tem = [self getCurrentVcWithFromVc:fromVc andCheckTargetVc:targetVc];
    if (!tem) return NO;
    [self handleParamDataWithTargetVc:targetVc data:data];
    [fromVc presentViewController:targetVc animated:YES completion:nil];
    return YES;
}

/**
 通过类名跳转 push
 
 @param targetVcName 目标控制器注册的标识
 @param fromVc 来源控制器
 @param data 参数字典
 @return 成功YES；失败NO
 */
- (BOOL)pushWithTargetVcName:(NSString *)targetVcName
                      fromVc:(UIViewController *)fromVc
                        data:(NSDictionary *)data
{
    UIViewController *targetVc = (UIViewController *)[self getVcFromRegister:targetVcName];
    if (!targetVc) return NO;
    return [self pushWithTargetVc:targetVc fromVc:fromVc data:data];
}

/**
 通过类名跳转 present
 
 @param targetVcName 目标控制器注册的标识
 @param fromVc 来源控制器
 @param data 参数字典
 @return 成功YES；失败NO
 */
- (BOOL)presentWithTargetVcName:(NSString *)targetVcName
                         fromVc:(UIViewController *)fromVc
                           data:(NSDictionary *)data
{
    UIViewController *targetVc = (UIViewController *)[self getVcFromRegister:targetVcName];
    if (!targetVc) return NO;
    return [self presentWithTarget:targetVc fromVc:fromVc data:data];
}

/**
 根据目标控制器的标识获取已注册的控制器

 @param targetVcName 目标控制器注册标识
 @return return value description
 */
- (UIViewController *)getVcFromRegister:(NSString *)targetVcName
{
    NSAssert(targetVcName, @"目标控制器不能为空");
    NSString *className = [[LWRouteURLPathRegister share].registerDict objectForKey:targetVcName];
    id vc;
    if (!className) {
        LWLog(@"该类名未注册");
        vc = [[NSClassFromString(targetVcName) alloc] init];
    }else{
        vc = [[NSClassFromString(className) alloc] init];
    }
    
    if (vc) {
        if ([vc isKindOfClass:[UIViewController class]]) {
            return vc;
        }
        NSLog(@"className:%@ 对应的不是控制器",className);
        return nil;
    }else{
        NSLog(@"未找到className:%@ 对应的控制器",className);
        return nil;
    }
}

/**
 获取当前控制器并检查当前目标控制器

 @param fromVc 来源控制器
 @param targetVc 目标控制器
 @return 返回来源控制器
 */
- (UIViewController *)getCurrentVcWithFromVc:(UIViewController *)fromVc
                            andCheckTargetVc:(UIViewController *)targetVc
{
    UIViewController *tem = fromVc ? fromVc : [self getCurrentViewController];
    if (!targetVc) {
        NSAssert(targetVc, @"目标控制器不能为空");
        return nil;
    }
    return tem;
}


/**
 为目标控制器传递参数

 @param targetVc 目标控制器
 @param data 参数
 */
- (void)handleParamDataWithTargetVc:(UIViewController *)targetVc
                               data:(NSDictionary *)data
{
    [data enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        @try {
            [targetVc setValue:obj forKey:key];
        } @catch(NSException *e){
            LWLog(@"参数处理异常：%@",e);
        }
    }];
}

/**
 获取当前的控制器

 @return 返回当前控制器
 */
- (UIViewController *)getCurrentViewController
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for (UIWindow *w in windows) {
            if (w.windowLevel == UIWindowLevelNormal) {
                window = w;
                break;
            }
        }
    }
    UIViewController *res = window.rootViewController;
    while (res.presentedViewController) {
        res = res.presentedViewController;
    }
    if ([res isKindOfClass:[UITabBarController class]]) {
        res = [(UITabBarController *)res selectedViewController];
    }
    if ([res isKindOfClass:[UINavigationController class]]) {
        res = [(UINavigationController *)res visibleViewController];
    }
    return res;
}
@end
