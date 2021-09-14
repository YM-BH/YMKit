//
//  ViewController.m
//  YMKit
//
//  Created by 白晗 on 2020/10/27.
//

#import "ViewController.h"
#import "AppInfoUtil.h"
#import <YYKit/YYKit.h>
#import "Module.h"


@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *demoArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadAllModules];

    [self setupUI];
}

/// 加载所有功能模块
- (void)loadAllModules {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"AllModules" ofType:@"plist"];

    NSDictionary *rootDict = [NSDictionary dictionaryWithContentsOfFile:filePath];

    // 字典转模型
    NSMutableArray *dataSource = [NSMutableArray array];

    for (NSDictionary *dict in rootDict[@"modules"]) {
        Module *module = [Module modelWithDictionary:dict];
        [dataSource addObject:module];
    }

    self.demoArray = [dataSource copy];
    [self.tableView reloadData];

}

- (void)setupUI {
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

    Module *module = _demoArray[indexPath.row];

    cell.textLabel.text = module.name;

    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    Module *module = _demoArray[indexPath.row];
    Class cls = NSClassFromString(module.controllerName);
    UIViewController *vc = [[cls alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
} /* tableView */

@end
