//
//  UIView+Extension.h
//  Gradient
//
//  Created by 白晗 on 2020/10/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Extension)

/// 设置从左到右渐变色
/// @param colors 颜色数组
- (void)bh_setGradientColorFromLeftToRightWithColors:(NSArray<UIColor *> *)colors;

/// 设置从上到下渐变色
/// @param colors 颜色数组
- (void)bh_setGradientColorFromTopToBottomWithColors:(NSArray<UIColor *> *)colors;

@end

NS_ASSUME_NONNULL_END
