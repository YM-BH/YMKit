//
//  BKScreenAdapator.h
//  FengXingReadNew
//
//  Created by 白晗 on 2020/12/9.
//  Copyright © 2020 Lazyload. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define BK_GET_STATUS_BAR_HEIGHT                    [BKScreenAdapator getStatusBarHeight]
#define BK_GET_NAVIGATION_BAR_HEIGHT                [BKScreenAdapator getNavigationBarHeight]
#define BK_GET_TAB_BAR_HEIGHT                       [BKScreenAdapator getTabBarHeight]
#define BK_GET_BOTTOM_SAFE_AREA_HEIGHT              [BKScreenAdapator getBottomSafeAreaHeight]

@interface YMScreenAdapator : NSObject

+ (CGFloat)getStatusBarHeight;

+ (CGFloat)getNavigationBarHeight;

+ (CGFloat)getTabBarHeight;

+ (CGFloat)getBottomSafeAreaHeight;

@end

NS_ASSUME_NONNULL_END
