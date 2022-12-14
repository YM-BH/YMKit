//
//  BKScreenAdapator.m
//  FengXingReadNew
//
//  Created by 白晗 on 2020/12/9.
//  Copyright © 2020 Lazyload. All rights reserved.
//

#import "YMScreenAdapator.h"

/// 导航条的高度
static const CGFloat kNavigationBarHeight = 44;

/// tabBar 的高度
static const CGFloat kTabBarHeight = 49;

/// 底部安全区域的高度
static const CGFloat kBottomSafeAreaHeight = 34;

/// 非刘海屏状态栏的高度
static const CGFloat kNotBangScreenStatusBarHeight = 20;

@implementation YMScreenAdapator

/**
 *  状态栏各机型的高度
 *  iPhone12 系列除了 iPhone12 mini 状态栏的高度是47
 *  iPhone11 和 iPhone XR 状态栏高度是 48
 *  其他带刘海的机型状态栏高度是 44
 *  没有刘海的机型状态栏高度是 20
 */
+ (CGFloat)getStatusBarHeight {

    if (@available(iOS 13.0, *)) {
        UIStatusBarManager *statusBarManager = [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager;
        return statusBarManager.statusBarFrame.size.height;
    } else {
        return [UIApplication sharedApplication].statusBarFrame.size.height;
    }
}

+ (CGFloat)getNavigationBarHeight {
    return [self getStatusBarHeight] + kNavigationBarHeight;
}

+ (CGFloat)getBottomSafeAreaHeight {
    
    if ([self getStatusBarHeight] == kNotBangScreenStatusBarHeight) { // 非刘海屏
        return 0;
    }
    return kBottomSafeAreaHeight;
}

+ (CGFloat)getTabBarHeight {
    return kTabBarHeight + [self getBottomSafeAreaHeight];
}
@end
