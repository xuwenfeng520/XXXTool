//
//  NSError+Create.m
//  DoctorHelper
//
//  Created by 李童 on 2017/9/1.
//  Copyright © 2017年 李童. All rights reserved.
//

#import "NSError+Create.h"
NSErrorDomain const NSYouKangErrorDomain = @"NSYouKangErrorDomain";
@implementation NSError (Create)
+ (NSError *)createErrorWithDescription:(NSString *)description{
    NSError *error = [NSError errorWithDomain:NSYouKangErrorDomain code:0 userInfo:@{NSLocalizedDescriptionKey:description}];
    return error;
}
@end
