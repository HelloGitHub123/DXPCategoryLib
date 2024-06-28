//
//  NSObject+ObserverHelper.m
//  GaiaCLP
//
//  Created by 严贵敏 on 2022/7/7.
//

#import "NSObject+ObserverHelper.h"
@implementation NSObject (ObserverHelper)

- (void)cc_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath {
    [self addObserver:observer forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:nil];
    
    ObserverHelper *helper = [ObserverHelper new];
    ObserverHelper *sub = [ObserverHelper new];
    
    sub.target = helper.target = self;
    sub.observer = helper.observer = observer;
    sub.keyPath = helper.keyPath = keyPath;
    helper.factor = sub;
    sub.factor = helper;
    
    const char *helpeKey = [[keyPath mutableCopy] UTF8String];
    const char *subKey = [[keyPath mutableCopy] UTF8String];
    // 关联属性  举例 self 和 helper 关联 当self释放的时候 helper释放 即可释放self的kvo 观察者和sub关联 当观察者释放的时候 调用sub的移除同样也能删除self的kvo   factor是同一个对象 是为防止多次移除导致的崩溃
    objc_setAssociatedObject(self, helpeKey, helper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(observer, subKey, sub, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end

@implementation ObserverHelper
- (void)dealloc {
    if ( _factor ) {
        [_target removeObserver:_observer forKeyPath:_keyPath];
    }
}
@end
