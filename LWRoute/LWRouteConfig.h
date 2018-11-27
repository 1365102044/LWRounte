//
//  LWRountConfig.h
//  HaoYu
//
//  Created by 刘文强 on 2018/11/27.
//  Copyright © 2018年 LWQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LWRouteConfig : NSObject

+ (instancetype)share;

/**
 执行方法
 */
@property (nonatomic, strong) NSString * actionHost;

/**
 打开页面的方法
 */
@property (nonatomic, strong) NSString * openPageHost;

@property (nonatomic, strong) NSArray * urlSchems;

@end
