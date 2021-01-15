//
//  HiddenNavigationBarViewController.m
//  YMKit
//
//  Created by 白晗 on 2021/1/15.
//

#import "HiddenNavigationBarViewController.h"

@interface HiddenNavigationBarViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) UIView *navView;
@end

@implementation HiddenNavigationBarViewController

- (instancetype)init {
    if (self = [super init]) {
        NSMutableArray *datas = [NSMutableArray array];
        for (int i = 0; i < 40; i++) {
            [datas addObject:[NSString stringWithFormat:@"data - %d", i]];
        }
        _dataSource = datas.copy;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"隐藏导航栏";

    [self setUpTableView];
    
    [self setUpNavView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)setUpNavView {
    // 获取状态栏高度
    CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
//    NSLog(@"%f", statusBarHeight);
    
    self.navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, statusBarHeight + 44)];
    _navView.alpha = 0;
    _navView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_navView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, statusBarHeight, self.view.bounds.size.width, 44)];
    titleLabel.text = @"隐藏导航栏";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
    [_navView addSubview:titleLabel];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(12, statusBarHeight, 44, 44)];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [_navView addSubview:backButton];

}

- (void)backButtonClicked {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setUpTableView {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    if (@available(iOS 11.0, *)) {
        tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 200)];
    headerView.backgroundColor = [UIColor orangeColor];
    tableView.tableHeaderView = headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", _dataSource[indexPath.row]];
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat distance = 200 - _navView.bounds.size.height;
    
    CGFloat percent = scrollView.contentOffset.y / distance;
    // 让 百分比 保持在 [0, 1]
    percent = MAX(0, MIN(1, percent));
    
    _navView.alpha = percent;
}

@end
