//
//  ViewController.m
//  21-NSBlockOperation
//
//  Created by winson on 2018/8/14.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
// 全局队列
@property (nonatomic, strong) NSOperationQueue *queue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSOperationQueue *)queue {
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
    }
    return _queue;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self demo5];
}

// 演示 start
- (void)demo1 {
    // 创建操作
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"hello %@", [NSThread currentThread]);
    }];
    
    // 更新 op 的状态 执行 main 方法 不会开启新线程
    [op start];
}
// 把操作添加到队列
- (void)demo2 {
    // 创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    // 创建操作
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"hello %@", [NSThread currentThread]);
    }];
    // 把操作添加到队列中
    [queue addOperation:op];
}
//
- (void)demo3 {
    // 创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    // 将操作block 添加到queue中
    [queue addOperationWithBlock:^{
        NSLog(@"hello %@", [NSThread currentThread]);
    }];
}
// 全局队列
- (void)demo4 {
    
    // 并发队列 异步执行
    for (int i = 0; i < 10; ++i) {
        [self.queue addOperationWithBlock:^{
            NSLog(@"hello %d %@", i, [NSThread currentThread]);
        }];
    }
}

// 操作的 completionBlock
- (void)demo5 {
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        // [NSThread sleepForTimeInterval:2];
        NSLog(@"hello %@", [NSThread currentThread]);
    }];
    // 操作完成之后执行
    [op setCompletionBlock:^{
        NSLog(@"end %@", [NSThread currentThread]);
    }];
    [self.queue addOperation:op];
}

@end
