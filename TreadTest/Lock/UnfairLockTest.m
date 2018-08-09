//
//  UnfairLockTest.m
//  TreadTest
//
//  Created by cuiyinjiang on 2018/8/8.
//  Copyright © 2018年 cuiyinjiang. All rights reserved.
//

#import "UnfairLockTest.h"
#import <os/lock.h>
@interface UnfairLockTest() {
    os_unfair_lock_t unfairLock;
}
- (void)test;
@end
@implementation UnfairLockTest
- (id)init {
    self = [super init];
    return self;
}
- (void)test {
    __block os_unfair_lock unfairLock = OS_UNFAIR_LOCK_INIT;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        os_unfair_lock_lock(&unfairLock);
        NSLog(@"需要线程同步的操作1 开始");
        sleep(3);
        NSLog(@"需要线程同步的操作1 结束");
        os_unfair_lock_unlock(&unfairLock);

    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (os_unfair_lock_trylock(&unfairLock)) {
            sleep(1);
            NSLog(@"需要线程同步的操作2");
            os_unfair_lock_unlock(&unfairLock);
        } else {
            NSLog(@"lock fail");
        }

    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        os_unfair_lock_lock(&unfairLock);
        NSLog(@"需要线程同步的操作3 开始");
        sleep(3);
        NSLog(@"需要线程同步的操作3 结束");
        os_unfair_lock_unlock(&unfairLock);
        
    });
}
@end
