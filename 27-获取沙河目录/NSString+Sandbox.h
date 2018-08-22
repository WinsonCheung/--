//
//  NSString+Sandbox.h
//  27-获取沙河目录
//
//  Created by winson on 2018/8/21.
//  Copyright © 2018年 winson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Sandbox)
- (instancetype)appendCache;
- (instancetype)appendTemp;
- (instancetype)appendDocument;
@end
