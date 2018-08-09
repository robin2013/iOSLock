//
//  RWLockTest.m
//  TreadTest
//
//  Created by cuiyinjiang on 2018/8/9.
//  Copyright © 2018年 cuiyinjiang. All rights reserved.
//

#import "RWLockTest.h"
#import <pthread/pthread.h>
@implementation RWLockTest
- (void)testRead {
    __block pthread_rwlock_t rwlock;
    pthread_rwlock_init(&rwlock,NULL);
    
    int i = 4;
    while (i>0) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            sleep(1);
            
            NSLog(@"线程0：加锁");
            pthread_rwlock_rdlock(&rwlock);
            NSLog(@"线程0：读");
            pthread_rwlock_unlock(&rwlock);
            NSLog(@"线程0：解锁");
            
        });
        i--;
    }
}
- (void)testWrite {
    __block pthread_rwlock_t rwlock;
    pthread_rwlock_init(&rwlock,NULL);
    int j = 4;
    while (j>0) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            sleep(1);
            NSLog(@"线程1：加锁");
            pthread_rwlock_wrlock(&rwlock);
            NSLog(@"线程1：写");
            pthread_rwlock_unlock(&rwlock);
            NSLog(@"线程1：解锁");
        });
        j--;
    }
}
@end
