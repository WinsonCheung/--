//
//  ViewController.m
//  25-操作的优先级
//
//  Created by winson on 2018/8/15.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// 全局队列
@property (nonatomic, strong) NSOperationQueue *queue;

@end


@implementation ViewController

// 懒加载
-(NSOperationQueue *)queue {
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
        
        // 设置最大并发数，（并不是线程数）（同一时间 执行的任务数）
        _queue.maxConcurrentOperationCount = 2;
    }
    return _queue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 操作1
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i < 10; ++i) {
            NSLog(@"op1 %d",i);
        }
    }];
    
    // 设置优先级最高
    op1.qualityOfService = NSQualityOfServiceUserInteractive;
    
    // 执行在子线程上
    [op1 setCompletionBlock:^{
        
        NSLog(@"======= op1 操作执行完毕   ======= %@",[NSThread currentThread]);
    }];
    
    [self.queue addOperation:op1];
    
    // 操作1
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i < 10; ++i) {
            NSLog(@"op2 %d",i);
        }
    }];

    // 设置优先级最低
    op2.qualityOfService = NSQualityOfServiceUserInitiated;
    
    [op2 setCompletionBlock:^{
        
        NSLog(@"======= op2 操作执行完毕   ======= %@",[NSThread currentThread]);
    }];
    
    [self.queue addOperation:op2];

}

@end
