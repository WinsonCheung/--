//
//  ViewController.m
//  05-多线程操作共享资源的问题
//
//  Created by winson on 2018/8/2.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) int ticketCount;

@property (nonatomic, strong) NSObject *obj;

// 原子属性是线程安全的，自旋锁
@property (nonatomic, copy) NSString *name;

@end

@implementation ViewController


// 为属性生成对应的成员变量
@synthesize name = _name;
/*
 当同时重写属性的setter和getter方法，不会自动生成_name 成员变量
 */

// 模拟原子属性
-(void)setName:(NSString *)name {
    @synchronized(self) {
        _name = name;
    }
}

- (NSString *)name {
    return _name;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.ticketCount = 10;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 模拟卖票窗口1
    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(sellTickets) object:nil];
    [thread1 start];
    
    // 模拟卖票窗口2
    NSThread *thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(sellTickets) object:nil];
    [thread2 start];
}

// 线程是不安全的
- (void)sellTickets {
    
    while (YES) {
        
        // 模拟耗时操作
        [NSThread sleepForTimeInterval:1];
        
        // 任意一个对象每部都有一把锁
        
        /*
         互斥锁
         加锁会影响程序的性能
         */
        // 线程同步
        @synchronized(self) {
            
            // 判断还有没有票
            if (self.ticketCount > 0) {
                self.ticketCount = self.ticketCount - 1;
                NSLog(@"剩余%d张票", self.ticketCount);
            } else {
                NSLog(@"来晚了，票没了");
                break;
            }
        }
    }
}

@end
