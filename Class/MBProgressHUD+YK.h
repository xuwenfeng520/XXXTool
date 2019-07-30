//
//  MBProgressHUD+YK.h
//  DoctorHelper
//
//  Created by 李童 on 2017/9/4.
//  Copyright © 2017年 李童. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (YK)
#pragma mark - UIViewController
+ (MBProgressHUD *)showHUDAddedToViewController:(UIViewController *)viewController animated:(BOOL)animated;
+ (MBProgressHUD *)showHUDAddedTo:(UIViewController *)viewController loadingWithMessage:(NSString *)message;
+ (MBProgressHUD *)showHUDAddedTo:(UIViewController *)viewController message:(NSString *)message;
+ (MBProgressHUD *)showHUDAddedTo:(UIViewController *)viewController successMessage:(NSString *)message;
+ (MBProgressHUD *)showHUDAddedTo:(UIViewController *)viewController error:(NSError *)error;
+ (MBProgressHUD *)showHUDAddedTo:(UIViewController *)viewController errorMessage:(NSString *)message;
+ (void)dismissForViewController:(UIViewController *)viewController;
#pragma mark - self show
- (void)showMessage:(NSString *)message;
- (void)showLoadingWithMessage:(NSString *)message;
- (void)showSuccessMessage:(NSString *)message;
- (void)showErrorMessage:(NSString *)message;
@end
