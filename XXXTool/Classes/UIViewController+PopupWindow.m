//
//  UIViewController+PopupWindow.m
//  LsdApp
//
//  Created by xuwenfeng on 2018/9/7.
//  Copyright © 2018 xuwenfeng. All rights reserved.
//

#import "UIViewController+PopupWindow.h"

@implementation UIViewController (PopupWindow) //YESBlock
- (void)showRemindWithTitle:(NSString*)title message:(NSString*)message YESName:(NSString*)yes NOName:(NSString*)no YESBlock:(void(^)(void))YESBlock NOBlock:(void(^)(void))NOBlock{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert]; //最后的参数可以改成底部下面弹窗
    
    if(yes){
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:yes style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if(YESBlock)YESBlock();
        }];
        [alertController addAction:action1];
    }
    if(no){
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:no style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if(NOBlock)NOBlock();
        }];
        [alertController addAction:action2];
    }
    

    [self presentViewController:alertController animated:YES completion:nil];

    
}

- (void)showRemindWithmessage:(NSString*)message{
    [self showRemindWithTitle:message message:nil YESName:@"确定" NOName:nil YESBlock:nil NOBlock:nil];
}
@end
