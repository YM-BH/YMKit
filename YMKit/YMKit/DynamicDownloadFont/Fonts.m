//
//  Fonts.m
//  动态下载字体
//
//  Created by 白晗 on 2021/5/11.
//

#import "Fonts.h"
#import <CoreText/CoreText.h>

@implementation Fonts

+ (void)loadFontWithFontName:(NSString *)fontName size:(CGFloat)size progress:(ProgressBlock)progress completion:(CompletionHandlerBlock)completion {
	if (![self isFontDownloaded:fontName size:size]) {
		// 下载字体
		NSMutableDictionary *atts = [NSMutableDictionary dictionaryWithObjectsAndKeys:fontName, kCTFontNameAttribute, nil];

		CTFontDescriptorRef desc = CTFontDescriptorCreateWithAttributes((__bridge CFDictionaryRef)atts);

		NSMutableArray *descs = [NSMutableArray array];
		[descs addObject:(__bridge id)desc];
		CFRelease(desc);

		__block BOOL errorDuringDownlaod = NO;
		CTFontDescriptorMatchFontDescriptorsWithProgressHandler((__bridge CFArrayRef)descs, NULL, ^bool (CTFontDescriptorMatchingState state, CFDictionaryRef _Nonnull progressParameter) {

			double progressValue = [[(__bridge NSDictionary *)progressParameter objectForKey:(id)kCTFontDescriptorMatchingPercentage] doubleValue];

			if (state == kCTFontDescriptorMatchingDidBegin) {
				NSLog(@"字体已经匹配");
			} else if (state == kCTFontDescriptorMatchingDidFinish) {
				if (!errorDuringDownlaod) {
					NSLog(@"字体%@ 下载完成", fontName);
					[self backToMainThreadWithFontName:fontName size:size completion:completion];
				}
			} else if (state == kCTFontDescriptorMatchingWillBeginDownloading) {
				NSLog(@"字体开始下载");
			} else if (state == kCTFontDescriptorMatchingDidFinishDownloading) {
				NSLog(@"字体下载完成");
				[self backToMainThreadWithFontName:fontName size:size completion:completion];
			} else if (state == kCTFontDescriptorMatchingDownloading) {
				NSLog(@"下载进度 %.0f%%", progressValue);
			} else if (state == kCTFontDescriptorMatchingDidFailWithError) {
				NSError *error = [(__bridge NSDictionary *)progressParameter objectForKey:(id)kCTFontDescriptorMatchingError];
				NSString *errorMsg = nil;
				if (error != nil) {
					errorMsg = [error description];
				} else {
					errorMsg = @"ERROR MESSAGE IS NOT AVAILBLE!";
				}

				errorDuringDownlaod = YES;

				if (completion) {
					completion(nil, errorMsg);
				}

			}

			return (BOOL)YES;
		});
	} else { // 存在该字体
		[self backToMainThreadWithFontName:fontName size:size completion:completion];
	}
}


+ (void)backToMainThreadWithFontName:(NSString *)fontName size:(CGFloat)size completion:(CompletionHandlerBlock)completion {
	dispatch_async(dispatch_get_main_queue(), ^{
		// 修改UI控件的字体
		UIFont *font = [UIFont fontWithName:fontName size:size];
		if (completion) {
			completion(font, nil);
		}
	});
}

+ (BOOL)isFontDownloaded:(NSString *)fontName size:(CGFloat)size {
	UIFont *aFont = [UIFont fontWithName:fontName size:size];
	if (aFont && ([aFont.fontName compare:fontName] || [aFont.familyName compare:fontName])) {
		return YES;
	} else {
		return NO;
	}
}
@end
