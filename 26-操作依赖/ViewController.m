//
//  ViewController.m
//  26-操作依赖
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

    // 下载 - 解压 - 升级完成
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"下载......");
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"解压......");
        [NSThread sleepForTimeInterval:2];
    }];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"升级完成!!!");
    }];
    
    // 添加依赖
    [op2 addDependency:op1];
    [op3 addDependency:op2];
    
    
    // 错误，会发生循环依赖 什么都不执行
//    [op1 addDependency:op3];
    
    // 依赖关系可跨队列执行
    [self.queue addOperations:@[op1,op2,op3] waitUntilFinished:NO];
}


@end
