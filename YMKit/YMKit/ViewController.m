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

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *demoArray;
@end

@implementation ViewController
/// 使用storyboard初始化控制器时候调用
- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        _demoArray = @[@"渐变按钮", @"时间戳处理", @"带占位TextView"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
        gradientVc.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:gradientVc animated:YES];
    } else if ([title isEqualToString:@"时间戳处理"]) {
        TimestampViewController *timestampVc = [[TimestampViewController alloc] init];
        timestampVc.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:timestampVc animated:YES];
    } else if ([title isEqualToString:@"带占位TextView"]) {
        PlaceholderTextViewController *placeholderTextViewVc = [[PlaceholderTextViewController alloc] init];
        placeholderTextViewVc.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:placeholderTextViewVc animated:YES];
    }
}

@end
