//
//  NSNumber+String.m
//  DoctorHelper
//
//  Created by 李童 on 2017/9/15.
//  Copyright © 2017年 李童. All rights reserved.
//

#import "NSNumber+String.h"

@implementation NSNumber (String)
//NSNumber转成字符串
+ (NSString *)stringFromNumber:(NSNumber *)number{
    //直接传入精度丢失有问题的Double类型
    double conversionValue = [number doubleValue];
    NSString *doubleString = [NSString stringWithFormat:@"%lf", conversionValue];
    NSDecimalNumber *decNumber = [NSDecimalNumber decimalNumberWithString:doubleString];
    return [decNumber stringValue];
}
@end
