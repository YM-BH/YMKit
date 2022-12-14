//
//  TextAmplifierController.m
//  YMKit
//
//  Created by fu on 2022/12/14.
//

#import "TextAmplifierController.h"
#import "YMTextAmplifier.h"

@interface TextAmplifierController ()

@end

@implementation TextAmplifierController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    YMTextAmplifier *textAmplifier = [[YMTextAmplifier alloc] init];
    
    [textAmplifier showWithContent:@"sdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsasdsa" vc:self];
}

@end
