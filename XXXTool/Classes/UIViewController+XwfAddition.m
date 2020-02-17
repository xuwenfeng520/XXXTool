//
//  UIViewController+XwfAddition.m
//  XXXTool
//
//  Created by 徐文逢 on 2019/8/7.
//  Copyright © 2019 徐文逢. All rights reserved.
//

#import "UIViewController+XwfAddition.h"
#import "sys/utsname.h"
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
- (NSString*)deviceVersion{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,3"]) return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone9,4"]) return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone10,1"]) return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,4"]) return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,2"]) return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,5"]) return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,3"]) return @"iPhone X";
    if ([platform isEqualToString:@"iPhone10,6"]) return @"iPhone X";
    if ([platform isEqualToString:@"iPhone11,8"]) return @"iPhone XR";
    if ([platform isEqualToString:@"iPhone11,2"]) return @"iPhone XS";
    if ([platform isEqualToString:@"iPhone11,6"]) return @"iPhone XS Max";
    if ([platform isEqualToString:@"iPhone11,4"]) return @"iPhone XS Max";
    if ([platform isEqualToString:@"i386"])return@"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])return @"iPhone Simulator";
    return platform;
}
-(void)hiddenTbaBarPushViewController:(UIViewController*)viewController{
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:viewController animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}
-(NSString*)judgmentScreenType{
    int sheight =[UIScreen mainScreen].bounds.size.height;
    int swidth =[UIScreen mainScreen].bounds.size.width;
    int ww = swidth<sheight?swidth:sheight;
    int hh = swidth>sheight?swidth:sheight;
    NSLog(@"%d-%d",ww,hh);
    NSString *sc;
    if(ww==320&&hh==480){
        sc = @"3.5"; //4:3 0.75
    }else if (ww==320&&hh==568){
        sc = @"4"; //16:9 0.56
    }else if (ww==375&&hh==667){
        sc = @"4.7"; //16:9 0.56
    }else if(ww==414&&hh==736){
        sc = @"5.5"; //16:9 0.56
    }else if(ww==375&&hh==812){
        sc = @"5.8"; //0.46
    }else if(ww==414&&hh==896){
        sc = @"6.5"; //0.46
    }else if(ww==768&&hh==1024){ //开始平板
        sc = @"9.7"; //0.75
    }else if(ww==834&&hh==1112){ //开始平板
        sc = @"10.5"; //0.78
    }else if(ww==834&&hh==1194){ //开始平板
        sc = @"11";  //0.69
    }else if(ww==1024&&hh==1366){ //开始平板
        sc = @"12.9"; //0.75
    }
    return sc;
}


- (void)addBorderToLayer:(UIView *)view
{
    CAShapeLayer *border = [CAShapeLayer layer];
    
    border.strokeColor = [UIColor blackColor].CGColor;
    
    border.fillColor = nil;
    
    border.path = [UIBezierPath bezierPathWithRect:view.bounds].CGPath;
    
    border.frame = view.bounds;
    
    border.lineWidth = 2;
    
    border.lineCap = @"square";
    
    border.lineDashPattern = @[@16, @7];
    
    [view.layer addSublayer:border];
}


- (void)addlineToLayer:(UIView *)view aPoint:(CGPoint)aPoint bPoint:(CGPoint)bPoint color:(UIColor*)color
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:aPoint];
    [path addLineToPoint:bPoint];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = view.frame;
    layer.lineJoin = kCALineJoinMiter;
    layer.lineDashPattern = @[@(5),@(5)];
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = color.CGColor;
    layer.path = path.CGPath;
    [view.layer addSublayer:layer];
}
@end
