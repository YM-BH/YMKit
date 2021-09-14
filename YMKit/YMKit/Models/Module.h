//
//  Module.h
//  YMKit
//
//  Created by 白晗 on 2021/9/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Module : NSObject

/// 类型
@property (nonatomic, strong) NSNumber *type;
/// 模块名称
@property (nonatomic, copy) NSString *name;
/// 控制器的名称
@property (nonatomic, copy) NSString *controllerName;

@end

NS_ASSUME_NONNULL_END
