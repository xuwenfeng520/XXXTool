//
//  XWFCountdownBtn.m
//  倒计时按钮
//
//  Created by xwf on 2017/10/10.
//  Copyright © 2017年 xwf. All rights reserved.
//

#import "XWFCountdownBtn.h"

@interface XWFCountdownBtn ()

@property (strong, nonatomic) NSTimer *time;

@property (assign, nonatomic) NSInteger flagTime;
@property (strong, nonatomic) NSString *flagText;
@property (strong, nonatomic) UIColor *flagTextColor;
@property (strong, nonatomic) UIColor *flagbackgroundColor;

@end

@implementation XWFCountdownBtn

#pragma mark - 倒计时实现
-(void)startCountdown{
    if(self.countdownTime<=1)return;
    self.flagText = self.titleLabel.text;
    self.flagTextColor = self.titleLabel.textColor;
    self.flagbackgroundColor = self.backgroundColor;
    self.time.fireDate = [NSDate distantPast];
}
- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(nullable UIEvent *)event
{
//    if(self.countdownTime<=1)return YES;
//    self.flagText = self.titleLabel.text;
//    self.flagTextColor = self.titleLabel.textColor;
//    self.flagbackgroundColor = self.backgroundColor;
//    self.time.fireDate = [NSDate distantPast];
    return YES;
}
-(void)countdown
{
    self.enabled = NO;
    self.countdownTime--;
    [UIView animateWithDuration:0.25 animations:^{
        [self setTitle:[NSString stringWithFormat:@"%zd",self.countdownTime] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self setBackgroundColor:[UIColor whiteColor]];
    }];
    if(self.countdownTime==0)
    {
        [self.time invalidate];
        self.time = nil; //不暂停 直接销毁
        self.countdownTime = self.flagTime;
        self.enabled = YES;
        [UIView animateWithDuration:0.25 animations:^{
        [self setTitle:self.flagText forState:UIControlStateNormal];
        [self setTitleColor:self.flagTextColor forState:UIControlStateNormal];
        [self setBackgroundColor:self.flagbackgroundColor];
        }];
    }
}
-(NSTimer *)time
{
    if(!_time)
    {
        _time =  [NSTimer scheduledTimerWithTimeInterval:1
                                                  target:self
                                                selector:@selector(countdown)
                                                userInfo:nil
                                                 repeats:YES];
    }
    return _time;
}
-(void)setCountdownTime:(NSInteger)countdownTime
{
    _countdownTime = countdownTime;
    if(_flagTime<_countdownTime)_flagTime = _countdownTime;
}








#pragma mark - 圆角
- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0;
}
- (CGFloat)cornerRadius
{
    return self.layer.cornerRadius;
}
#pragma mark - 边框颜色
- (void)setBorderColor:(UIColor *)borderColor{
    self.layer.borderColor = borderColor.CGColor;
}
- (UIColor *)borderColor{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}
#pragma mark - 线宽
- (void)setBorderWidth:(CGFloat)borderWidth{
    self.layer.borderWidth = borderWidth;
    self.layer.masksToBounds = borderWidth > 0;
}
- (CGFloat)borderWidth{
    return self.layer.borderWidth;
}
#pragma mark - 其他代理拓展
//点击中手指移动
- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(nullable UIEvent *)event
{
    return YES;
}
//结束点击
- (void)endTrackingWithTouch:(nullable UITouch *)touch withEvent:(nullable UIEvent *)event
{

}
@end
