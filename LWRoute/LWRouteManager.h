//
//  LWRouteManager.h
//  HaoYu
//
//  Created by 刘文强 on 2018/11/26.
//  Copyright © 2018年 LWQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LWRouteManager : NSObject

+ (instancetype)shareInstance;

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
                actionBlock:(void (^)(NSString *actionName,NSDictionary *data))actionBlock;

/**
 处理app间的通信、跳转等事件 可以打开appe内所有controller
 
 @param url URL
 @return return value description
 */
- (BOOL)appActionWithUrl:(NSURL *)url;

/**
 通过控制器跳转 push
 
 @param targetVc 目标控制器
 @param fromVc 来源控制器
 @param data 参数字典
 @return 成功YES；失败NO
 */
- (BOOL)pushWithTargetVc:(UIViewController *)targetVc
                  fromVc:(UIViewController *)fromVc
                    data:(NSDictionary *)data;
/**
 通过控制器跳转 present
 
 @param targetVc 目标控制器
 @param fromVc 来源控制器
 @param data 参数字典
 @return 成功YES；失败NO
 */
- (BOOL)presentWithTarget:(UIViewController *)targetVc
                   fromVc:(UIViewController *)fromVc
                     data:(NSDictionary *)data;

/**
 通过类名跳转 push
 
 @param targetVcName 目标控制器注册的标识
 @param fromVc 来源控制器
 @param data 参数字典
 @return 成功YES；失败NO
 */
- (BOOL)pushWithTargetVcName:(NSString *)targetVcName
                      fromVc:(UIViewController *)fromVc
                        data:(NSDictionary *)data;

/**
 通过类名跳转 present
 
 @param targetVcName 目标控制器注册的标识
 @param fromVc 来源控制器
 @param data 参数字典
 @return 成功YES；失败NO
 */
- (BOOL)presentWithTargetVcName:(NSString *)targetVcName
                         fromVc:(UIViewController *)fromVc
                           data:(NSDictionary *)data;
@end
