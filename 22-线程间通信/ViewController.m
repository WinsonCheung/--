//
//  ViewController.m
//  22-线程间通信
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
- (NSOperationQueue *)queue {
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
    }
    return _queue;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.queue addOperationWithBlock:^{
        // 异步下载图片
        NSLog(@"异步下载图片");
        
        // 获取当前队列
        [NSOperationQueue currentQueue];
        
        // 线程间通信，回到主线程 更新 UI
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            NSLog(@"主线程 更新 UI");
        }];
    }];
    
}


@end
