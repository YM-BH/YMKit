//
//  ViewController.m
//  YMKit
//
//  Created by 白晗 on 2020/10/27.
//

#import "ViewController.h"
#import "GradientViewController.h"
#import "TimestampViewController.h"
#import "PlaceholderTextViewController.h"
#import "HiddenNavigationBarViewController.h"
#import "DynamicDownloadFontViewController.h"
#import "ScreenAdapatorController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *demoArray;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _demoArray = @[@"渐变按钮", @"时间戳处理", @"带占位TextView", @"隐藏导航栏", @"动态下载字体-学习自唐巧", @"屏幕适配"];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _demoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *const identifier = @"demoCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = _demoArray[indexPath.row];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *title = _demoArray[indexPath.row];
    if ([title isEqualToString:@"渐变按钮"]) {
        GradientViewController *gradientVc = [[GradientViewController alloc] init];
        [self.navigationController pushViewController:gradientVc animated:YES];
    } else if ([title isEqualToString:@"时间戳处理"]) {
        TimestampViewController *timestampVc = [[TimestampViewController alloc] init];
        [self.navigationController pushViewController:timestampVc animated:YES];
    } else if ([title isEqualToString:@"带占位TextView"]) {
        PlaceholderTextViewController *placeholderTextViewVc = [[PlaceholderTextViewController alloc] init];
        [self.navigationController pushViewController:placeholderTextViewVc animated:YES];
    } else if ([title isEqualToString:@"隐藏导航栏"]) {
        HiddenNavigationBarViewController *hiddenNavVc = [[HiddenNavigationBarViewController alloc] init];
        [self.navigationController pushViewController:hiddenNavVc animated:YES];
    } else if ([title isEqualToString:@"动态下载字体-学习自唐巧"]) {
        DynamicDownloadFontViewController *dynamicDownloadFontVc = [[DynamicDownloadFontViewController alloc] init];
        [self.navigationController pushViewController:dynamicDownloadFontVc animated:YES];
    } else if ([title isEqualToString:@"屏幕适配"]) {
        ScreenAdapatorController *screenAdapatorVc = [[ScreenAdapatorController alloc] init];
        [self.navigationController pushViewController:screenAdapatorVc animated:YES];
    }
}

@end
