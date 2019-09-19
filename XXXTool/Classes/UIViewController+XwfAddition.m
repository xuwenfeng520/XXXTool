//
//  UIViewController+XwfAddition.m
//  XXXTool
//
//  Created by 徐文逢 on 2019/8/7.
//  Copyright © 2019 徐文逢. All rights reserved.
//

#import "UIViewController+XwfAddition.h"

@implementation UIViewController (XwfAddition)

//将对象保存到本地沙盒
+(void)saveObjc:(NSObject*)objc name:(NSString*)name{
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES)lastObject];
    NSString *accountPath = [documentPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.data",name]];
    //存
    [NSKeyedArchiver archiveRootObject:objc toFile:accountPath];
}
//从bundle文件中获取对象
+(NSObject*)getObjcWithName:(NSString*)name{
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"data"];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}
//复制对象
+(NSObject*)copyWithObjcL:(NSObject*)objc{
    return [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:objc]];
}



+(void)setShadowForView:(UIView*)view Opacity:(float)Opacity Radius:(CGFloat)Radius{
    //    self.backgroundColor = [UIColor whiteColor];
    view.layer.masksToBounds = NO;
    view.layer.shadowOpacity = Opacity;
    view.layer.shadowOffset = CGSizeZero;
    view.layer.shadowRadius = Radius;
}
+(void)setCornerRadius:(int)radius line:(int)line lineColor:(UIColor*)color ForView:(UIView*)view{
    if(radius)view.layer.cornerRadius=radius;
    if(line)view.layer.borderWidth=line;
    if(color)view.layer.borderColor = color.CGColor;
    view.layer.masksToBounds = YES;
}
+(void)setCornerRadius:(int)radius ForView:(UIView*)view{
    if(radius)view.layer.cornerRadius=radius;
    view.layer.masksToBounds = YES;
}
+ (BOOL)getIsIpad
{
    NSString *deviceType = [UIDevice currentDevice].model;
    
    if([deviceType isEqualToString:@"iPhone"]) {
        //iPhone
        return NO;
    }
    else if([deviceType isEqualToString:@"iPod touch"]) {
        //iPod Touch
        return NO;
    }
    else if([deviceType isEqualToString:@"iPad"]) {
        //iPad
        return YES;
    }
    return NO;
    
    //这两个防范判断不准，不要用
    //#define is_iPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    //
    //#define is_iPad (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
}
@end
