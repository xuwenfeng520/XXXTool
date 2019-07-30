//
//  UIViewController+HUD.m
//  DoctorHelper
//
//  Created by 李童 on 2017/9/4.
//  Copyright © 2017年 李童. All rights reserved.
//

#import "UIViewController+HUD.h"
@implementation UIViewController (HUD)
- (MBProgressHUD *)showHudMessage:(NSString *)message{
    return [MBProgressHUD showHUDAddedTo:self message:message];
}
- (MBProgressHUD *)showHudLoadingWithMessage:(NSString *)message{
    return [MBProgressHUD showHUDAddedTo:self loadingWithMessage:message];
}
- (MBProgressHUD *)showHudSuccessMessage:(NSString *)message{
    return [MBProgressHUD showHUDAddedTo:self successMessage:message];
}
- (MBProgressHUD *)showHudError:(NSError *)error{
    return [MBProgressHUD showHUDAddedTo:self error:error];
}
- (MBProgressHUD *)showHudErrorMessage:(NSString *)message{
    return [MBProgressHUD showHUDAddedTo:self errorMessage:message];
}
- (void)dismissHud{
    [MBProgressHUD dismissForViewController:self];
}
@end
