//
//  NSArray+XwfAddition.h
//  XWF
//
//  Created by 徐文逢 on 16/9/17.
//  Copyright © 2016年 徐文逢. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+XwfAddition.h"
@interface NSArray (XwfAddition)


/**
 *  根据plist文件创建指定类对象数组
 *
 *  @param plistName plist文件名
 *  @param clsName   类名
 *
 *  @return 返回根据类名创建的模型数组
 */
+ (NSArray *)xwf_objectListWithPlistName:(NSString *)plistName clsName:(NSString *)clsName;
@end


@interface NSDictionary (Log)

@end
