//
//  LWRountHeader.h
//  HaoYu
//
//  Created by 刘文强 on 2018/11/26.
//  Copyright © 2018年 LWQ. All rights reserved.
//



#ifndef LWRountHeader_h
#define LWRountHeader_h

# define LWLog(fmt, ...) NSLog((@"\n[类名:%s]\n""[函数名:%s]\n""[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);


#import "LWRountURLPathRegister.h"
#import "LWRouteManager.h"
#import "UIViewController+LWRount.h"
#import "LWRountConfig.h"
#import "LWRountURLData.h"

#endif /* LWRountHeader_h */
