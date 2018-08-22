//
//  ViewController.m
//  19-调度组
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
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 下载三首歌曲，当歌曲都下载完毕，通知用户
    [self demo2];
    
}

// 调度组内部原理
- (void)demo2 {
    // 创建组
    dispatch_group_t group = dispatch_group_create();
    
    // 创建队列 并发
    dispatch_queue_t queue = dispatch_queue_create("hm", DISPATCH_QUEUE_CONCURRENT);
    
    // 任务一
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        
        NSLog(@"任务一");
        dispatch_group_leave(group);
    });
    // 任务二
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        
        NSLog(@"任务二");
        dispatch_group_leave(group);
    });
    // 任务三
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        
        NSLog(@"任务三");
        dispatch_group_leave(group);
    });
    
    // 等待组中的任务都执行完毕，才会执行
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
         NSLog(@"over");
    });
    
    // 等待组中的任务都执行完毕，才会继续执行后续的代码
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    NSLog(@"hello");
}

// 演示调度组的使用
- (void)demo1 {
    // 创建组
    dispatch_group_t group = dispatch_group_create();
    
    // 创建队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    // 下载第一手歌曲
    dispatch_group_async(group, queue, ^{
        
        NSLog(@"正在下载第一首歌曲 %@", [NSThread currentThread]);
    });
    // 下载第二手歌曲
    dispatch_group_async(group, queue, ^{
        
        NSLog(@"正在下载第二首歌曲 %@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:2];
    });
    // 下载第三手歌曲
    dispatch_group_async(group, queue, ^{
        
        NSLog(@"正在下载第三首歌曲 %@", [NSThread currentThread]);
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
         NSLog(@"over %@", [NSThread currentThread]);
    });
}

@end
