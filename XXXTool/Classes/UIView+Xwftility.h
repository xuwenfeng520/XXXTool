//
//  UIView+Xwfility.h
//
//  Created by 徐文逢 on 16/9/17.
//  Copyright © 2016年 徐文逢. All rights reserved.
//




#import <UIKit/UIKit.h>

@interface UIView (ZUtility)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

//颜色转图片
-(UIImage*)createImageWithColor:(UIColor*)color;
//快速创建颜色图片
+(UIView*)xxxViewWithColor:(UIColor*)color;

-(void)xxxSetCornerRadius:(int)radius line:(int)line lineColor:(UIColor*)color;
-(void)xxxSetCornerRadius:(int)radius;
@end
