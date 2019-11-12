//
//  NSObject+XwfAddition.h
//  XWF
//
//  Created by 徐文逢 on 16/9/17.
//  Copyright © 2016年 徐文逢. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (XwfAddition)

/**
 *  NSArray添加分类方法中创建字典模型需用到
 *
 *  @param dict 传入一个字典
 *
 *  @return 根据传入字典赋值创建返回对象
 */
+ (instancetype)xwf_objectWithDict:(NSDictionary *)dict;
//复制对象
-(instancetype)xxxCopy;
@end
