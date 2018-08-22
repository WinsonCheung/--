//
//  ViewController.m
//  24-摇奖机
//
//  Created by winson on 2018/8/15.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
// 全局队列
@property (nonatomic, strong) NSOperationQueue *queue;

@property (weak, nonatomic) IBOutlet UILabel *lbl1;
@property (weak, nonatomic) IBOutlet UILabel *lbl2;
@property (weak, nonatomic) IBOutlet UILabel *lbl3;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

@end

@implementation ViewController

// 懒加载
-(NSOperationQueue *)queue {
    if (!_queue) {
        _queue  = [[NSOperationQueue alloc] init];
    }
    return _queue;
}

// 点击开始执行
-(IBAction)start:(UIButton *)sender {
    
    // 当队列中有操作的时候 不添加操作
    if (!self.queue.operationCount) {
        
        [self random];
        [self.startButton setTitle:@"暂停" forState:(UIControlStateNormal)];
        self.queue.suspended = NO;
        
    } else if(!self.queue.isSuspended) {
        
        // 正在执行的时候，暂停
        // 先把当前的操作执行完毕，暂停后续的操作
        self.queue.suspended = YES;
        [self.startButton setTitle:@"继续" forState:(UIControlStateNormal)];
    }
}


// 随机生成三个数字， 显示到label上
- (void)random {
    
    [self.queue addOperationWithBlock:^{
        
        while (!self.queue.isSuspended) {
        
            [NSThread sleepForTimeInterval:0.1];
            
            // 生成随机数 [0,10) 0~9
            int num1 = arc4random_uniform(10);
            int num2 = arc4random_uniform(10);
            int num3 = arc4random_uniform(10);
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                // 给label 赋值
                self.lbl1.text = [NSString stringWithFormat:@"%d",num1];
                self.lbl2.text = [NSString stringWithFormat:@"%d",num2];
                self.lbl3.text = [NSString stringWithFormat:@"%d",num3];
            }];
        }
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"队列中的操作数 %zd", self.queue.operationCount);
}

@end
