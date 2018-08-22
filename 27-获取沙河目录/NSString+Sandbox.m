//
//  NSString+Sandbox.m
//  27-获取沙河目录
//
//  Created by winson on 2018/8/21.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "NSString+Sandbox.h"

@implementation NSString (Sandbox)
- (instancetype)appendCache {
    return [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:[self lastPathComponent]];
}
- (instancetype)appendTemp {
    return [NSTemporaryDirectory() stringByAppendingPathComponent:[self lastPathComponent]];
}
- (instancetype)appendDocument{
    
    return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:[self lastPathComponent]];
}

@end
