//
//  LEButtonGCDTimerManager.h
//  libyanaMI
//
//  Created by OO on 2019/11/1.
//  Copyright © 2019 ZteSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LEButtonGCDTimerManager : NSObject
@property (nonatomic, strong) NSMutableDictionary * orderTimerGCDDict;
- (void)cancelOrderTimerWithName:(NSString *)timerName;
+ (LEButtonGCDTimerManager *)sharedInstance;
@end

NS_ASSUME_NONNULL_END
