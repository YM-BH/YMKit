//
//  ScreenAdapatorController.m
//  YMKit
//
//  Created by 白晗 on 2021/8/19.
//

#import "ScreenAdapatorController.h"
#import "YMScreenAdapator.h"

@interface ScreenAdapatorController ()
@property (nonatomic, strong) UILabel *statusBarLabel;
@property (nonatomic, strong) UILabel *navigationBarLabel;
@end

@implementation ScreenAdapatorController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.statusBarLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 30)];
    self.statusBarLabel.textAlignment = NSTextAlignmentCenter;
    self.statusBarLabel.text = [NSString stringWithFormat:@"状态栏高度：%lf", YM_GET_STATUS_BAR_HEIGHT];
    [self.view addSubview:self.statusBarLabel];
    
    self.navigationBarLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, self.statusBarLabel.bounds.size.width, self.statusBarLabel.bounds.size.height)];
    self.navigationBarLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationBarLabel.text = [NSString stringWithFormat:@"导航条高度：%lf", YM_GET_NAVIGATION_BAR_HEIGHT];
    [self.view addSubview:self.navigationBarLabel];
    
    
}


@end
