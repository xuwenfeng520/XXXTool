//
//  UIViewController+PushViewController.m
//  LsdApp
//
//  Created by xuwenfeng on 2018/8/21.
//  Copyright © 2018 xuwenfeng. All rights reserved.
//

#import "UIViewController+PushViewController.h"

@implementation UIViewController (PushViewController)
-(void)hiddenTbaBarPushViewController:(UIViewController*)viewController{
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:viewController animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}
@end
