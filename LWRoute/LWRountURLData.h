//
//  LWRountURLData.h
//  HaoYu
//
//  Created by 刘文强 on 2018/11/27.
//  Copyright © 2018年 LWQ. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger ,LWRountType) {
    LWRountTypeOpenPage,        //打开页面
    LWRountTypeAction       //方法
};
@interface LWRountURLData : NSObject

/**
 原始URL
 */
@property (nonatomic, strong) NSURL * URL;

/**
 路由的类型
 */
@property (nonatomic, assign) LWRountType  rountType;

/**
 页面名
 */
@property (nonatomic, strong) NSString * controllerName;

/**
 方法名
 */
@property (nonatomic, strong) NSString * actionName;

/**
 参数
 */
@property (nonatomic, strong) NSDictionary * data;

+ (instancetype)urlDataWithUrl:(NSURL *)url;

@end
