//
//  GradientViewController.m
//  YMKit
//
//  Created by 白晗 on 2020/10/29.
//

#import "GradientController.h"
// #import "UIButton+YMExtension.h"

#import "UIViewController+YMExtension.h"
#import "UIView+YMExtension.h"

@interface GradientController ()

@end

@implementation GradientController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self gradientButtonDemo];
    [self gradientViewDemo];
}

- (void)gradientViewDemo {
    UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(20, 160, self.view.bounds.size.width - 40, 44)];
    [aView ym_setGradientColorFromLeftToRightWithColors:@[[UIColor orangeColor], [UIColor cyanColor]]];
    [self.view addSubview:aView];
}

- (void)gradientButtonDemo {
    UIButton *leftToRight = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, self.view.bounds.size.width - 40, 44)];

    leftToRight.layer.cornerRadius = 20;
    leftToRight.layer.masksToBounds = YES;
    [leftToRight ym_setGradientColorFromLeftToRightWithColors:@[[UIColor redColor], [UIColor orangeColor]]];
    [leftToRight setTitle:@"从左至右" forState:UIControlStateNormal];
    [leftToRight addTarget:self action:@selector(leftToRightButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftToRight];

}

- (void)leftToRightButtonClick {

    [self bh_showAlertStyleWithTitle:@"提示" message:@"点击了按钮" rightActionTitle:nil leftActionTitle:@"确定" rightActionCompletion:nil leftActionCompletion:nil];
}

@end
