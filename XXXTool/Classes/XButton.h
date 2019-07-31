//
//  XButton.h
//  LsdApp
//
//  Created by xuwenfeng on 2018/9/6.
//  Copyright © 2018 xuwenfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XButton : UIButton

+(XButton*)xwfCreateWithtext:(NSString*)text font:(NSInteger)font textcolor:(UIColor*)textcolor bgColor:(UIColor*)bgColor action:(void(^)(void))action;
@end
