//
//  UIImage+YMExtension.m
//  YMKit
//
//  Created by 白晗 on 2021/9/16.
//

#import "UIImage+YMExtension.h"

@implementation UIImage (YMExtension)

/// 将图片置灰
- (UIImage *)ym_grayImage:(UIImage *)image {
    
    int bitmapInfo = kCGImageAlphaNone;
    int width = image.size.width;
    int height = image.size.height;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    
    CGContextRef context = CGBitmapContextCreate(nil, width, height, 8, 0, colorSpace, bitmapInfo);

    CGColorSpaceRelease(colorSpace);
    if (context == NULL) {
        return nil;
    }
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), image.CGImage);
    
    UIImage *grayImage = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];

    CGContextRelease(context);
    return grayImage;

}

@end
