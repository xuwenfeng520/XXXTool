//
//  UIViewController+PopupWindow.h
//  LsdApp
//
//  Created by xuwenfeng on 2018/9/7.
//  Copyright © 2018 xuwenfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (PopupWindow)
- (UIViewController *)topViewController;

- (void)showRemindingWithMessage:(NSString*)message
                   leftButtonSrt:(NSString*)leftButtonSrt
                  rightButtonStr:(NSString*)rightButtonStr
                leftButtonAction:(void(^)(void))leftButtonAction
               rightButtonAction:(void(^)(void))rightButtonAction;


- (void)showRemindWithmessage:(NSString*)message;
- (void)showRemindWithTitle:(NSString*)title message:(NSString*)message YESName:(NSString*)yes NOName:(NSString*)no YESBlock:(void(^)(void))YESBlock NOBlock:(void(^)(void))NOBlock;
//输入框
-(void)showInpuWindowWithTitle:(NSString*)title message:(NSString*)mseeage inpuStr:(NSString*)inpuSrt yesStr:(NSString*)yesStr noStr:(NSString*)noStr yesBlock:(void(^)(NSString*str))yesBlock;

-(void)showInpuWindowWithTitle:(NSString*)title message:(NSString*)mseeage inpuStr:(NSString*)inpuSrt yesStr:(NSString*)yesStr noStr:(NSString*)noStr yesBlock:(void(^)(NSString*str))yesBlock noBlock:(void(^)(void))noBlock;
@end
