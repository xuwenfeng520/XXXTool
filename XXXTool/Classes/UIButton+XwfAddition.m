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

@end
