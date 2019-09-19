//
//  UIViewController+PopupWindow.m
//  LsdApp
//
//  Created by xuwenfeng on 2018/9/7.
//  Copyright © 2018 xuwenfeng. All rights reserved.
//

#import "UIViewController+PopupWindow.h"

@implementation UIViewController (PopupWindow) //YESBlock

- (UIViewController *)topViewController
{
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

- (UIViewController *)_topViewController:(UIViewController *)vc
{
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}


- (void)showRemindingWithMessage:(NSString*)message
                   leftButtonSrt:(NSString*)leftButtonSrt
                  rightButtonStr:(NSString*)rightButtonStr
                leftButtonAction:(void(^)(void))leftButtonAction
               rightButtonAction:(void(^)(void))rightButtonAction
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:leftButtonSrt style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if(leftButtonAction)leftButtonAction();
    }];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:rightButtonStr style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if(rightButtonAction)rightButtonAction();
    }];
    [alertController addAction:action];
    [alertController addAction:action1];
    [self presentViewController:alertController animated:YES completion:nil];
}



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


-(void)showInpuWindowWithTitle:(NSString*)title message:(NSString*)mseeage inpuStr:(NSString*)inpuSrt yesStr:(NSString*)yesStr noStr:(NSString*)noStr yesBlock:(void(^)(NSString*str))yesBlock{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:mseeage preferredStyle:UIAlertControllerStyleAlert];
    //增加确定按钮；
    [alertController addAction:[UIAlertAction actionWithTitle:yesStr style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //获取第1个输入框；
        UITextField *userNameTextField = alertController.textFields.firstObject;
        NSString *strr = userNameTextField.text;
        if(strr.length<1)strr = nil;
        if(yesBlock)yesBlock(strr);
//        if(yesBlock)yesBlock(@"很黄很暴力");
        
    }]];
    
    //增加取消按钮；
    [alertController addAction:[UIAlertAction actionWithTitle:noStr style:UIAlertActionStyleDefault handler:nil]];
    
    //定义第一个输入框；
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = inpuSrt;
    }];
    [self presentViewController:alertController animated:true completion:nil];

}

@end
