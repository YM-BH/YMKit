//
//  Fonts.h
//  动态下载字体
//
//  Created by 白晗 on 2021/5/11.
//

#import <UIKit/UIKit.h>

typedef void (^CompletionHandlerBlock)(UIFont *font, NSString *errorMsg);
typedef void (^ProgressBlock)(CGFloat progressValue);

@interface Fonts : NSObject

/// 动态加载字体
/// @param fontName 字体的 postScript
/// @param size 字体大小
/// @param progress 下载进度回调
/// @param completion 完成回调
+ (void)loadFontWithFontName:(NSString *)fontName size:(CGFloat)size progress:(ProgressBlock)progress completion:(CompletionHandlerBlock)completion;

@end

