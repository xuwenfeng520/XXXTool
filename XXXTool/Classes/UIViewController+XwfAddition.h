//
//  UIViewController+XwfAddition.h
//  XXXTool
//
//  Created by 徐文逢 on 2019/8/7.
//  Copyright © 2019 徐文逢. All rights reserved.
//

#import <UIKit/UIKit.h>
#define KViewController [UIViewController new]
@interface UIViewController (XwfAddition)
//将对象保存到本地沙盒
+(void)saveObjc:(NSObject*)objc name:(NSString*)name;
//从bundle文件中获取对象
+(NSObject*)getObjcWithName:(NSString*)name;
//复制对象
+(NSObject*)copyWithObjcL:(NSObject*)objc;


//设置阴影
+(void)setShadowForView:(UIView*)view Opacity:(float)Opacity Radius:(CGFloat)Radius;
//设置圆角 radius 弧度 line 描边 color 颜色 view 视图
+(void)setCornerRadius:(int)radius line:(int)line lineColor:(UIColor*)color ForView:(UIView*)view;
//设置圆角 radius 弧度 view 视图
+(void)setCornerRadius:(int)radius ForView:(UIView*)view;
//判断是不是平板
+ (BOOL)getIsIpad;
//判断设备是不是ipad
- (NSString*)deviceVersion;
//隐藏tab推出控制器
-(void)hiddenTbaBarPushViewController:(UIViewController*)viewController;
//判断屏幕类型尺寸
-(NSString*)judgmentScreenType;


//画虚线
- (void)addBorderToLayer:(UIView *)view;

@end

