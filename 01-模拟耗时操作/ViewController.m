//
//  ViewController.m
//  01-模拟耗时操作
//
//  Created by winson on 2018/8/1.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     1. 循环的速度非常快
     2. 操作内存的栈空间，速度非常快
     3. 操作内存的堆空间，速度有点慢
     4. 循环非常消耗 CPU 资源
     5. I/O 操作，速度非常慢
     */
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self demo];
}

// 模拟耗时操作
- (void)demo {
    NSLog(@"begin");
    for (int i = 0; i < 1000000; ++i) {
        // int n =  i;
        // NSString *str = @"hello";
        // NSString *str = [NSString stringWithFormat:@"%d",i];
        NSLog(@"%d", i);
    }
    NSLog(@"end");
}

@end
