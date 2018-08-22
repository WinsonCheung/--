//
//  ViewController.m
//  pthread
//
//  Created by winson on 2018/8/2.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"
#import <pthread/pthread.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     学习新函数 或者方法的三要素
     1. 函数的功能
     2. 函数的参数
     3. 函数的返回值
     */
    
    /**
     pthread 线程

     @param pthread_t  _Nullable *restrict _Nonnull            线程编号的地址
     @param const pthread_attr_t *restrict _Nullable           线程的属性
     @param void * _Nullable (* _Nonnull)(void * _Nullable)    线程要执行的函数
     @param void *restrict _Nullable                          要执行函数的参数
     @return int     0 成功      非0失败
     */
   
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    pthread_t pthread;
    
    NSString *name = @"winson";
    
    // __brige 桥接
    /*
     MRC中内存管理原则，谁申请 谁释放
     ARC 中会自动给OC对象，添加retain release autorelease
     把 OC 中的对象，传递给C语言函数，要桥接， 反之亦然
     */
    int result = pthread_create(&pthread, NULL, demo, (__bridge void*)name);
    
    NSLog(@"touchBegan %@", [NSThread currentThread]);
    
    if (result == 0) {
        NSLog(@"success");
    } else {
        NSLog(@"failure");
    }
}

void *demo(void *param) {
    
    NSString *name = (__bridge NSString *)(param);
    NSLog(@"hello %@,%@",name, [NSThread currentThread]);
    return NULL;
}


@end
