//
//  XWFCountdownBtn.h
//  倒计时按钮
//
//  Created by xwf on 2017/10/10.
//  Copyright © 2017年 xwf. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE //可以预览
@interface XWFCountdownBtn : UIButton
/**
 倒计时时间
 */
@property (assign, nonatomic) IBInspectable NSInteger countdownTime;
/**
 圆角
 */
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
/**
 边框颜色
 */
@property (nonatomic, strong) IBInspectable UIColor *borderColor;
/**
 边框宽度
 */
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;

//开始倒数
-(void)startCountdown;
@end
