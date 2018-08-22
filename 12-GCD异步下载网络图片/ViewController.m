//
//  ViewController.m
//  12-GCD异步下载网络图片
//
//  Created by winson on 2018/8/3.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ViewController

-(void)loadView {
    // 初始化 scrollView
    self.scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    self.view = self.scrollView;
    
    // 初始化 imageView
    self.imageView = [[UIImageView alloc] init];
    
    [self.scrollView addSubview:self.imageView];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_async(dispatch_queue_create(0, 0), ^{
        
        // 图片的地址
        NSURL *url = [NSURL URLWithString:@"http://img04.tooopen.com/images/20130513/tooopen_15574232.jpg"];
        
        // 下载图片
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        // 把 nsdata 转换成 image
        UIImage *image = [UIImage imageWithData:data];
        
        // 回到主线程更新 UI
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            self.imageView.image = image;
            
            [self.imageView sizeToFit];
            
            self.scrollView.contentSize = image.size;
            
        });
        
    });
}
- (IBAction)suspend:(id)sender {
}

@end
