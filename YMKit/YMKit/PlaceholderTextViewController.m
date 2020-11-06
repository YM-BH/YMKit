//
//  PlaceholderTextViewController.m
//  YMKit
//
//  Created by 白晗 on 2020/11/6.
//

#import "PlaceholderTextViewController.h"
#import "YMPlaceholderTextView.h"

@interface PlaceholderTextViewController ()

@end

@implementation PlaceholderTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YMPlaceholderTextView *textView = [[YMPlaceholderTextView alloc] initWithFrame:CGRectMake(15, 100, self.view.bounds.size.width - 30, 300)];
    textView.font = [UIFont systemFontOfSize:14];
    textView.tintColor = [UIColor cyanColor];
    textView.placeholder = @"请输入反馈的内容，这个占位文字可能很长，也可能字体很大，反正一行是显式不过来的~~~~~";
    textView.placeholderShouldScroll = NO;
    textView.placeholderColor = [UIColor redColor];
    [self.view addSubview:textView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


@end
