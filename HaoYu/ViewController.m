//
//  ViewController.m
//  HaoYu
//
//  Created by 刘文强 on 2018/11/26.
//  Copyright © 2018年 LWQ. All rights reserved.
//

#import "ViewController.h"
#import "LWRouteHeader.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    id block = ^(NSString *name){
        NSLog(@"**********%@",name);
    };
//    [self lw_present:tem data:@{@"lwname":@"lw1",@"block":block}];
    
    [self lw_presentWithClassName:@"lwde" data:@{@"lwname":@"lw1",@"block":block}];
//    [self lw_presentWithClassName:@"LWViewController" data:@{@"lwname":@"lw1",@"block":block}];
    
//    [LWRouteManager.shareInstance appActionWithUrl:[NSURL URLWithString:@"LWRounte://open/lwde?lwname=lwq&block=block"]];
//    [LWRouteManager.shareInstance appActionWithUrl:[NSURL URLWithString:@"LWRount://action/handle?lwname=sss"]];
    
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"LWRounte://open/lwde?lwname=lwq&block=block"] options:@{} completionHandler:^(BOOL success) {}];
}

@end
