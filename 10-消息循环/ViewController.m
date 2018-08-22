//
//  ViewController.m
//  10-消息循环
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

    // 定时器
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(demo) userInfo:nil repeats:YES];
    // 把定时器添加到当前消息循环中
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    /*
     消息循环是在一个指定的模式下运行的，默认的模式是NSDefaultRunLoopMode，设置的输入时间也需要指定一个模式，消息循环的模式必须和输入时间的模式匹配才会执行
     
     UITrackingRunLoopMode 当滚动scrollView的时候，消息循环的模式自动改变成这种模式
     */
}


- (void)demo {
    // 输入当前消息循环的模式
    NSLog(@"hello %@", [NSRunLoop currentRunLoop].currentMode);
}

@end
