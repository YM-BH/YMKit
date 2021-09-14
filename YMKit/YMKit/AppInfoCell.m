//
//  AppInfoCell.m
//  YMKit
//
//  Created by 白晗 on 2021/9/14.
//

#import "AppInfoCell.h"
#import <Masonry/Masonry.h>

@implementation AppInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    
    self.titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.titleLabel];
    
    self.contentLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.contentLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(15);
        make.centerY.equalTo(self.contentView);
    }];
    
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-15);
        make.centerY.equalTo(self.contentView);
    }];
    
}
@end
