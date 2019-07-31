//
//  NSError+Create.h
//  DoctorHelper
//
//  Created by 李童 on 2017/9/1.
//  Copyright © 2017年 李童. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (Create)
+ (NSError *)createErrorWithDescription:(NSString *)description;
@end
