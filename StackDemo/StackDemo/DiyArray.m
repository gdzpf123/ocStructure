//
//  DiyArray.m
//  数据结构Demo
//
//  Created by PF Z on 2017/2/22.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import "DiyArray.h"
#import "Node.h"


@implementation DiyArray
{
    Node *headNode;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        headNode=[[Node alloc] init];
    }
    return self;
}

-(void)addObj:(id)obj
{
    Node *node=[[Node alloc] init];
    node.obj=obj;
    
    [headNode addNode:node];
}

//-(void)deleteObj:(id)obj;
-(void)insertObjAtIndex:(id)obj index:(int)index
{

    [headNode insertObj:obj atIndex:index];
}

-(id)objAtIndex:(int)index
{
    Node *node=[headNode getNodeAtIndex:index];
    return node.obj;
}

-(void)setObjAtIndex:(id)obj index:(int)index
{
    Node *node=[headNode getNodeAtIndex:index];
    node.obj=obj;
}

-(int)count
{
    return [headNode length];
}

-(void)deleteObjAtIndex:(int)index
{
    [headNode deleteNode:index];
}

-(id)getMiddleObj
{
    Node *midNode=[headNode getMidNode];
    return midNode.obj;
    
}

@end
