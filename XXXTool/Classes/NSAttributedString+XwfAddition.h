//
//  NSAttributedString+XwfAddition.h
//
//  Created by 徐文逢 on 2016/10/19.
//  Copyright © 2016年 徐文逢. All rights reserved.
//


#import <UIKit/UIKit.h>
@interface NSAttributedString (XwfAddition)
/// 使用图像和文本生成上下排列的属性文本
///
/// @param image      图像
/// @param imageWH    图像宽高
/// @param title      标题文字
/// @param fontSize   标题字体大小
/// @param titleColor 标题颜色
/// @param spacing    图像和标题间距
///
/// @return 属性文本
+ (instancetype)xwf_imageTextWithImage:(UIImage *)image
                              imageWH:(CGFloat)imageWH
                                title:(NSString *)title
                             fontSize:(CGFloat)fontSize
                           titleColor:(UIColor *)titleColor
                              spacing:(CGFloat)spacing;

@end
