//
//  TimestampViewController.m
//  YMKit
//
//  Created by 白晗 on 2020/10/29.
//

#import "TimestampViewController.h"
#import "NSString+YMExtension.h"

@interface TimestampViewController ()
@property (nonatomic, strong) UILabel *currentTimestampLabel;
@end

@implementation TimestampViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"秒",@"毫秒"]];
    [segmentControl addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    segmentControl.selectedSegmentIndex = 0;
    segmentControl.frame = CGRectMake(15, 100, 100, 30);
    [self.view addSubview:segmentControl];
    
    self.currentTimestampLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 150, 0, 0)];
    _currentTimestampLabel.text = [NSString stringWithFormat:@"当前时间的时间戳：%@", [NSString ym_getCurrentTimestampWithType:YMTimestampTypeSecond]];
    [_currentTimestampLabel sizeToFit];
    [self.view addSubview:_currentTimestampLabel];
    
}

- (void)change:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        _currentTimestampLabel.text = [NSString stringWithFormat:@"当前时间的时间戳：%@", [NSString ym_getCurrentTimestampWithType:YMTimestampTypeSecond]];
    } else if (sender.selectedSegmentIndex == 1) {
        _currentTimestampLabel.text = [NSString stringWithFormat:@"当前时间的时间戳：%@", [NSString ym_getCurrentTimestampWithType:YMTimestampTypeMillisecond]];
    }
    
    
    [_currentTimestampLabel sizeToFit];
}

@end
