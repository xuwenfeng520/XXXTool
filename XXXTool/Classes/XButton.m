//
//  XButton.m
//  LsdApp
//
//  Created by xuwenfeng on 2018/9/6.
//  Copyright © 2018 xuwenfeng. All rights reserved.
//

#import "XButton.h"
@interface XButton ()
@property (copy , nonatomic)void(^action)(void);
@end


@implementation XButton

+(XButton*)xwfCreateWithtext:(NSString*)text font:(NSInteger)font textcolor:(UIColor*)textcolor bgColor:(UIColor*)bgColor action:(void(^)(void))action{
    XButton *temp = [XButton new];
    [temp setTitle:text forState:(UIControlStateNormal)];
    temp.titleLabel.font = [UIFont systemFontOfSize:font];
    [temp setTitleColor:textcolor forState:(UIControlStateNormal)];
    [temp setBackgroundColor:bgColor];
    [temp addTarget:temp action:@selector(tempAction:) forControlEvents:(UIControlEventTouchUpInside)];
    if(action)temp.action = action;
    
    return temp;
}
-(void)tempAction:(XButton*)sender{
    if(sender.action)sender.action();
}
@end
