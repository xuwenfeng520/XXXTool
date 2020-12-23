//
//  UILabel+XwfAddition.m
//  XWF
//
//  Created by 徐文逢 on 16/9/17.
//  Copyright © 2016年 徐文逢. All rights reserved.
//

#import "UILabel+XwfAddition.h"
#import "NSObject+XwfAddition.h"
@implementation UILabel (XwfAddition)
    /*
     这个方法相当于给UILabel添加了一个快速创建它对象的类方法，并且有指定构造参数
     
     因为很多地方都需要创建label，并且需要设置它的文本、颜色、字体，因此我们封装这个方法
     后面再创建label的时候就可以节省少写很多代码
     */
+(instancetype)xwf_labelWithText:(NSString *)text andFontSize:(NSInteger)fontSize andColor:(UIColor *)color{
    
    //创建Label
    UILabel *lbl = [[self alloc] init];
    
    //设置文字为传进来的文字
    lbl.text = text;
    
    //设置文字大小为传进来的大小
    lbl.font = [UIFont systemFontOfSize:fontSize];
    
    //设置文字颜色
    lbl.textColor = color;
    
    return lbl;
    
}
    
+(UILabel*)xxxLabelCreateWithStr:(NSString*)str Color:(UIColor*)Color Font:(CGFloat)Font{
//    BOOL isnull = [str isKindOfClass:[NSNull class]];
//    NSLog(@"是否%d",isnull);
//    str = [str isKindOfClass:[NSNull class]]?@"":str;
    UILabel *lab = [UILabel new];
    lab.text = str;
    lab.textColor = Color;
    lab.font = [UIFont systemFontOfSize:Font];
    return lab;
}
@end
