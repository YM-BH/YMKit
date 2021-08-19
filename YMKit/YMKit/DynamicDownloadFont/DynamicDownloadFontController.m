//
//  DynamicDownloadFontViewController.m
//  YMKit
//
//  Created by 白晗 on 2021/5/11.
//

#import "DynamicDownloadFontController.h"
#import "Fonts.h"

@interface DynamicDownloadFontController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UILabel *someLabel;
@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic, strong) NSArray *fontNames;

@end

@implementation DynamicDownloadFontController

- (void)viewDidLoad {
	[super viewDidLoad];
	_fontNames = @[
		@{
		        @"fontName": @"娃娃体",
		        @"postScript": @"DFWaWaSC-W5"
		},
		@{
		        @"fontName": @"华文楷体",
		        @"postScript": @"STKaiti"
		},
		@{
		        @"fontName": @"黑体",
		        @"postScript": @"STHeitiSC-Light"
		}
	];

	[self layoutUI];
}

- (void)layoutUI {
	self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 350)];
	self.tableView.dataSource = self;
	self.tableView.delegate = self;
	[self.view addSubview:self.tableView];

    self.someLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(self.tableView.frame) + 100, self.view.bounds.size.width - 30, 200)];
    self.someLabel.numberOfLines = 0;
    self.someLabel.text = @"整体厚度的提高可能是由于苹果希望在较新的机型中使用更大的电池。根据之前的报道，据说iPhone 13 Pro和iPhone 13 Pro Max采用了三星的120Hz LTPO OLED屏幕和高通的Snapdragon X60 5G调制解调器。这两款产品同时运行将意味着巨大的电池消耗，因此需要更大的电池来抵消这些负面影响。";
    [self.view addSubview:self.someLabel];

}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.fontNames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	NSString *fontName = self.fontNames[indexPath.row][@"fontName"];

	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
	}

	cell.textLabel.text = fontName;

	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString *postScript = self.fontNames[indexPath.row][@"postScript"];
	[Fonts loadFontWithFontName:postScript size:20 progress:^(CGFloat progressValue) {
	         NSLog(@"%f", progressValue);
	 } completion:^(UIFont *font, NSString *errorMsg) {
	         NSLog(@"%@", errorMsg);
	         self.someLabel.font = font;
	 }];
}

@end
