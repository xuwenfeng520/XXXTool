//
//  NSObject+XwfAddition.m
//  XWF
//
//  Created by 徐文逢 on 16/9/17.
//  Copyright © 2016年 徐文逢. All rights reserved.
//

#import "NSObject+XwfAddition.h"

@implementation NSObject (XwfAddition)
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

/// 使用字典创建模型对象
///
/// @param dict 字典
///
/// @return 模型对象
+ (instancetype)xwf_objectWithDict:(NSDictionary *)dict {
    
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

//复制对象
-(instancetype)xxxCopy{
    return [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:self]];
}
@end
