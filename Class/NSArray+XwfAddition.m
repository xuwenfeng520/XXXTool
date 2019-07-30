//
//  NSArray+XwfAddition.m
//  XWF
//
//  Created by 徐文逢 on 16/9/17.
//  Copyright © 2016年 徐文逢. All rights reserved.
//

#import "NSArray+XwfAddition.h"

@implementation NSArray (XwfAddition)

/// 从 plist 文件创建指定 clsName 对象数组
///
/// @param plistName plist 文件名
/// @param clsName   要创建模型的类名
///
/// @return clsName 的对象数组
+ (NSArray *)xwf_objectListWithPlistName:(NSString *)plistName clsName:(NSString *)clsName
{
    //获取plist的url
    NSURL *url = [[NSBundle mainBundle] URLForResource:plistName withExtension:nil];
    
    //加载plist文件
    NSArray *list = [NSArray arrayWithContentsOfURL:url];
    
    //保存模型的数组
    NSMutableArray *arrayM = [NSMutableArray array];
    
    //获取模型对象类
    Class cls = NSClassFromString(clsName);
    
    //字典转模型对象
    for (NSDictionary *dict in list) {
        
        [arrayM addObject:[cls xwf_objectWithDict:dict]];
    }
    
    return arrayM;

}
@end
