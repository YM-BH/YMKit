//
//  UIViewController+BHExtension.h
//  UIAlertControllerDemo
//
//  Created by iOS- on 2019/5/24.
//  Copyright © 2019 Lazyload. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AlertActionBlock)(void);
typedef void(^ActionSheetActionBlock)(UIAlertAction *action);

@interface UIViewController (BHExtension)

/// 展示系统的 alert
- (void)bh_showAlertStyleWithTitle:(NSString *)title message:(NSString *)message rightActionTitle:(NSString *)rightActionTitle leftActionTitle:(NSString *)leftActionTitle rightActionCompletion:(AlertActionBlock)rightActionCompletion leftActionCompletion:(AlertActionBlock)leftActionCompletion;

/// 展示系统的 actionsheet
- (void)bh_showActionSheetStyleWithTitle:(NSString *)title message:(NSString *)messsge actionsArray:(NSArray <NSString *>*)actionsArray completion:(ActionSheetActionBlock)completion;

@end

