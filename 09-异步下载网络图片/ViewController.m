//
//  ViewController.m
//  09-异步下载网络图片
//
//  Created by winson on 2018/8/2.
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
    
    
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(downloadImage) object:nil];
    [thread start];
}

- (void)downloadImage{
    // 图片的地址
    NSURL *url = [NSURL URLWithString:@"http://img04.tooopen.com/images/20130513/tooopen_15574232.jpg"];
    
    // 下载图片
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    // 把 nsdata 转换成 image
    UIImage *image = [UIImage imageWithData:data];
    // waitUntilDone: 之是 YES 会等待updateUI 方法执行完毕，才会执行后续代码
    [self performSelectorOnMainThread:@selector(updateUI:) withObject:image waitUntilDone:YES];
}
- (IBAction)cancel:(id)sender {
}

- (void)updateUI:(UIImage *)image {
    
    self.imageView.image = image;
    
    // 让imageView的大小和图片的大小一致
    [self.imageView sizeToFit];
    
    // 设置scrollView滚动范围
    self.scrollView.contentSize = image.size;
}

@end
