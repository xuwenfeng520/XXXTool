//
//  UIButton+XwfAddition.h
//  XXXTool
//
//  Created by 徐文逢 on 2019/8/7.
//  Copyright © 2019 徐文逢. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIButton (XwfAddition)

+(UIButton*)xxxButtonCreateWithImageName:(NSString*)ImageName target:(nullable id)target action:(SEL)action;

+(UIButton*)xxxButtonCreateWithTitle:(NSString *)title color:(UIColor*)color font:(CGFloat)font target:(id)target action:(SEL)action;

-(void)xxxButtonSetTitle:(NSString *)title color:(UIColor*)color font:(CGFloat)font fstate:(UIControlState)state;
@end


