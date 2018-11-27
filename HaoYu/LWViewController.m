//
//  LWViewController.m
//  HaoYu
//
//  Created by 刘文强 on 2018/11/26.
//  Copyright © 2018年 LWQ. All rights reserved.
//

#import "LWViewController.h"
#import "LWRountHeader.h"
@interface LWViewController ()

@end

@implementation LWViewController

- (void)handle:(NSString *)name
{
    NSLog(@"**********%@",name);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    
    NSLog(@"************%@",self.lwname);

}
+ (void)load
{
    [self lw_registerPath:@"lwde"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.block) {    
        self.block(@"23456789");
    }
    
}

@end
