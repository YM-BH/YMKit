//
//  UIView+YMExtension.m
//  YMKit
//
//  Created by 白晗 on 2021/9/28.
//

#import "UIView+YMExtension.h"

@implementation UIView (YMExtension)

- (void)ym_setGradientColorFromLeftToRightWithColors:(NSArray<UIColor *> *)colors {
    [self _setGradientColorWithStartPoint:CGPointMake(0, 0.5) endPoint:CGPointMake(1.0, 0.5) colors:colors];
}

- (void)ym_setGradientColorFromTopToBottomWithColors:(NSArray<UIColor *> *)colors {
    [self _setGradientColorWithStartPoint:CGPointMake(0.5, 0) endPoint:CGPointMake(0.5, 1) colors:colors];
}

/// 设置渐变色
- (void)_setGradientColorWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint colors:(NSArray<UIColor *> *)colors {
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    // 将UIColor -> CGColor
    NSMutableArray *tempArray = [NSMutableArray array];
    for (UIColor *color in colors) {
        [tempArray addObject:(id)color.CGColor];
    }
    gradientLayer.colors = tempArray.copy;
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    [self.layer addSublayer:gradientLayer];
}

@end
