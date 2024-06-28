//
//  LEButtonGCDTimerManager.m
//  libyanaMI
//
//  Created by OO on 2019/11/1.
//  Copyright © 2019 ZteSoft. All rights reserved.
//

#import "LEButtonGCDTimerManager.h"


@interface LEButtonGCDTimerManager()

@end

@implementation LEButtonGCDTimerManager

// 单例

+ (LEButtonGCDTimerManager *)sharedInstance {
    static LEButtonGCDTimerManager * _buttonGCDTimerManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        _buttonGCDTimerManager = [[LEButtonGCDTimerManager alloc] init];
        
    });
    return _buttonGCDTimerManager;

}

// 取消timer

- (void)cancelOrderTimerWithName:(NSString *)timerName{
    dispatch_source_t timer = [self.orderTimerGCDDict objectForKey:timerName];
    if (!timer)
        return;
    [self.orderTimerGCDDict removeObjectForKey:timerName];
    dispatch_source_cancel(timer);
    
}

- (NSMutableDictionary *)orderTimerGCDDict
{
    if (!_orderTimerGCDDict) {
        _orderTimerGCDDict = [[NSMutableDictionary alloc] init];
    }
    return _orderTimerGCDDict;
}

@end


