//
//  SDWebImageViewController.m
//  YMKit
//
//  Created by 白晗 on 2021/9/27.
//

#import "SDWebImageViewController.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface SDWebImageViewController ()

@end

@implementation SDWebImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.backgroundColor = [UIColor redColor];
    [imgView sd_setImageWithURL:[NSURL URLWithString:@"https://upload.jianshu.io/users/upload_avatars/4121307/f918e831-9743-4a02-a579-c7fbf1982dfe.JPG"]];
    [self.view addSubview:imgView];
    ]
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(80);
        make.center.mas_equalTo(self.view);
    }];
    
    
}



@end
