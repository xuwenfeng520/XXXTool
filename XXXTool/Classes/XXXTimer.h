//
//  XXXTimer.h
//  Masonry
//
//  Created by 徐文逢 on 2020/1/9.
//

#import <Foundation/Foundation.h>
//@class XXXTimer;
//@protocol XXXTimerDelegate <NSObject>
//-(void)xxxTimer:(XXXTimer*)xxxTimer executionMethod;
//@end

@interface XXXTimer : NSObject
//@property (assign,nonatomic)CGFloat interval;
-(instancetype)initWithTarget:(id)target selector:(SEL)selector;

-(void)starWithTimeInterval:(NSTimeInterval)interval;
-(void)stop;
@end


