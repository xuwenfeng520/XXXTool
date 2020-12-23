//
//  UIButton+XwfAddition.m
//  XXXTool
//
//  Created by 徐文逢 on 2019/8/7.
//  Copyright © 2019 徐文逢. All rights reserved.
//

#import "UIButton+XwfAddition.h"

@implementation UIButton (XwfAddition)
+(UIButton*)xxxButtonCreateWithImageName:(NSString*)ImageName target:(nullable id)target action:(SEL)action{
    UIButton *btn = [UIButton new];
    [btn setBackgroundImage:[UIImage imageNamed:ImageName] forState:(UIControlStateNormal)];
    [btn addTarget:target action:action forControlEvents:(UIControlEventTouchUpInside)];
    return btn;
}

+(UIButton*)xxxButtonCreateWithTitle:(NSString *)title color:(UIColor*)color font:(CGFloat)font target:(id)target action:(SEL)action{
    UIButton *btn = [UIButton new];
    if(title)[btn setTitle:title forState:(UIControlStateNormal)];
    if(color)[btn setTitleColor:color forState:(UIControlStateNormal)];
    if(font>0){
        btn.titleLabel.font = [UIFont systemFontOfSize:font];
    }
    [btn addTarget:target action:action forControlEvents:(UIControlEventTouchUpInside)];
    return btn;
}
-(void)xxxButtonSetTitle:(NSString *)title color:(UIColor*)color font:(CGFloat)font fstate:(UIControlState)state{
    if(title)[self setTitle:title forState:(state)];
    if(color)[self setTitleColor:color forState:(state)];
    if(font>0){
        self.titleLabel.font = [UIFont systemFontOfSize:font];
    }
    
}
@end
