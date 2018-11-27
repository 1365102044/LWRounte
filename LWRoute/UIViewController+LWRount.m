//
//  UIViewController+LWRount.m
//  HaoYu
//
//  Created by 刘文强 on 2018/11/26.
//  Copyright © 2018年 LWQ. All rights reserved.
//

#import "UIViewController+LWRount.h"
#import "LWRouteHeader.h"
@implementation UIViewController (LWRoute)

/**
 注册控制器

 @param path 控制器标识 为空时，不操作
 */
+ (void)lw_registerPath:(NSString *)path
{
    if (path) {
        [[LWRouteURLPathRegister share].registerDict setObject:NSStringFromClass([self class]) forKey:path];
    }
}

- (BOOL)lw_push:(UIViewController *)vc data:(NSDictionary *)data
{
    return [[LWRouteManager shareInstance] pushWithTargetVc:vc fromVc:self data:data];
}

- (BOOL)lw_present:(UIViewController *)vc data:(NSDictionary *)data
{
    return [[LWRouteManager shareInstance] presentWithTarget:vc fromVc:self data:data];
}

- (BOOL)lw_push:(UIViewController *)vc
{
    return [self lw_push:vc data:nil];
}

- (BOOL)lw_present:(UIViewController *)vc
{
    return [self lw_present:vc data:nil];
}

- (BOOL)lw_pushWithClassName:(NSString *)className data:(NSDictionary *)data
{
    return [[LWRouteManager shareInstance] pushWithTargetVcName:className fromVc:self data:data];
}

- (BOOL)lw_presentWithClassName:(NSString *)className data:(NSDictionary *)data
{
    return [[LWRouteManager shareInstance] presentWithTargetVcName:className fromVc:self data:data];
}

- (BOOL)lw_pushWithClassName:(NSString *)className
{
    return [self lw_pushWithClassName:className data:nil];
}

- (BOOL)lw_presentWithClassName:(NSString *)className
{
    return  [self lw_presentWithClassName:className data:nil];
}

@end
