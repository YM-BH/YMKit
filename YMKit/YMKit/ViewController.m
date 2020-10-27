//
//  ViewController.m
//  YMKit
//
//  Created by 白晗 on 2020/10/27.
//

#import "ViewController.h"
#import "UIButton+Extension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self gradientButtonDemo];
}

- (void)gradientButtonDemo {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, self.view.bounds.size.width - 40, 44)];
    button.layer.cornerRadius = 20;
    button.layer.masksToBounds = YES;
    [button bh_setGradientColorFromLeftToRightWithColors:@[[UIColor redColor], [UIColor orangeColor]]];
    [button setTitle:@"提交" forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}


@end
