//
//  LWRountURLPathRegister.h
//  HaoYu
//
//  Created by 刘文强 on 2018/11/26.
//  Copyright © 2018年 LWQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LWRountURLPathRegister : NSObject

+ (instancetype)share;

/**
 注册的类字典
 */
@property (nonatomic, strong) NSMutableDictionary * registerDict;

/**
 注册类路径
 
 @param className 类名
 @param path 访问标识
 */
- (void)registerClass:(NSString *)className path:(NSString *)path;

/**
 移出注册的类
 
 @param className 类名
 */
- (void)removeRigsterWithClassName:(NSString *)className;
@end
