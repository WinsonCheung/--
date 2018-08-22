//
//  ViewController.m
//  29-自定义Operation
//
//  Created by winson on 2018/8/22.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"
#import "HMDownloadOperation.h"

@interface ViewController ()

/**
 全局队列
 */
@property (nonatomic, strong) NSOperationQueue *queue;

@end

@implementation ViewController

/**
 懒加载
 */
-(NSOperationQueue *)queue {
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
        _queue.maxConcurrentOperationCount = 2;
    }
    return _queue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 0; i < 20; ++i) {
        
        HMDownloadOperation *op = [HMDownloadOperation downloadOperationWithUrlString:@"xxx.jpg" finishedBlock:^(UIImage *img) {
            
            // 图片下载完成 更新 UI
            NSLog(@"更新 UI: %d %@ %@",i, op.urlString, [NSThread currentThread]);
        }];
        [self.queue addOperation:op];
    }
    
    
    // 演示断言
//    HMDownloadOperation *op = [HMDownloadOperation downloadOperationWithUrlString:@"xxx.jpg" finishedBlock:nil];
    
    // 自定义操作
//    HMDownloadOperation *op = [HMDownloadOperation downloadOperationWithUrlString:@"xxx.jpg" finishedBlock:^(UIImage *img) {
//
//        // 图片下载完成 更新 UI
//        NSLog(@"给控件赋值:%@ %@",op.urlString,[NSThread currentThread]);
//    }];
    
    
//    op.urlString = @"xxx.jpg";
    
    // 无法传递参数
//    [op setCompletionBlock:^{
//        NSLog(@"给控件赋值");
//    }];
    
//    [op setFinishedBlock:^(UIImage *img) {
//        NSLog(@"给控件赋值:%@",img);
//    }];
    
//    [self.queue addOperation:op];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 设置所有操作的 cancel 属性 设为 yes
    [self.queue cancelAllOperations];
    NSLog(@"取消操作");
}


@end
