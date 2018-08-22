//
//  ViewController.m
//  17-Barrier
//
//  Created by winson on 2018/8/6.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *photoList;

@end

@implementation ViewController

// 懒加载
- (NSMutableArray *)photoList {
    
    if (!_photoList) {
        _photoList = [NSMutableArray array];
    }
    return _photoList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i = 1; i <= 10; ++i) {
        [self downloadImage:i];
    }

}

// 模拟从网络上下载很多张图片，并且把下载完成的图片天骄到mutableArray中
- (void)downloadImage:(int)index {
    
    // 并发队列
    dispatch_queue_t queue = dispatch_queue_create("hm", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        // 模拟下载图片
        NSString *fileName = [NSString stringWithFormat:@"%d",index];
        UIImage *img = [UIImage imageNamed:fileName];
        
        // 等待队列中所有的任务执行完成，才会执行barrier中的代码
        dispatch_barrier_async(queue, ^{

            [self.photoList addObject:img];
            NSLog(@"保存图片 %@ %@", fileName, [NSThread currentThread]);

        });
//        [self.photoList addObject:img];
        NSLog(@"图片下载完成 %@ %@", fileName, [NSThread currentThread]);
        
    });
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"图片张数 %zd 图片：%@",self.photoList.count, self.photoList);
}

@end
