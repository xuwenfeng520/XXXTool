//
//  XXXBasisVC.h
//  LSDK10DEMO
//
//  Created by xuwenfeng on 2019/4/11.
//  Copyright © 2019 xuwenfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+HUD.h"
NS_ASSUME_NONNULL_BEGIN

@interface XXXBasisVC : UIViewController

-(void)setXxxNavigationBar;
- (void)hideTabBar;
- (void)showTabBar;
/**
 设置阴影

 @param view <#view description#>
 */
-(void)setShadowForView:(UIView*)view;

/**
 设置圆角

 @param radius <#radius description#>
 @param line <#line description#>
 @param color <#color description#>
 @param view <#view description#>
 */
-(void)setCornerRadius:(int)radius line:(int)line lineColor:(UIColor*)color ForView:(UIView*)view;

/**
  设置圆角

 @param radius <#radius description#>
 @param view <#view description#>
 */
-(void)setCornerRadius:(int)radius ForView:(UIView*)view;
//颜色转图片
-(UIImage*)createImageWithColor:(UIColor*)color;


@end

NS_ASSUME_NONNULL_END
