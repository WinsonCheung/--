//
//  ViewController.m
//  03-NSThread
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

    // 方式一
//    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(demo) object:nil];
//    [thread start];
    
    // 方式二
//    [NSThread detachNewThreadSelector:@selector(demo) toTarget:self withObject:nil];
    
    // 方式三
//    [self performSelectorInBackground:@selector(demo) withObject:nil];
    
    // 方式四 参数
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(demo:) object:@"winson"];
    [thread start];
    
}

- (void)demo:(NSString *)name {
    NSLog(@" Hello %@ %@", name, [NSThread currentThread]);
}

@end
