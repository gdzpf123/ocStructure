//
//  Stack.m
//  StackDemo
//
//  Created by PF Z on 2017/3/2.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import "Stack.h"

@implementation Stack
{
    NSMutableArray *stackArr;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        stackArr=[NSMutableArray array];
    }
    return self;
}

-(void)push:(id)obj//入栈
{
    [stackArr addObject:obj];
}

-(void)pop//出栈
{

    [stackArr removeLastObject];
    
}

-(void)clearStack//清空栈
{
    [stackArr removeAllObjects];
}



@end
