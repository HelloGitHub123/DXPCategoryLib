//
//  UIButton+Verify.h
//  DataMall
//
//  Created by bobby4en on 16/1/31.
//  Copyright © 2016年 ztesoft. All rights reserved.
//

#import <UIKit/UIKit.h>

//默认倒计时时间
#define Verify_Button_Time                  90

//可用时的标题
#define Verify_Button_Title_Available       @"Get"

//倒计时的标题
#define Verify_Button_Title_Unavailable     @"s"

@interface UIButton (Verify)
//@property (nonatomic, nullable, strong) dispatch_source_t timer;
/**
 *  接收到按钮事件后 调用此方法
 */
- (void)unavailable;

- (void)unavailable:(int)totalTime;

- (void)resetBtn;

@end
