//
//  UIViewController+HUD.h
//  DoctorHelper
//
//  Created by 李童 on 2017/9/4.
//  Copyright © 2017年 李童. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD+YK.h"
@interface UIViewController (HUD)
- (MBProgressHUD *)showHudMessage:(NSString *)message;
- (MBProgressHUD *)showHudLoadingWithMessage:(NSString *)message;
- (MBProgressHUD *)showHudSuccessMessage:(NSString *)message;
- (MBProgressHUD *)showHudError:(NSError *)error;
- (MBProgressHUD *)showHudErrorMessage:(NSString *)message;
- (void)dismissHud;


@end
