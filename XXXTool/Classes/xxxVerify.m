//
//  VerifyPhoneNub.m
//  LsdApp
//
//  Created by xuwenfeng on 2018/10/30.
//  Copyright © 2018 xuwenfeng. All rights reserved.
//

#import "xxxVerify.h"

@implementation xxxVerify

+(BOOL)verifyWith:(NSString*)nub{
    NSString *MOBILE = @"^1(3[0-9]|4[579]|5[0-35-9]|6[6]|7[0-35-9]|8[0-9]|9[89])\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject:nub];
}

//+(BOOL)verifyWith:(NSString*)nub{
//    if (nub.length != 11)
//    {
//        return NO;
//    }
//
//    /**
//     * 手机号码:
//     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[6, 7, 8], 18[0-9], 170[0-9]
//     * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
//     * 联通号段: 130,131,132,155,156,185,186,145,176,1709
//     * 电信号段: 133,153,180,181,189,177,1700
//     */
//    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[0678])\\d{8}$";
//    /**
//     * 中国移动：China Mobile
//     * 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
//     */
//    NSString *CM = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
//    /**
//     * 中国联通：China Unicom
//     * 130,131,132,155,156,185,186,145,176,1709
//     */
//    NSString *CU = @"(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
//    /**
//     * 中国电信：China Telecom
//     * 133,153,180,181,189,177,1700
//     */
//    NSString *CT = @"(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
//
//    /**
//     25         * 大陆地区固话及小灵通
//     26         * 区号：010,020,021,022,023,024,025,027,028,029
//     27         * 号码：七位或八位
//     28         */
//    //   NSString * PHS = @"^(0[0-9]{2})\\d{8}$|^(0[0-9]{3}(\\d{7,8}))$";
//
//
//    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
//    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
//    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
//    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
//
//    if (([regextestmobile evaluateWithObject:nub] == YES)
//        || ([regextestcm evaluateWithObject:nub] == YES)
//        || ([regextestct evaluateWithObject:nub] == YES)
//        || ([regextestcu evaluateWithObject:nub] == YES))
//    {
//        return YES;
//    }
//    else
//    {
//        return NO;
//    }
//}



#pragma 正则匹配用户密码8-18位数字和字母组合
+ (BOOL)checkPassWord2:(NSString *)password
{
    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{8,18}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:password];
    return isMatch;
    
}

+(BOOL)checkPassWord:(NSString *)passWord{
    //密码长度
    NSString *passWordRegex = @"^[\\x21-\\x7e]{8,20}$";
    
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    
    if ([passWordPredicate evaluateWithObject:passWord]) {
        
        NSInteger index = 0;
        
        passWordRegex = @".*[0-9]+.*";
        
        passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
        
        if ([passWordPredicate evaluateWithObject:passWord]) {
            
            index ++;
            
        }
        
        
        
        passWordRegex = @".*[a-z]+.*";

        passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];

        if ([passWordPredicate evaluateWithObject:passWord]) {

            index ++;

        }


        passWordRegex = @".*[A-Z]+.*";

        passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];

        if ([passWordPredicate evaluateWithObject:passWord]) {

          index ++;

        }
        
        
        
        passWordRegex = @".*[\\x21-\\x2f\\x3a-\\x40\\x5b-\\x60\\x7B-\\x7F]+.*";
        
        passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
        
        if ([passWordPredicate evaluateWithObject:passWord]) {
            
            index ++;
            
        }
        
        
        if (index >= 2) {
            
            return YES;
            
        }
        
    }
    
    return NO;
    
}

@end
