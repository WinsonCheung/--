//
//  ViewController.m
//  18-延迟执行和一次性执行
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
    
    // 延迟执行
    /*
     dispatch_time_t when,          延迟多长时间 默认精度到纳秒
     dispatch_queue_t queue,        队列
     dispatch_block_t block,        任务
     */
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSLog(@"task");
//    });
    
    
    
    // 一次性执行
//    for (int i = 0; i < 20000; ++i) {
//
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            NSLog(@"hello %@",[NSThread currentThread]);
//        });
//    }
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        // 一次性执行 只在当前线程上执行
        /*
         一次性执行的原理，判断静态的全局变量的值，默认是0，如果执行完成后，设置为-1
         once内部会判断变量的值，如果是0才执行
         */
        static dispatch_once_t onceToken;
        
        NSLog(@"%zd", onceToken);
        dispatch_once(&onceToken, ^{
            NSLog(@"hello %@",[NSThread currentThread]);
        });
        NSLog(@"%zd", onceToken);
    });
    
    
}



@end
