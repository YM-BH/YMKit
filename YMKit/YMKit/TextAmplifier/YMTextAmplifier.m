//
//  YMTextAmplifier.m
//  ChangfengDoctor
//
//  Created by changfeng on 2021/8/10.
//  Copyright © 2021 ZL. All rights reserved.
//

#import "YMTextAmplifier.h"

@interface YMTextAmplifier ()

@property (nonatomic, strong) UIScrollView *containerView;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, copy) NSString *content;
@end

@implementation YMTextAmplifier

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    [self setupUI];

}

- (void)setupUI {

    self.containerView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.containerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.containerView];

    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture)];

    [self.containerView addGestureRecognizer:tapRecognizer];

    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.backgroundColor = [UIColor clearColor];
    self.contentLabel.numberOfLines = 0;
    [self.containerView addSubview:self.contentLabel];

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    // 设置行间距
    paragraphStyle.lineSpacing = 15;

    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:self.content];

    [attString addAttributes:@{
         NSFontAttributeName: [UIFont systemFontOfSize:24],
         NSParagraphStyleAttributeName: paragraphStyle
     } range:NSMakeRange(0, self.content.length)];
    self.contentLabel.attributedText = attString;

    CGFloat leftMargin = 36;
    CGFloat topMargin = 63;
    CGFloat width = self.view.bounds.size.width - leftMargin * 2;
    CGFloat textHeight = [self getStringSizeWithAttString:attString size:CGSizeMake(width, MAXFLOAT)].height;
    // 获取文字高度和屏幕高度的差值
    CGFloat deltaY = (self.view.bounds.size.height - textHeight) * 0.5;
    
    // 计算内容label的y值，比 topMargin值大，y即居中位置，否则就是 topMargin
    CGFloat labelY = deltaY > topMargin ? deltaY : topMargin;
    
    self.contentLabel.frame = CGRectMake(leftMargin, labelY, width, textHeight);
    
    CGFloat contentHeight = deltaY > topMargin ? (self.view.bounds.size.height + 2) : (textHeight + topMargin * 2);
    self.containerView.contentSize = CGSizeMake(0, contentHeight);

} /* setupUI */

- (CGSize)getStringSizeWithAttString:(NSAttributedString *)attString size:(CGSize)size {

    return [attString boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin context:NULL].size;
}

- (BOOL)prefersStatusBarHidden {
    [super prefersStatusBarHidden];
    return YES;
}

- (void)showWithContent:(NSString *)content vc:(nonnull UIViewController *)vc {

    _content = content;
    
    self.modalPresentationStyle = UIModalPresentationFullScreen;
    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [vc presentViewController:self animated:YES completion:nil];
    
}

- (void)tapGesture {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc {
    NSLog(@"文字放大器销毁");
}

@end
