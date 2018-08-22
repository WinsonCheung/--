//
//  HMDownloadOperation.h
//  29-自定义Operation
//
//  Created by winson on 2018/8/22.
//  Copyright © 2018年 winson. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 自定义操作：
 1. 创建一个类继承自 NSOperation
 2. 重写 main 方法，自动释放池
 3. 定义属性接收参数，类方法快速初始化自定义操作
 4. 取消操作 （取消正在执行的操作）
 5. 断言操作
 */

@interface HMDownloadOperation : NSOperation


/**
 要下载的图片的地址
 */
@property (nonatomic, copy) NSString *urlString;

/**
 执行完成后，回调的block
 */
@property (nonatomic, copy) void(^finishedBlock)(UIImage *img);

+ (instancetype)downloadOperationWithUrlString:(NSString *)urlString finishedBlock:(void(^)(UIImage *img))finishedBlock;

@end
