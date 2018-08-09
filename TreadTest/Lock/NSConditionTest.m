//
//  NSConditionTest.m
//  TreadTest
//
//  Created by cuiyinjiang on 2018/8/8.
//  Copyright © 2018年 cuiyinjiang. All rights reserved.
//

#import "NSConditionTest.h"

@implementation NSConditionTest
- (void)test {
    NSCondition *condition = [[NSCondition alloc] init];
    NSMutableArray *products = [NSMutableArray array];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        while (1) {
            [condition lock];
            NSLog(@"custome lock");
            if ([products count] == 0) {
                NSLog(@"wait for product");
                [condition wait];
            }
            [products removeObjectAtIndex:0];
            NSLog(@"custome a product");
            [condition unlock];
            NSLog(@"custome unlock");
        }
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        while (1) {
            [condition lock];
            NSLog(@"factory lock");
            [products addObject:[[NSObject alloc] init]];
            NSLog(@"produce a product,总量:%zi",products.count);
            [condition signal];
            NSLog(@"signal a product,总量:%zi",products.count);
            [condition unlock];
            NSLog(@"factory unlock");
            sleep(100);
        }
        
    });
}
@end
