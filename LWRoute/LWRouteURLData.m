//
//  LWRountURLData.m
//  HaoYu
//
//  Created by 刘文强 on 2018/11/27.
//  Copyright © 2018年 LWQ. All rights reserved.
//

#import "LWRouteURLData.h"
#import "LWRouteHeader.h"

@implementation LWRouteURLData
+ (instancetype)urlDataWithUrl:(NSURL *)url
{
    LWRouteURLData *u = [[LWRouteURLData alloc] init];
    u.URL = url;
    return u;
}

-(NSURL *)URL
{
    if (!_URL) {
        _URL = [NSURL URLWithString:@"app://"];
    }
    return _URL;
}

- (LWRountType)rountType
{
    if (self.URL.host && [LWRouteConfig.share.actionHost isEqualToString:self.URL.host]) {
        return LWRountTypeAction;
    }
    return LWRountTypeOpenPage;
}

-(NSString *)actionName
{
    if (self.rountType == LWRountTypeAction) {
        return self.URL.path.length > 0 ? [self.URL.path substringFromIndex:1] : @"";
    }
    return nil;
}

- (NSString *)controllerName
{
    if (self.rountType == LWRountTypeOpenPage) {
        return self.URL.path.length > 0 ? [self.URL.path substringFromIndex:1] : @"";
    }
    return nil;
}

- (NSDictionary *)data
{
    NSString *dataStr = [NSString stringWithFormat:@"%@",self.URL.query];
    NSArray *keyValues = [dataStr componentsSeparatedByString:@"&"];
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc] init];
    [keyValues enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj containsString:@"="]) {
            NSArray *key_value = [obj componentsSeparatedByString:@"="];
            [dataDict setObject:key_value.lastObject forKey:key_value.firstObject];
        }
    }];
    return dataDict;
}

@end
