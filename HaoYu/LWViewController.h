//
//  LWViewController.h
//  HaoYu
//
//  Created by 刘文强 on 2018/11/26.
//  Copyright © 2018年 LWQ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^lwblock)(NSString *age);
@interface LWViewController : UIViewController
@property (nonatomic, strong) NSString * lwname;
@property (nonatomic, copy) lwblock block;
- (void)handle:(NSString *)name;
@end
