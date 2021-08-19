//
//  BKScreenAdapator.h
//  FengXingReadNew
//
//  Created by 白晗 on 2020/12/9.
//  Copyright © 2020 Lazyload. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define BK_GET_STATUS_BAR_HEIGHT                    [BKScreenAdapator getStatusBarHeight]
#define BK_GET_NAVIGATION_BAR_HEIGHT                [BKScreenAdapator getNavigationBarHeight]
#define BK_GET_TAB_BAR_HEIGHT                       [BKScreenAdapator getTabBarHeight]
#define BK_GET_BOTTOM_SAFE_AREA_HEIGHT              [BKScreenAdapator getBottomSafeAreaHeight]

/// 屏幕适配
@interface YMScreenAdapator : NSObject
/// 获取状态栏高度
+ (CGFloat)getStatusBarHeight;
/// 获取导航条高度
+ (CGFloat)getNavigationBarHeight;
/// 获取 TabBar 高度
+ (CGFloat)getTabBarHeight;
/// 获取底部安全区高度
+ (CGFloat)getBottomSafeAreaHeight;

@end

NS_ASSUME_NONNULL_END
