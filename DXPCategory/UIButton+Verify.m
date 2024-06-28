//
//  UIButton+Verify.m
//  DataMall
//
//  Created by bobby4en on 16/1/31.
//  Copyright © 2016年 ztesoft. All rights reserved.
//

#import "UIButton+Verify.h"
#import "LEButtonGCDTimerManager.h"

@implementation UIButton (Verify)

- (void)unavailable {
    if (!self.userInteractionEnabled)return;
    
    __block int timeout = Verify_Button_Time;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^
                                      {
                                          if(timeout<=0)
                                          {
                                              //倒计时结束，关闭
                                              dispatch_source_cancel(_timer);
                                              dispatch_async(dispatch_get_main_queue(), ^
                                                             {
                                                                 [self setTitle:@"Get"
                                                                       forState:UIControlStateNormal];
                                                                 self.userInteractionEnabled = YES;
                                                                 [self  setBackgroundColor:[UIColor whiteColor]];
                                                             });
                                          }
                                          else
                                          {
                                              int seconds = timeout % 60;
                                              NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds==0?60:seconds];
                                              dispatch_async(dispatch_get_main_queue(), ^
                                                             {
                                                                 [self setTitle:[NSString stringWithFormat:@"%@%@",strTime,Verify_Button_Title_Unavailable]
                                                                       forState:UIControlStateNormal];
                                                                 self.userInteractionEnabled = NO;
                                                                 [self  setBackgroundColor:[UIColor whiteColor]];
                                                             });
                                              timeout--;
                                          }
                                      });
    
    dispatch_resume(_timer);
}

/**
 *  接收到按钮事件后 调用此方法
 */
- (void)unavailable:(int)totalTime {
    if (!self.userInteractionEnabled)return;//如果按钮不可点击，直接返回
     [[LEButtonGCDTimerManager sharedInstance] cancelOrderTimerWithName:@"ConfirmOrderTimerGCD"];//单例 开始前关闭名为ConfirmOrderTimerGCD的定时器
    __block int timeout = totalTime;//设置倒计时时间
    //GCD
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);//设置队列
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);//设置定时器
    [[LEButtonGCDTimerManager sharedInstance].orderTimerGCDDict setObject:_timer forKey:@"ConfirmOrderTimerGCD"];//定义一个manager 用来管理 timer
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
//    设置回调
    dispatch_source_set_event_handler(_timer, ^
                                      {
                                          if(timeout<=0)
                                          {
                                              //倒计时结束，关闭
                                              dispatch_source_cancel(_timer);
                                              dispatch_async(dispatch_get_main_queue(), ^
                                                             {//在主线程中修改UI，此处用于修改button
                                                                 [self setTitle:@"Get"
                                                                       forState:UIControlStateNormal];
                                                                 self.userInteractionEnabled = YES;
                                                                 [self  setBackgroundColor:[UIColor whiteColor]];
                                                             });
                                          }
                                          else
                                          {
                                              int seconds = timeout % totalTime;
                                              NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds==0?totalTime:seconds];
                                              dispatch_async(dispatch_get_main_queue(), ^
                                                             {
                                                                 [self setTitle:[NSString stringWithFormat:@"%@%@",strTime,Verify_Button_Title_Unavailable]
                                                                       forState:UIControlStateNormal];
                                                                 self.userInteractionEnabled = NO;
                                                  [self  setBackgroundColor:[UIColor whiteColor]];
                                                             });
                                              timeout--;
                                          }
                                      });
    
    dispatch_resume(_timer);//开始计时器
}
#pragma mark - 重置定时器
- (void)resetBtn{
    [[LEButtonGCDTimerManager sharedInstance] cancelOrderTimerWithName:@"ConfirmOrderTimerGCD"];//将之前管理器中名为ConfirmOrderTimerGCD 的定时器取消
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setTitle:@"Get"
              forState:UIControlStateNormal];
        self.userInteractionEnabled = YES;
        [self  setBackgroundColor:[UIColor whiteColor]];
    });
}

@end
