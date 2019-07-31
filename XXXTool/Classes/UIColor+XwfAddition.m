//
//  UIColor+XwfAddition.m
//  XWF
//
//  Created by 徐文逢 on 16/9/17.
//  Copyright © 2016年 徐文逢. All rights reserved.
//

#import "UIColor+XwfAddition.h"

@implementation UIColor (XwfAddition)

+(instancetype)xwf_colorWithHex:(NSInteger)hex
                       andAlpha:(CGFloat)alpha
{
    
    int r = (hex & 0xff0000) >> 16;
    int g = (hex & 0x00ff00) >> 8;
    int b = hex & 0x0000ff;
    
    return [self colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:alpha];
}

+(instancetype)xwf_randomColor
{
    return [UIColor colorWithRed:arc4random_uniform(256) / 255.0
                           green:arc4random_uniform(256) / 255.0
                            blue:arc4random_uniform(256) / 255.0
                           alpha:1.0];
}

+ (UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}
@end
