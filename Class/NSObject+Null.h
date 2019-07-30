//
//  NSObject+Null.h
//  DoctorHelper
//
//  Created by 李童 on 2017/9/1.
//  Copyright © 2017年 李童. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Null)
+ (BOOL)isNullWithObject:(id)object;
+ (BOOL)notNullWithObject:(id)object;
@end
