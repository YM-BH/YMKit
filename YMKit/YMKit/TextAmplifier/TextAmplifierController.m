//
//  TextAmplifierController.m
//  YMKit
//
//  Created by fu on 2022/12/14.
//

#import "TextAmplifierController.h"
#import "YMTextAmplifier.h"
#import "YMScreenAdapator.h"
#import "YMPlaceholderTextView.h"

@interface TextAmplifierController ()
@property (nonatomic, strong) YMPlaceholderTextView *textView;
@property (nonatomic, strong) YMPlaceholderTextView *lineSpacingTextView;
@property (nonatomic, strong) YMPlaceholderTextView *fontSizeTextView;
@property (nonatomic, strong) UILabel *smallLabel;
@end

@implementation TextAmplifierController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textView = [[YMPlaceholderTextView alloc] initWithFrame:CGRectMake(10, YM_GET_NAVIGATION_BAR_HEIGHT, self.view.bounds.size.width - 20, 150)];
    self.textView.placeholder = @"请输入文字";
    
    self.textView.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:self.textView];
    
    self.lineSpacingTextView = [[YMPlaceholderTextView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.textView.frame) + 10, CGRectGetWidth(self.textView.frame), 44)];
    self.lineSpacingTextView.placeholder = @"设置行间距";
    self.lineSpacingTextView.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:self.lineSpacingTextView];
    
    self.fontSizeTextView = [[YMPlaceholderTextView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.lineSpacingTextView.frame) + 10, CGRectGetWidth(self.textView.frame), 44)];
    self.fontSizeTextView.placeholder = @"设置要放大的文字大小";
    self.fontSizeTextView.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:self.fontSizeTextView];
    
    UIButton *confirmButton = [[UIButton alloc] initWithFrame:CGRectMake((self.view.bounds.size.width - 180) * 0.5, CGRectGetMaxY(self.fontSizeTextView.frame) + 20, 180, 40)];
    confirmButton.backgroundColor = [UIColor orangeColor];
    [confirmButton addTarget:self action:@selector(confirmButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [confirmButton setTitle:@"确认后双击文字查看" forState:UIControlStateNormal];
    [self.view addSubview:confirmButton];

    self.smallLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(confirmButton.frame) + 20, self.view.bounds.size.width - 20, 100)];
    self.smallLabel.userInteractionEnabled = YES;
    self.smallLabel.numberOfLines = 0;
    self.smallLabel.font = [UIFont systemFontOfSize:12];
    self.smallLabel.textColor = [UIColor orangeColor];
    [self.view addSubview:self.smallLabel];

    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapGesture:)];
    doubleTap.numberOfTapsRequired = 2;
    [self.smallLabel addGestureRecognizer:doubleTap];
}

- (void)confirmButtonClick {
    [self.view endEditing:YES];
    self.smallLabel.text = self.textView.text;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)doubleTapGesture:(UIGestureRecognizer *)recognizer {
    
    UILabel *smallLabel = (UILabel *)recognizer.view;
    
    YMTextAmplifier *textAmplifier = [[YMTextAmplifier alloc] init];
    // 设置行间距
    textAmplifier.lineSpacing = [self.lineSpacingTextView.text floatValue];
    // 设置字体大小
    textAmplifier.fontSize = [self.fontSizeTextView.text floatValue];
    [textAmplifier showWithContent:smallLabel.text vc:self];
}


@end
