//
//  LWRountConfig.m
//  HaoYu
//
//  Created by 刘文强 on 2018/11/27.
//  Copyright © 2018年 LWQ. All rights reserved.
//

#import "LWRouteConfig.h"

@implementation LWRouteConfig

+ (instancetype)share
{
    static LWRouteConfig *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [LWRouteConfig new];
    });
    return instance;
}

- (NSString *)actionHost
{
    if (!_actionHost) {
        _actionHost = @"action";
    }
    return _actionHost;
}

- (NSString *)openPageHost
{
    if (!_openPageHost) {
        _openPageHost = @"open";
    }
    return _openPageHost;
}

@end
