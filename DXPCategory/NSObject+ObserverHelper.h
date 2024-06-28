//
//  NSObject+ObserverHelper.h
//  GaiaCLP
//
//  Created by 严贵敏 on 2022/7/7.
//

#import <Foundation/Foundation.h>
#import "NSObject+ObserverHelper.h"
#import <objc/message.h>

NS_ASSUME_NONNULL_BEGIN


@interface NSObject (ObserverHelper)

- (void)cc_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath;

@end

@interface ObserverHelper : NSObject
@property (nonatomic, unsafe_unretained) id target;
@property (nonatomic, unsafe_unretained) id observer;
@property (nonatomic, strong) NSString *keyPath;
@property (nonatomic, weak) ObserverHelper *factor;
@end

NS_ASSUME_NONNULL_END
