//
//  XXXBasisVC.m
//  LSDK10DEMO
//
//  Created by xuwenfeng on 2019/4/11.
//  Copyright © 2019 xuwenfeng. All rights reserved.
//

#import "XXXBasisVC.h"
#import "XXXTool.h"
@interface XXXBasisVC ()

@end

@implementation XXXBasisVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //重新创建一个barButtonItem
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:loadStr(@"返回") style:UIBarButtonItemStylePlain target:nil action:nil];
    //设置backBarButtonItem即可
    self.navigationItem.backBarButtonItem = backItem;
    self.view.backgroundColor = [UIColor whiteColor];
}



- (void)hideTabBar {
    if (self.tabBarController.tabBar.hidden == YES) {
        return;
    }
    UIView *contentView;
    if ( [[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] )
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    else
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    contentView.frame = CGRectMake(contentView.bounds.origin.x,  contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height + self.tabBarController.tabBar.frame.size.height);
    self.tabBarController.tabBar.hidden = YES;
    
}
//显示TabBar
- (void)showTabBar

{
    if (self.tabBarController.tabBar.hidden == NO)
    {
        return;
    }
    UIView *contentView;
    if ([[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]])
        
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    
    else
        
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    contentView.frame = CGRectMake(contentView.bounds.origin.x, contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height - self.tabBarController.tabBar.frame.size.height);
    self.tabBarController.tabBar.hidden = NO;
    
}
-(void)setShadowForView:(UIView*)view{
//    self.backgroundColor = [UIColor whiteColor];
    view.layer.masksToBounds = NO;
    view.layer.shadowOpacity = 0.2;
    view.layer.shadowOffset = CGSizeZero;
    view.layer.shadowRadius = 1;
}
-(void)setCornerRadius:(int)radius line:(int)line lineColor:(UIColor*)color ForView:(UIView*)view{
    if(radius)view.layer.cornerRadius=radius;
    if(line)view.layer.borderWidth=line;
    if(color)view.layer.borderColor = color.CGColor;
    view.layer.masksToBounds = YES;
}
-(void)setCornerRadius:(int)radius ForView:(UIView*)view{
    if(radius)view.layer.cornerRadius=radius;
    view.layer.masksToBounds = YES;
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

////旋转屏幕
//- (BOOL)shouldAutorotate{
//    return NO;
//}
//
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
//    return UIInterfaceOrientationMaskPortrait;
//}
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
//    return UIInterfaceOrientationPortrait;
//}
//颜色转图片
-(UIImage*)createImageWithColor:(UIColor*)color{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
//
//- (BOOL)prefersHomeIndicatorAutoHidden { //隐藏底部横条
//    return YES;
//}
-(UIRectEdge)preferredScreenEdgesDeferringSystemGestures  //上下手势防误触 和隐藏底部横条不可以同时使用
{
    return UIRectEdgeAll;
}
@end
