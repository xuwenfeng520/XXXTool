//
//  UILabel+XwfAddition.h
//  XWF
//
//  Created by 徐文逢 on 16/9/17.
//  Copyright © 2016年 徐文逢. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (XwfAddition)


/**
 *  快速创建UILabel对象的类方法，并且有指定构造参数
 *
 *  @param text     传入的文字对象
 *  @param fontSize 传入的文字的大小
 *  @param color    传入的文字颜色对象
 *
 *  @return 返回一个UILabel*对象
 */
+(instancetype)xwf_labelWithText:(NSString *)text andFontSize:(NSInteger)fontSize andColor:(UIColor *)color;
    
    /**
     创建Label
     
     @param str 文字
     @param Color 颜色
     @param Font 字号
     @return 返回Label
     */
+(UILabel*)xxxLabelCreateWithStr:(NSString*)str Color:(UIColor*)Color Font:(CGFloat)Font;
@end
