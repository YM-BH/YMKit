//
//  TextAmplifierController.m
//  YMKit
//
//  Created by fu on 2022/12/14.
//

#import "TextAmplifierController.h"
#import "YMTextAmplifier.h"
#import "YMScreenAdapator.h"

@interface TextAmplifierController ()

@end

@implementation TextAmplifierController

- (void)viewDidLoad {
    [super viewDidLoad];

    UILabel *smallLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, YM_GET_NAVIGATION_BAR_HEIGHT + 20, self.view.bounds.size.width - 20, 100)];
    smallLabel.userInteractionEnabled = YES;
    smallLabel.text = @"他分析称，从疫情开始后计算，石家庄的“超额发烧搜索指数累计面积”已经达到了76，邢台已经达到了67，保定也达到了71。考虑到保定、石家庄、邢台等地的发烧指数仍然在上升，保守地将100作为疫情达峰时的“超额发烧搜索指数累计面积”，将250作为第一轮疫情结束时的“超额发烧搜索指数累计面积”。从而可以计算出各个城市的首轮感染高峰期。";
    smallLabel.numberOfLines = 0;
    smallLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:smallLabel];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapGesture:)];
    doubleTap.numberOfTapsRequired = 2;
    [smallLabel addGestureRecognizer:doubleTap];
}

- (void)doubleTapGesture:(UIGestureRecognizer *)recognizer {
    
    UILabel *smallLabel = (UILabel *)recognizer.view;
    
    YMTextAmplifier *textAmplifier = [[YMTextAmplifier alloc] init];
    
    [textAmplifier showWithContent:smallLabel.text vc:self];
}


@end
