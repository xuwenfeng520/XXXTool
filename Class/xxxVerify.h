//
//  VerifyPhoneNub.h
//  LsdApp
//
//  Created by xuwenfeng on 2018/10/30.
//  Copyright © 2018 xuwenfeng. All rights reserved.
//

#import <Foundation/Foundation.h>


//判断手机号码是否正确
@interface xxxVerify : NSObject
+(BOOL)verifyWith:(NSString*)nub;
+ (BOOL)checkPassWord2:(NSString *)password;
+(BOOL)checkPassWord:(NSString *)passWord;
@end


