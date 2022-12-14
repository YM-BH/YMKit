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

/// 展示文字内容
- (void)showWithContent:(NSString *)content vc:(UIViewController *)vc;

@end

NS_ASSUME_NONNULL_END
