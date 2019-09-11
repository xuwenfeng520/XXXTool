//
//  UIViewController+XwfAddition.h
//  XXXTool
//
//  Created by 徐文逢 on 2019/8/7.
//  Copyright © 2019 徐文逢. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (XwfAddition)
    /**
     设置阴影
     
     @param view 视图
     */
+(void)setShadowForView:(UIView*)view Opacity:(float)Opacity Radius:(CGFloat)Radius;
    
    /**
     设置圆角
     
     @param radius 弧度
     @param line 描边
     @param color 颜色
     @param view 视图
     */
+(void)setCornerRadius:(int)radius line:(int)line lineColor:(UIColor*)color ForView:(UIView*)view;
    
    /**
     设置圆角
     
     @param radius 弧度
     @param view 视图
     */
+(void)setCornerRadius:(int)radius ForView:(UIView*)view;
+ (BOOL)getIsIpad;
@end

