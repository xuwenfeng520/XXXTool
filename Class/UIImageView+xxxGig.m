//
//  UIImageView+xxxGig.m
//  LsdApp
//
//  Created by xuwenfeng on 2018/10/22.
//  Copyright © 2018 xuwenfeng. All rights reserved.
//

#import "UIImageView+xxxGig.h"
//#import "UIImage+GIF.h"
#import <SDWebImage/UIImage+GIF.h>
@implementation UIImageView (xxxGig)
+(UIImageView*)imageViewWithName:(NSString*)nsme{
    NSString *path = [[NSBundle mainBundle] pathForResource:nsme ofType:@"gif"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    UIImageView *gifff = [[UIImageView alloc]initWithImage:[UIImage sd_imageWithGIFData:data]];
    return gifff;
}
@end
