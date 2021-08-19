//
//  BKScreenAdapator.m
//  FengXingReadNew
//
//  Created by 白晗 on 2020/12/9.
//  Copyright © 2020 Lazyload. All rights reserved.
//

#import "YMScreenAdapator.h"

#define kModeSize                   [[UIScreen mainScreen] currentMode].size

@implementation YMScreenAdapator

/// 判断是否为iPhone12系列 除了iPhone12 mini
+ (BOOL)isIphone12SeriesExcept12Mini {

    BOOL isIphone12And12Pro = CGSizeEqualToSize(CGSizeMake(1170, 2532), kModeSize);
    BOOL isIphone12ProMax = CGSizeEqualToSize(CGSizeMake(1284, 2778), kModeSize);
    return isIphone12ProMax || isIphone12And12Pro;
}

+ (BOOL)isIphone11AndXR {
    return CGSizeEqualToSize(CGSizeMake(828, 1792), kModeSize);
}

+ (BOOL)isOtherBangsScreen {
    
    return CGSizeEqualToSize(CGSizeMake(1242, 2688), kModeSize) || CGSizeEqualToSize(CGSizeMake(1125, 2436), kModeSize);
}

+ (CGFloat)getStatusBarHeight {
    
    if ([self isIphone12SeriesExcept12Mini]) {
        return 47;
    } else if ([self isIphone11AndXR]) {
        return 48;
    } else if ([self isOtherBangsScreen]) {
        return 44;
    }
    return 20;
    
}

+ (CGFloat)getNavigationBarHeight {
    
    if ([self isIphone11AndXR] || [self isIphone12SeriesExcept12Mini] || [self isOtherBangsScreen]) {
        return [self getStatusBarHeight] + 44;
    }
    
    return 64;
}

+ (CGFloat)getTabBarHeight {
    if ([self isIphone11AndXR] || [self isIphone12SeriesExcept12Mini] || [self isOtherBangsScreen]) {
        return 83;
    }
    return 49;
}

+ (CGFloat)getBottomSafeAreaHeight {
    if ([self isIphone11AndXR] || [self isIphone12SeriesExcept12Mini] || [self isOtherBangsScreen]) {
        return 34;
    }
    return 0;
}
@end
