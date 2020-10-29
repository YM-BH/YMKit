//
//  NSString+YMExtension.m
//  YMKit
//
//  Created by 白晗 on 2020/10/27.
//

#import "NSString+YMExtension.h"

@implementation NSString (YMExtension)

+ (NSString *)ym_getCurrentTimestampWithType:(YMTimestampType)type {
    // 获取当前时间
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
    if (type == YMTimestampTypeMillisecond) {
        timeInterval *= 1000;
    }
    return  [NSString stringWithFormat:@"%.0f", timeInterval];
}

@end
