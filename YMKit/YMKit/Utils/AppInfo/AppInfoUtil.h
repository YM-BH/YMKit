//
//  AppInfoUtil.h
//  YMKit
//
//  Created by 白晗 on 2021/9/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppInfoUtil : NSObject

/// 获取 KeyWindow
+ (UIWindow *)getKeyWindow;

/// 是否为 iPad
+ (BOOL)isIpad;

/// 是否为模拟器
+ (BOOL)isSimulator;

/// 获取手机型号
+ (NSString *)iPhoneType;

@end

NS_ASSUME_NONNULL_END
