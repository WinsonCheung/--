//
//  ViewController.m
//  15-主队列
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
    
    [self demo2];
}

// 1. 主队列，异步执行   ----- 主线程，顺序执行
/*
 主队列特点：先执行完主线程上的代码，才会执行主队列中的任务
 */
- (void)demo1 {
    
    for (int i = 0; i < 10; ++i) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"hello  %d  %@", i, [NSThread currentThread]);
        });
    }
    
}
// 2. 主队列，同步执行
/*
 同步执行：会等着第一个任务执行完成，才会继续往后执行
 */
- (void) demo2 {
    
    NSLog(@"begin");
    
    for (int i = 0; i < 10; ++i) {
        // 死锁
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"hello  %d  %@", i, [NSThread currentThread]);
        });
    }
    
    NSLog(@"end");
}

- (void)demo4 {
    
    /*
     iOS7 之后推荐使用服务质量
     * It is recommended to use quality of service class values to identify the
     * well-known global concurrent queues:
     *  - QOS_CLASS_USER_INTERACTIVE
     *  - QOS_CLASS_USER_INITIATED
     *  - QOS_CLASS_DEFAULT
     *  - QOS_CLASS_UTILITY
     *  - QOS_CLASS_BACKGROUND
     *
     
     iOS7以前，队列的优先级，队列的优先级和服务质量是对应关系
     * The global concurrent queues may still be identified by their priority,
     * which map to the following QOS classes:
     *  - DISPATCH_QUEUE_PRIORITY_HIGH:         QOS_CLASS_USER_INITIATED
     *  - DISPATCH_QUEUE_PRIORITY_DEFAULT:      QOS_CLASS_DEFAULT
     *  - DISPATCH_QUEUE_PRIORITY_LOW:          QOS_CLASS_UTILITY
     *  - DISPATCH_QUEUE_PRIORITY_BACKGROUND:   QOS_CLASS_BACKGROUND*/
    
    // 全局队列 执行的效果跟并行队列是一样的，本质就是并行队列
    dispatch_queue_t golbalQueue = dispatch_get_global_queue(0, 0);
}

@end
