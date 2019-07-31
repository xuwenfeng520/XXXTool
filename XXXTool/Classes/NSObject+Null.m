//
//  NSObject+Null.m
//  DoctorHelper
//
//  Created by 李童 on 2017/9/1.
//  Copyright © 2017年 李童. All rights reserved.
//

#import "NSObject+Null.h"

@implementation NSObject (Null)
+ (BOOL)isNullWithObject:(id)object{
    if (object == nil) {
        return YES;
    }
    if ([object isEqual:[NSNull null]]) {
        return YES;
    }
    if ([object isKindOfClass:[NSString class]]) {
        if ([object isEqualToString:@""]) {
            return YES;
        }
    }
    if ([object isKindOfClass:[NSArray class]]) {
        if ([object count] == 0) {
            return YES;
        }
    }
    if ([object isKindOfClass:[NSDictionary class]]) {
        if ([object count] == 0) {
            return YES;
        }
    }
    if ([object isKindOfClass:[NSSet class]]) {
        if ([object count] == 0) {
            return YES;
        }
    }
    return NO;
}
+ (BOOL)notNullWithObject:(id)object{
    return ![self isNullWithObject:object];
}


@end
