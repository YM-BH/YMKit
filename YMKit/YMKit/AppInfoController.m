//
//  AppInfoController.m
//  YMKit
//
//  Created by 白晗 on 2021/9/14.
//

#import "AppInfoController.h"
#import "AppInfoCell.h"
#import "AppInfoUtil.h"

@interface AppInfoController () <UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;
@end

@implementation AppInfoController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];

    [self loadData];
}

- (void)setupUI {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    [self.tableView registerClass:[AppInfoCell class] forCellReuseIdentifier:NSStringFromClass([AppInfoCell class])];
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (void)loadData {


    NSArray *datas = @[
        @{
            @"title": @"是否为模拟器",
            @"content": [AppInfoUtil isSimulator] ? @"是模拟器" : @"不是模拟器"
        },

        @{
            @"title": @"是否为iPad",
            @"content": [AppInfoUtil isIpad] ? @"是iPad" : @"不是iPad"
        },
        @{
            @"title": @"手机型号",
            @"content": [AppInfoUtil iPhoneType]
        }
    ];

    self.dataSource = datas;
    [self.tableView reloadData];

}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSDictionary *dict = self.dataSource[indexPath.row];

    AppInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AppInfoCell class]) forIndexPath:indexPath];

    cell.titleLabel.text = dict[@"title"];
    cell.contentLabel.text = dict[@"content"];

    return cell;
}


@end
