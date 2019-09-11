//
//  UIButton+XwfAddition.h
//  XXXTool
//
//  Created by 徐文逢 on 2019/8/7.
//  Copyright © 2019 徐文逢. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (XwfAddition)
    /**
     图片按钮
     
     @param ImageName 图片
     @param target self
     @param action 方法
     @return 按钮
     */
+(UIButton*)xxxButtonCreateWithImageName:(NSString*)ImageName target:(nullable id)target action:(SEL)action;
@end

NS_ASSUME_NONNULL_END
