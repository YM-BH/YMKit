//
//  YMPlaceholderTextView.h
//  YMKit
//
//  Created by 白晗 on 2020/11/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 带占位文字的 textView
@interface YMPlaceholderTextView : UITextView

@property (nonatomic, copy) NSString *placeholder; //!< 占位文字
@property (nonatomic, strong) UIColor *placeholderColor; //!< 占位文字的颜色
@property (nonatomic, assign) BOOL placeholderShouldScroll; //!< 占位文字是否可以滚动
@end

NS_ASSUME_NONNULL_END
