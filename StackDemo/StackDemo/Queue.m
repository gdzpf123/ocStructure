//
//  Queue.m
//  StackDemo
//
//  Created by PF Z on 2017/3/2.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import "Queue.h"

@implementation Queue
{
    NSMutableArray *queueArr;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        queueArr=[NSMutableArray array];
    }
    return self;
}

-(void)push:(id)obj
{
    
    [queueArr addObject:obj];
    
    
}

-(void)pop
{
    if (queueArr.count) {
        
        [queueArr removeObjectAtIndex:0];

    }
}

-(void)clearQueue
{
    [queueArr removeAllObjects];
    
}


@end
