//
//  SemaphoreTest.m
//  TreadTest
//
//  Created by cuiyinjiang on 2018/8/8.
//  Copyright © 2018年 cuiyinjiang. All rights reserved.
//

#import "SemaphoreTest.h"

@implementation SemaphoreTest
- (void)test {
    dispatch_semaphore_t signal = dispatch_semaphore_create(1);
    dispatch_time_t timeout = dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC);
    dispatch_time_t timeout2 = dispatch_time(DISPATCH_TIME_NOW, 6 * NSEC_PER_SEC);

    int timeSleep = 4;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_semaphore_wait(signal, timeout);
        NSLog(@"SemaphoreTest Thread one start ...");
        sleep(timeSleep);
        NSLog(@"SemaphoreTest Thread one end ...");
        dispatch_semaphore_signal(signal);
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_semaphore_wait(signal, timeout);
//        NSLog(@"SemaphoreTest Thread two start ...");
//        sleep(1);
        NSLog(@"SemaphoreTest Thread two end ...");

        dispatch_semaphore_signal(signal);
    });
   
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_semaphore_wait(signal, timeout2);
        NSLog(@"SemaphoreTest Thread three end ...");
        dispatch_semaphore_signal(signal);
    });

}
@end
