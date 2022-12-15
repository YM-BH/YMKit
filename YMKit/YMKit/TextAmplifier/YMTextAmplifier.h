//
//  YMTextAmplifier.h
//  ChangfengDoctor
//
//  Created by changfeng on 2021/8/10.
//  Copyright © 2021 ZL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 文字放大器
@interface YMTextAmplifier : UIViewController

/// 行间距（默认15）
@property (nonatomic, assign) CGFloat lineSpacing;
/// 放大后字体大小（默认25）
@property (nonatomic, assign) CGFloat fontSize;

/// 展示文字内容
- (void)showWithContent:(NSString *)content vc:(UIViewController *)vc;

@end

NS_ASSUME_NONNULL_END
