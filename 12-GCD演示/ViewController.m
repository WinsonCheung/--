//
//  ViewController.m
//  12-GCD演示
//
//  Created by winson on 2018/8/3.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    // 1. 创建队列
//    dispatch_queue_t queue = dispatch_queue_create(0, 0);
//    // 2. 创建任务
//    dispatch_block_t task = ^{
//        NSLog(@"hello %@", [NSThread currentThread]);
//    };
//    // 3. 异步执行
//    dispatch_async(queue, task);
    
    // 简化版
    dispatch_async(dispatch_queue_create(0, 0), ^{
        NSLog(@"%@" , [NSThread currentThread]);
    });
}


@end
