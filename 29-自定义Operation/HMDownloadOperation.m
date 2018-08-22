//
//  HMDownloadOperation.m
//  29-自定义Operation
//
//  Created by winson on 2018/8/22.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "HMDownloadOperation.h"

@implementation HMDownloadOperation

+ (instancetype)downloadOperationWithUrlString:(NSString *)urlString finishedBlock:(void(^)(UIImage *img))finishedBlock {
    HMDownloadOperation *op = [[HMDownloadOperation alloc] init];
    
    op.urlString = urlString;
    op.finishedBlock = finishedBlock;
    
    return op;
}

- (void)main {
    @autoreleasepool {
        
        // 断言
        NSAssert(self.finishedBlock != nil, @"finishedBlock 不能为 nil");
        
        // 模拟网络延时
        [NSThread sleepForTimeInterval:2];
        
        // 取消正在执行的操作
        if (self.isCancelled) {
            return;
        }
        
        NSLog(@"下载图片 %@ %@", self.urlString, [NSThread currentThread]);
        
        // UIImage
        
        // 假设图片下载完成
        // 回到主线程更新 UI
        
        if (self.finishedBlock) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                self.finishedBlock(nil);
            }];
        }
    }
}

@end
