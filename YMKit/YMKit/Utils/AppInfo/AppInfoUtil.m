//
//  AppInfoUtil.m
//  YMKit
//
//  Created by 白晗 on 2021/9/8.
//

#import "AppInfoUtil.h"

#import <sys/utsname.h>

@implementation AppInfoUtil

+ (UIWindow *)getKeyWindow {
    UIWindow *keyWindow = nil;

    if ([[UIApplication sharedApplication].delegate respondsToSelector:@selector(window)]) {
        keyWindow = [[UIApplication sharedApplication].delegate window];
    } else {
        NSArray *windows = [UIApplication sharedApplication].windows;

        for (UIWindow *window in windows) {
            if (!window.isHidden) {
                keyWindow = window;
                break;
            }
        }
    }

    return keyWindow;
}

+ (BOOL)isIpad {
    NSString *deviceType = [UIDevice currentDevice].model;

    if ([deviceType isEqualToString:@"iPad"]) {
        return YES;
    }

    return NO;
}

+ (BOOL)isSimulator {
    NSString *deviceIdentifier = [self deviceIdentifier];

    return [deviceIdentifier isEqualToString:@"x86_64"] || [deviceIdentifier isEqualToString:@"i386"];
}

+ (NSString *)iPhoneType {
    NSString *deviceIdentifier = [self deviceIdentifier];

    // iPhone
    if ([deviceIdentifier isEqualToString:@"iPhone1,1"]) return @"iPhone 1G";
    if ([deviceIdentifier isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([deviceIdentifier isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([deviceIdentifier isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([deviceIdentifier isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([deviceIdentifier isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([deviceIdentifier isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([deviceIdentifier isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if ([deviceIdentifier isEqualToString:@"iPhone5,3"]) return @"iPhone 5C";
    if ([deviceIdentifier isEqualToString:@"iPhone5,4"]) return @"iPhone 5C";
    if ([deviceIdentifier isEqualToString:@"iPhone6,1"]) return @"iPhone 5S";
    if ([deviceIdentifier isEqualToString:@"iPhone6,2"]) return @"iPhone 5S";
    if ([deviceIdentifier isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([deviceIdentifier isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if ([deviceIdentifier isEqualToString:@"iPhone8,1"]) return @"iPhone 6S";
    if ([deviceIdentifier isEqualToString:@"iPhone8,2"]) return @"iPhone 6S Plus";
    if ([deviceIdentifier isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    if ([deviceIdentifier isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    if ([deviceIdentifier isEqualToString:@"iPhone9,3"]) return @"iPhone 7";
    if ([deviceIdentifier isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    if ([deviceIdentifier isEqualToString:@"iPhone9,4"]) return @"iPhone 7 Plus";
    if ([deviceIdentifier isEqualToString:@"iPhone10,1"]) return @"iPhone 8";
    if ([deviceIdentifier isEqualToString:@"iPhone10,4"]) return @"iPhone 8";
    if ([deviceIdentifier isEqualToString:@"iPhone10,2"]) return @"iPhone 8 Plus";
    if ([deviceIdentifier isEqualToString:@"iPhone10,5"]) return @"iPhone 8 Plus";
    if ([deviceIdentifier isEqualToString:@"iPhone10,3"]) return @"iPhone X";
    if ([deviceIdentifier isEqualToString:@"iPhone10,6"]) return @"iPhone X";
    if ([deviceIdentifier isEqualToString:@"iPhone11,8"]) return @"iPhone XR";
    if ([deviceIdentifier isEqualToString:@"iPhone11,2"]) return @"iPhone XS";
    if ([deviceIdentifier isEqualToString:@"iPhone11,4"]) return @"iPhone XS Max";
    if ([deviceIdentifier isEqualToString:@"iPhone11,6"]) return @"iPhone XS Max";
    if ([deviceIdentifier isEqualToString:@"iPhone12,1"]) return @"iPhone 11";
    if ([deviceIdentifier isEqualToString:@"iPhone12,3"]) return @"iPhone 11 Pro";
    if ([deviceIdentifier isEqualToString:@"iPhone12,5"]) return @"iPhone 11 Pro Max";
    if ([deviceIdentifier isEqualToString:@"iPhone12,8"]) return @"iPhone SE 2";
    if ([deviceIdentifier isEqualToString:@"iPhone13,1"]) return @"iPhone 12 mini";
    if ([deviceIdentifier isEqualToString:@"iPhone13,2"]) return @"iPhone 12";
    if ([deviceIdentifier isEqualToString:@"iPhone13,3"]) return @"iPhone 12 Pro";
    if ([deviceIdentifier isEqualToString:@"iPhone13,4"]) return @"iPhone 12 Pro Max";

    return deviceIdentifier;
} /* iPhoneType */


#pragma mark - Private

+ (NSString *)deviceIdentifier {
    struct utsname systemInfo;

    uname(&systemInfo);
    return [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
}


@end
