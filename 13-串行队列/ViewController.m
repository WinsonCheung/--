//
//  ViewController.m
//  13-串行队列
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

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self demo2];
}


// 串行队列，同步执行, 不开新线程，任务是顺序执行
- (void)demo1 {
    /*
     DISPATCH_QUEUE_SERIAL : 串行
     DISPATCH_QUEUE_CONCURRENT : 并发
     */
    dispatch_queue_t queue = dispatch_queue_create("hm", DISPATCH_QUEUE_SERIAL);
    
    for (int i = 0; i < 10; ++i) {
        dispatch_sync(queue, ^{
            NSLog(@"hello %@ %d", [NSThread currentThread] , i);
        });
    }
}

// 串行队列，异步执行, 会开启新线程（1个），任务是有序执行
- (void)demo2 {
    
    dispatch_queue_t queue = dispatch_queue_create("hm", DISPATCH_QUEUE_SERIAL);
    
    for (int i = 0; i < 10; ++i) {
        dispatch_async(queue, ^{
            NSLog(@"hello %@ %d", [NSThread currentThread] , i);
        });
    }
    
}

@end
