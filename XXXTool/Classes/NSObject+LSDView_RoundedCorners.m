//
//  NSObject+LSDView_RoundedCorners.m
//  LsdApp
//
//  Created by xuwenfeng on 2018/8/21.
//  Copyright © 2018 xuwenfeng. All rights reserved.
//

#import "NSObject+LSDView_RoundedCorners.h"

@implementation NSObject (LSDView_RoundedCorners)
-(void)configurationView:(UIView*)view withCorners:(CGFloat)corners borderWidth:(CGFloat)borderWidth borderColor:(UIColor*)borderColor{
    if(corners)view.layer.cornerRadius=corners;
    if(borderWidth)view.layer.borderWidth = borderWidth;
    if(borderColor)view.layer.borderColor = borderColor.CGColor;
    view.layer.masksToBounds = YES;
}
@end
