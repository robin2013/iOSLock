//
//  SynchronizedTest.m
//  TreadTest
//
//  Created by cuiyinjiang on 2018/8/8.
//  Copyright © 2018年 cuiyinjiang. All rights reserved.
//

#import "SynchronizedTest.h"

@implementation SynchronizedTest

- (void)test {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @synchronized(self){
            NSLog(@"Thread one start ...");
            sleep(3);
            NSLog(@"Thread one end ...");
        }
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @synchronized(self){
            NSLog(@"Thread two end ...");
        }
    });
}
@end
