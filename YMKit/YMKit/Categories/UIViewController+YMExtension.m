//
//  UIViewController+BHExtension.m
//  UIAlertControllerDemo
//
//  Created by iOS- on 2019/5/24.
//  Copyright © 2019 Lazyload. All rights reserved.
//

#import "UIViewController+YMExtension.h"

@implementation UIViewController (YMExtension)
- (void)bh_showAlertStyleWithTitle:(NSString *)title message:(NSString *)message rightActionTitle:(NSString *)rightActionTitle leftActionTitle:(NSString *)leftActionTitle rightActionCompletion:(AlertActionBlock)rightActionCompletion leftActionCompletion:(AlertActionBlock)leftActionCompletion {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    if (leftActionTitle != nil) {
        UIAlertAction *leftAction = [UIAlertAction actionWithTitle:leftActionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (leftActionCompletion) {
                leftActionCompletion();
            }
        }];
        
        [alertController addAction:leftAction];
    }
    
    
    if (rightActionTitle != nil) {
        UIAlertAction *rightAction = [UIAlertAction actionWithTitle:rightActionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            if (rightActionCompletion) {
                rightActionCompletion();
            }
        }];
        
        [alertController addAction:rightAction];

    }

    
    [self presentViewController:alertController animated:YES completion:nil];
    
}


- (void)bh_showActionSheetStyleWithTitle:(NSString *)title message:(NSString *)messsge actionsArray:(NSArray <NSString *>*)actionsArray completion:(ActionSheetActionBlock)completion {
    
    if (actionsArray == nil || actionsArray.count == 0) {
        return;
    }
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:title message:messsge preferredStyle:UIAlertControllerStyleActionSheet];
    
    for (NSString *actionTitle in actionsArray) {
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            if (completion) {
                completion(action);
            }
            
        }];
        
        [actionSheet addAction:alertAction];
    }
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    
    [actionSheet addAction:cancelAction];
    
    [self presentViewController:actionSheet animated:YES completion:nil];
}
@end
