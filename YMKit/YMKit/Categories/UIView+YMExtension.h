//
//  UIView+YMExtension.h
//  YMKit
//
//  Created by 白晗 on 2021/9/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YMExtension)

/// 设置从左到右渐变色
/// @param colors 颜色数组
- (void)ym_setGradientColorFromLeftToRightWithColors:(NSArray<UIColor *> *)colors;

/// 设置从上到下渐变色
/// @param colors 颜色数组
- (void)ym_setGradientColorFromTopToBottomWithColors:(NSArray<UIColor *> *)colors;

@end

NS_ASSUME_NONNULL_END
