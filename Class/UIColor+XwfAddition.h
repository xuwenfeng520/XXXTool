//
//  UIColor+XwfAddition.h
//  XWF
//
//  Created by 徐文逢 on 16/9/17.
//  Copyright © 2016年 徐文逢. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (XwfAddition)

/**
 *  根据传入的16进制值生成一个颜色对象
 *
 *  @param hex   传入的16进制颜色
 *  @param alpha 传入的透明度
 *
 *  @return 返回一个UIColor*颜色对象
 */
+(instancetype)xwf_colorWithHex:(NSInteger)hex andAlpha:(CGFloat)alpha;

//返回随机颜色
+(instancetype)xwf_randomColor;

+ (UIColor *) colorWithHexString: (NSString *)color;
@end
