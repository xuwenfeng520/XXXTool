//
//  LSDTool.h
//  LsdApp
//
//  Created by xuwenfeng on 2018/8/8.
//  Copyright © 2018年 xuwenfeng. All rights reserved.
//

#import "NSObject+Null.h"
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
#import "NSArray+Log.h"
#import "NSObject+LSDView_RoundedCorners.h"
#import "UIViewController+PushViewController.h"
#import "XButton.h"
#import "xxxVerify.h"
#import "CsCommon.h"
#import "UIButton+XwfAddition.h"
#import "UIViewController+XwfAddition.h"

#define loadStr(key) [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"]] ofType:@"lproj"]] localizedStringForKey:(key) value:nil table:@"Language"]

#define xwfColor [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0]

#define logoOrange [UIColor colorWithRed:0.94 green:0.48 blue:0.18 alpha:1.00]
#define tabOrange [UIColor colorWithRed:1.00 green:0.44 blue:0.15 alpha:1.00]

#define viewBackgroundColor [UIColor colorWithRed:0.91 green:0.91 blue:0.91 alpha:1.00]

#define XXXFirmwareName @"k30_0x0005"

#define KStatusHight ([[UIApplication sharedApplication] statusBarFrame].size.height)
#define KSNavigationBarHight (self.navigationController.navigationBar.frame.size.height)
#define KStatusBarHight  (self.navigationController.navigationBar.frame.size.height+[[UIApplication sharedApplication] statusBarFrame].size.height)

#define KScale ([UIScreen mainScreen].scale)
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)

#define kScreenWWW(xwf) (kScreenWidth<kScreenHeight?kScreenWidth:kScreenHeight)/375*xwf
//#define kScreenHHH(xwf) kScreenHeight/667*xwf
//#define kW(xwf) kScreenWidth/375*xwf
//#define kH(xwf) kScreenHeight/667*xwf


#ifdef DEBUG //开发阶段
#define NSLog(format,...) printf("%s\n",[[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String])
#else //发布阶段
#define NSLog(...)
#endif
