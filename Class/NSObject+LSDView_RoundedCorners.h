//
//  NSObject+LSDView_RoundedCorners.h
//  LsdApp
//
//  Created by xuwenfeng on 2018/8/21.
//  Copyright © 2018 xuwenfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSObject (LSDView_RoundedCorners)
-(void)configurationView:(UIView*)view withCorners:(CGFloat)corners borderWidth:(CGFloat)borderWidth borderColor:(UIColor*)borderColor;
@end
