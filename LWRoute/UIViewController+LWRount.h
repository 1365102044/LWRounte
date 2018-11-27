//
//  UIViewController+LWRount.h
//  HaoYu
//
//  Created by 刘文强 on 2018/11/26.
//  Copyright © 2018年 LWQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (LWRoute)

/**
 注册控制器
 
 @param path 控制器标识 为空时，不操作
 */
+ (void)lw_registerPath:(NSString *)path;

- (BOOL)lw_push:(UIViewController *)vc data:(NSDictionary *)data;
- (BOOL)lw_present:(UIViewController *)vc data:(NSDictionary *)data;

- (BOOL)lw_push:(UIViewController *)vc;
- (BOOL)lw_present:(UIViewController *)vc;

- (BOOL)lw_pushWithClassName:(NSString *)className data:(NSDictionary *)data;
- (BOOL)lw_presentWithClassName:(NSString *)className data:(NSDictionary *)data;

- (BOOL)lw_pushWithClassName:(NSString *)className;
- (BOOL)lw_presentWithClassName:(NSString *)className;
@end
