//
//  NSString+YMExtension.h
//  YMKit
//
//  Created by 白晗 on 2020/10/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, YMTimestampType) {
    YMTimestampTypeSecond = 0,  //!< 秒
    YMTimestampTypeMillisecond  //!< 毫秒
};


@interface NSString (YMExtension)
+ (NSString *)ym_getCurrentTimestampWithType:(YMTimestampType)type;
@end

NS_ASSUME_NONNULL_END
