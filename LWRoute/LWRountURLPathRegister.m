//
//  LWRountURLPathRegister.m
//  HaoYu
//
//  Created by 刘文强 on 2018/11/26.
//  Copyright © 2018年 LWQ. All rights reserved.
//

#import "LWRountURLPathRegister.h"

@implementation LWRountURLPathRegister

+ (instancetype)share
{
    static LWRountURLPathRegister *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LWRountURLPathRegister alloc] init];
    });
    return instance;
}


/**
 注册类路径

 @param className 类名
 @param path 访问标识
 */
- (void)registerClass:(NSString *)className path:(NSString *)path
{
    NSAssert(className, @"注册类名不能为空");
    NSAssert(path, @"注册的路径不能为空");
    [self.registerDict setObject:className forKey:path];
}


/**
 移出注册的类

 @param className 类名
 */
- (void)removeRigsterWithClassName:(NSString *)className
{
    if (!className) {
        return;
    }
    __block NSString *remveKey = nil;
    [self.registerDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isEqualToString:className]) {
            remveKey = key;
            *stop = YES;
        }
    }];
    if (remveKey) {
        [self.registerDict removeObjectForKey:remveKey];
    }
}

- (NSMutableDictionary *)registerDict
{
    if (!_registerDict) {
        _registerDict = [[NSMutableDictionary alloc] init];
    }
    return _registerDict;
}
@end
