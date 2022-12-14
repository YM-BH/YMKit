//
//  NavigationController.m
//  YMKit
//
//  Created by 白晗 on 2021/8/19.
//

#import "NavigationController.h"

@interface NavigationController () <UIGestureRecognizerDelegate>

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.interactivePopGestureRecognizer.delegate = self;
    
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    if (self.childViewControllers.count > 1) { // 一级页面不能侧滑返回
        return YES;
    }
    
    return NO;
}


@end
