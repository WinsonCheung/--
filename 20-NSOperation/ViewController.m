//
//  ViewController.m
//  20-NSOperation
//
//  Created by winson on 2018/8/14.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 抽象类 没有实现的类 用作父类 用来约束子类
    // NSOperation
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    /*
    // 创建操作
    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(demo) object:nil];
    
    // start 方法更新操作的状态，调动main方法
    
    [op start]; // 不开启新线程
    [op start];
    [op start];
    
    */
    
    // 创建操作
    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(demo) object:nil];
    // 创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    // 把操作添加到队列中
    [queue addOperation:op];
    
}


- (void) demo {
    NSLog(@"hello %@", [NSThread currentThread]);
}
@end
