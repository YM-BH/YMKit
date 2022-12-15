//
//  YMPlaceholderTextView.m
//  YMKit
//
//  Created by 白晗 on 2020/11/6.
//

#import "YMPlaceholderTextView.h"

@interface YMPlaceholderTextView ()

@property (nonatomic, strong) UILabel *placeholderLabel; //!< 占位文字
@property (nonatomic, assign) CGFloat placeholderLeftMargin; //!< 占位文字左侧间距
@property (nonatomic, assign) CGFloat placeholderTopMargin; //!< 占位文字顶部间距

@end

@implementation YMPlaceholderTextView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        _placeholderLeftMargin = 8;
        _placeholderTopMargin = 8;
        self.font = [UIFont systemFontOfSize:18];
        self.alwaysBounceVertical = YES;
        [self setUpSubviews];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

- (void)setUpSubviews {
    self.placeholderLabel = [[UILabel alloc] init];
    _placeholderLabel.textColor = [UIColor lightGrayColor];
    _placeholderLabel.text = @"输入占位文字";
    _placeholderLabel.numberOfLines = 0;
    [self addSubview:_placeholderLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 计算高度
    CGFloat placehoderLabelWidth = self.bounds.size.width - 2 * _placeholderLeftMargin;
    CGSize textSize = [_placeholderLabel.text boundingRectWithSize:CGSizeMake(placehoderLabelWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : _placeholderLabel.font} context:nil].size;
    
    _placeholderLabel.frame = CGRectMake(_placeholderLeftMargin, _placeholderTopMargin, placehoderLabelWidth, textSize.height);
}

- (void)textDidChange {
    _placeholderLabel.hidden = self.hasText;
}

#pragma mark - Setter
- (void)setFont:(UIFont *)font {
    [super setFont:font];
    
    _placeholderLabel.font = font;
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = [placeholder copy];
    
    _placeholderLabel.text = placeholder;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    
    _placeholderLabel.textColor = placeholderColor;
}

- (void)setPlaceholderShouldScroll:(BOOL)placeholderShouldScroll {
    _placeholderShouldScroll = placeholderShouldScroll;
    
    self.alwaysBounceVertical = placeholderShouldScroll;
}

- (void)setText:(NSString *)text {
    [super setText:text];
    
    [self textDidChange];
}

- (void)setAttributedText:(NSAttributedString *)attributedText {
    [super setAttributedText:attributedText];
    
    [self textDidChange];
}
@end
