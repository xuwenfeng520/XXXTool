//
//  XXXTimer.m
//  Masonry
//
//  Created by 徐文逢 on 2020/1/9.
//

#import "XXXTimer.h"
@interface XXXTimer ()
@property (strong,nonatomic)NSTimer *timer;
@property (weak,nonatomic)id target;
@property (assign,nonatomic)SEL selMethod;
@end

@implementation XXXTimer
-(void)countdown{
    if([self.target respondsToSelector:self.selMethod]){
        ((void (*)(id, SEL))[self.target methodForSelector:self.selMethod])(self.target, self.selMethod);
    }
}
-(instancetype)initWithTarget:(id)target selector:(SEL)selector{
    if(self = [super init]){
        _target = target;
        _selMethod = selector;
    }
    return self;
}
-(void)starWithTimeInterval:(NSTimeInterval)interval{
    if(self.timer){
        [self stop];
    }
    [self countdown];
    _timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(countdown) userInfo:nil repeats:YES];
}
-(void)stop{
    self.timer.fireDate = [NSDate distantFuture]; //暂停定时
    [self.timer invalidate];
    self.timer = nil;
}
-(void)dealloc{
    NSLog(@"时间销毁");
}
@end
