//
//  RecursiveLockTest.m
//  TreadTest
//
//  Created by cuiyinjiang on 2018/8/8.
//  Copyright © 2018年 cuiyinjiang. All rights reserved.
//

#import "RecursiveLockTest.h"

@implementation RecursiveLockTest
- (void)test {
//    NSLock *lock = [[NSLock alloc] init];
    NSRecursiveLock *lock = [[NSRecursiveLock alloc] init];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        static void (^RecursiveMethod)(int);
        
        RecursiveMethod = ^(int value) {
            [lock lock];
            if (value > 0) {
                NSLog(@"value = %d", value);
                sleep(1);
                RecursiveMethod(value - 1);
            }
            [lock unlock];
        };
        
        RecursiveMethod(5);
    });
}
@end
