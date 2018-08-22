//
//  ViewController.m
//  16-同步任务
//
//  Created by winson on 2018/8/6.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // appStore 下载应用-输入密码-扣费-下载应用
    // 创建并发的队列（全局队列）
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        dispatch_sync(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"输入密码 %@", [NSThread currentThread]);
        });
        dispatch_sync(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"扣费 %@", [NSThread currentThread]);
        });
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"下载应用 %@", [NSThread currentThread]);
        });
        
    });
    
    
}

@end
