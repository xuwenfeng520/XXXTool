//
//  LSDTool.h
//  LsdApp
//
//  Created by xuwenfeng on 2018/8/8.
//  Copyright © 2018年 xuwenfeng. All rights reserved.
//


#import "NSError+Create.h"
#import "NSNumber+String.h"
#import "NSAttributedString+XwfAddition.h"
#import "UILabel+XwfAddition.h"
#import "UIColor+XwfAddition.h"
#import "NSObject+XwfAddition.h"
#import "NSArray+XwfAddition.h"
#import "UIColor+XwfAddition.h"
#import "UIView+Xwftility.h"
#import "XButton.h"
#import "UIViewController+PopupWindow.h"
#import "XWFCountdownBtn.h"
#import "XWFEqualSpaceFlowLayout.h"
#import "NSObject+RoundedCorners.h"
#import "XButton.h"
#import "xxxVerify.h"
#import "CsCommon.h"
#import "UIButton+XwfAddition.h"
#import "UIViewController+XwfAddition.h"
#import "XXXTimer.h"



#define loadStr(key) [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"]] ofType:@"lproj"]] localizedStringForKey:(key) value:nil table:@"Language"]

#define xwfColor [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0]

#define logoOrange [UIColor colorWithRed:0.94 green:0.48 blue:0.18 alpha:1.00]
#define tabOrange [UIColor colorWithRed:1.00 green:0.44 blue:0.15 alpha:1.00]

#define viewBackgroundColor [UIColor colorWithRed:0.91 green:0.91 blue:0.91 alpha:1.00]
#define viewBackgroundColor2 [UIColor colorWithRed:1 green:0.91 blue:0.91 alpha:1.00]


#define KStatusHight ([[UIApplication sharedApplication] statusBarFrame].size.height)
#define KSNavigationBarHight (self.navigationController.navigationBar.frame.size.height)
#define KStatusBarHight  (self.navigationController.navigationBar.frame.size.height+[[UIApplication sharedApplication] statusBarFrame].size.height)

#define KScale ([UIScreen mainScreen].nativeScale)
#define kScreenHeight ([UIScreen mainScreen].nativeBounds.size.height/KScale)
#define kScreenWidth ([UIScreen mainScreen].nativeBounds.size.width/KScale)

#define kScreenWWW(xwf) ((kScreenWidth<kScreenHeight?kScreenWidth:kScreenHeight)/375*xwf)
#define kScreen(xwf) kScreenWWW(xwf)
//#define kScreenHHH(xwf) kScreenHeight/667*xwf
//#define kW(xwf) kScreenWidth/375*xwf
//#define kH(xwf) kScreenHeight/667*xwf

#define WS(wself)  __weak __typeof(&*self)wself = self
#define weakSelf WS(wself);


#ifdef DEBUG //开发阶段
#define NSLog(format,...) printf("%s\n",[[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String])
#else //发布阶段
#define NSLog(...)
#endif
