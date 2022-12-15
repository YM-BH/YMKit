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
@property (nonatomic, strong) UILabel *smallLabel;
@end

@implementation TextAmplifierController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textView = [[YMPlaceholderTextView alloc] initWithFrame:CGRectMake(10, YM_GET_NAVIGATION_BAR_HEIGHT, self.view.bounds.size.width - 20, 150)];
    self.textView.placeholder = @"请输入文字";
    
    self.textView.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:self.textView];
    
    UIButton *confirmButton = [[UIButton alloc] initWithFrame:CGRectMake((self.view.bounds.size.width - 80) * 0.5, CGRectGetMaxY(self.textView.frame) + 20, 80, 40)];
    confirmButton.backgroundColor = [UIColor orangeColor];
    [confirmButton addTarget:self action:@selector(confirmButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [confirmButton setTitle:@"确认" forState:UIControlStateNormal];
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
    
    [textAmplifier showWithContent:smallLabel.text vc:self];
}


@end
