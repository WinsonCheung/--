//
//  ViewController.m
//  27-获取沙河目录
//
//  Created by winson on 2018/8/21.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Sandbox.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = @"http://www.baidu.com/images/01.jpg";
    
    NSLog(@"%@", [path appendCache]);

}


@end
