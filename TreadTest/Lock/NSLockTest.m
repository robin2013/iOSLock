//
//  NSLockTest.m
//  TreadTest
//
//  Created by cuiyinjiang on 2018/8/8.
//  Copyright © 2018年 cuiyinjiang. All rights reserved.
//

#import "NSLockTest.h"

@implementation NSLockTest
- (void)test {
    NSLock *lock = [NSLock new];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [lock lock];
        NSLog(@"Thread one start ...");
        sleep(3);
        NSLog(@"Thread one end ...");
        [lock unlock];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [lock lock];
        NSLog(@"Thread two end ...");
        [lock unlock];
    });
}

- (void)testTry {
    NSLock *lock = [NSLock new];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [lock lock];
        NSLog(@"Thread one start ...");
        sleep(3);
        NSLog(@"Thread one end ...");
        [lock unlock];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if ([lock tryLock]) {
            NSLog(@"Thread two get lock ...");
            [lock unlock];
        } else {
            NSLog(@"Thread two fail to get lock ...");
        }
    });
}

- (void)testLockDate {
    NSLock *lock = [NSLock new];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [lock lock];
        NSLog(@"Thread one start ...");
        sleep(3);
        NSLog(@"Thread one end ...");
        [lock unlock];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if ([lock lockBeforeDate:[NSDate dateWithTimeIntervalSinceNow:5]]) {
            NSLog(@"Thread two get lock ...");
            [lock unlock];
        } else {
            NSLog(@"Thread two fail to get lock ...");
        }
    });
}
@end
