//
//  UIViewController+PopupWindow.h
//  LsdApp
//
//  Created by xuwenfeng on 2018/9/7.
//  Copyright © 2018 xuwenfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (PopupWindow)
- (void)showRemindWithmessage:(NSString*)message;
- (void)showRemindWithTitle:(NSString*)title message:(NSString*)message YESName:(NSString*)yes NOName:(NSString*)no YESBlock:(void(^)(void))YESBlock NOBlock:(void(^)(void))NOBlock;
@end
