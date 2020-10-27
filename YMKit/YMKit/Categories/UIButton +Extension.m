//
//  UIView+Extension.m
//  Gradient
//
//  Created by 白晗 on 2020/10/27.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)
- (void)bh_setGradientColorFromLeftToRightWithColors:(NSArray<UIColor *> *)colors {
    [self _setGradientColorWithStartPoint:CGPointMake(0, 0.5) endPoint:CGPointMake(1.0, 0.5) colors:colors];
}
- (void)bh_setGradientColorFromTopToBottomWithColors:(NSArray<UIColor *> *)colors {
    [self _setGradientColorWithStartPoint:CGPointMake(0.5, 0) endPoint:CGPointMake(0.5, 1) colors:colors];
}

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
