//
//  NSObject+XwfAddition.m
//  XWF
//
//  Created by 徐文逢 on 16/9/17.
//  Copyright © 2016年 徐文逢. All rights reserved.
//

#import "NSObject+XwfAddition.h"

@implementation NSObject (XwfAddition)


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
@end
