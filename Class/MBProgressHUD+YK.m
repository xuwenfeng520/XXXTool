//
//  MBProgressHUD+YK.m
//  DoctorHelper
//
//  Created by 李童 on 2017/9/4.
//  Copyright © 2017年 李童. All rights reserved.
//

#import "MBProgressHUD+YK.h"

@implementation MBProgressHUD (YK)
#pragma mark - UIViewController
+ (MBProgressHUD *)showHUDAddedToViewController:(UIViewController *)viewController animated:(BOOL)animated{
     MBProgressHUD *hud = [MBProgressHUD HUDForView:viewController.view];
    if (hud) {
        return hud;
    }
    return [MBProgressHUD showHUDAddedTo:viewController.view animated:animated];
}

+ (MBProgressHUD *)showHUDAddedTo:(UIViewController *)viewController loadingWithMessage:(NSString *)message{
    MBProgressHUD *hud = [self showHUDAddedToViewController:viewController animated:YES];
    [hud showLoadingWithMessage:message];
    return hud;
}
+ (MBProgressHUD *)showHUDAddedTo:(UIViewController *)viewController message:(NSString *)message{
    MBProgressHUD *hud = [self showHUDAddedToViewController:viewController animated:YES];
    [hud showMessage:message];
    return hud;
}
+ (MBProgressHUD *)showHUDAddedTo:(UIViewController *)viewController successMessage:(NSString *)message{
    MBProgressHUD *hud = [self showHUDAddedToViewController:viewController animated:YES];
    [hud showSuccessMessage:message];
    return hud;
}
+ (MBProgressHUD *)showHUDAddedTo:(UIViewController *)viewController error:(NSError *)error{
    MBProgressHUD *hud = [self showHUDAddedToViewController:viewController animated:YES];
    [hud showError:error];
    return hud;
}
+ (MBProgressHUD *)showHUDAddedTo:(UIViewController *)viewController errorMessage:(NSString *)message{
    MBProgressHUD *hud = [self showHUDAddedToViewController:viewController animated:YES];
    [hud showErrorMessage:message];
    return hud;
}
+ (void)dismissForViewController:(UIViewController *)viewController{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:viewController.view];
    [hud dismiss];
}
#pragma mark - self show
- (void)showMessage:(NSString *)message{
    self.mode = MBProgressHUDModeCustomView;
    // Set an image view with a checkmark.
    UIImage *image = [[UIImage imageNamed:@"message_info"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.customView = [[UIImageView alloc] initWithImage:image];
    // Looks a bit nicer if we make it square.
    self.square = YES;
    // Optional label text.
    self.label.text = message;
    [self hideAnimated:YES afterDelay:0.5];
}
- (void)showLoadingWithMessage:(NSString *)message{
    self.mode = MBProgressHUDModeIndeterminate;
    self.label.text =message;
}
- (void)showError:(NSError *)error{
    [self showErrorMessage:error.localizedDescription];
}
- (void)showSuccessMessage:(NSString *)message{
    self.mode = MBProgressHUDModeCustomView;
    // Set an image view with a checkmark.
    UIImage *image = [[UIImage imageNamed:@"message_success"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.customView = [[UIImageView alloc] initWithImage:image];
    // Looks a bit nicer if we make it square.
    self.square = YES;
    // Optional label text.
    self.label.text = message;
    [self hideAnimated:YES afterDelay:0.5];
}
- (void)showErrorMessage:(NSString *)message{
    self.mode = MBProgressHUDModeCustomView;
    // Set an image view with a checkmark.
    UIImage *image = [[UIImage imageNamed:@"message_error"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.customView = [[UIImageView alloc] initWithImage:image];
    // Looks a bit nicer if we make it square.
    self.square = YES;
    // Optional label text.
    self.label.text = message;
    [self hideAnimated:YES afterDelay:0.5];
}
- (void)dismiss{
    [self hideAnimated:YES afterDelay:0];
}
@end
