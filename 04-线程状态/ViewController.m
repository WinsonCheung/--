//
//  ViewController.m
//  04-线程状态
//
//  Created by winson on 2018/8/2.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 当线程结束后，不能再次使用
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 新建状态
    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(demo) object:nil];
    
    // 线程的名字
    thread1.name = @"p1";
    
    // 线程的优先级
    thread1.threadPriority = 1.0;
    
    // 就绪状态
    [thread1 start];
    
    // 新建状态
    NSThread *thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(demo) object:nil];
    thread2.name = @"p2";
    
    thread2.threadPriority = 0;
    
    // 就绪状态
    [thread2 start];
}


// 线程执行完成之后会自动销毁
- (void)demo {
    
    for (int i = 0; i < 20; ++i) {
        NSLog(@"%d--%@",i,[NSThread currentThread].name);
        
        // 判断当前线程是否是主线程
        if ([NSThread isMainThread]) {
            int m = 0;
            
            int n = 5 / m;
        }
        
//        if (i == 5) {
//            // 阻塞状态
//            [NSThread sleepForTimeInterval:3];
//        }
//        if (i == 10) {
//
//            // 线程退出 死亡状态
//            [NSThread exit];
//        }
    }
}


@end
