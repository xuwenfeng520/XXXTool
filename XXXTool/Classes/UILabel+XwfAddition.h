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
@end
