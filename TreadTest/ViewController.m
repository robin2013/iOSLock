//
//  ViewController.m
//  TreadTest
//
//  Created by cuiyinjiang on 2018/8/8.
//  Copyright © 2018年 cuiyinjiang. All rights reserved.
//

#import "ViewController.h"
#import "SynchronizedTest.h"
#import "SemaphoreTest.h"
#import "NSLockTest.h"
#import "RecursiveLockTest.h"
#import "ConditionLockTest.h"
#import "NSConditionTest.h"
#import "MutexTest.h"
#import "MutexRecureTest.h"
#import "OSSpinLockTest.h"
#import "UnfairLockTest.h"
#import "RWLockTest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self RWLockTest];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)RWLockTest {
    RWLockTest *obj = [RWLockTest new];
//    [obj testRead];
    [obj testWrite];

}
- (void)UnfairLockTest {
    UnfairLockTest *obj = [UnfairLockTest new];
    [obj test];
}

- (void)OSSpinLockTest {
    OSSpinLockTest *obj = [OSSpinLockTest new];
    [obj test];
}
- (void)mutexRecureTest {
    MutexRecureTest *obj = [MutexRecureTest new];
    [obj test];
}
- (void)mutexTest {
    MutexTest *obj = [MutexTest new];
    [obj test];
}
- (void)conditionTest {
    NSConditionTest *obj = [NSConditionTest new];
    [obj test];
}
- (void)conditionLockTest {
    ConditionLockTest *obj = [ConditionLockTest new];
    [obj test];
}
- (void)recursiveTest {
    RecursiveLockTest * obj = [RecursiveLockTest new];
    [obj test];
}
- (void)lockTest {
    NSLockTest * obj = [NSLockTest new];
    [obj testLockDate];
}
- (void)semaphoreTest {
    SemaphoreTest * obj = [SemaphoreTest new];
    [obj test];
}
- (void)synchronizedTest {
    SynchronizedTest * obj = [SynchronizedTest new];
    [obj test];
}

@end
