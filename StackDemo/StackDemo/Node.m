//
//  Node.m
//  数据结构Demo
//
//  Created by PF Z on 2017/2/22.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import "Node.h"

@implementation Node

-(int)length
{
    
    int len=0;
    Node *tempNode=self;
    
    while (tempNode.nextNode!=nil) {
        len++;
        tempNode=tempNode.nextNode;
    }
    
    return len;
}

-(Node *)getNodeAtIndex:(int)index
{
    
    int len=[self length];
    if (index>len) {
        return nil;
    }
    
    Node *tempNode=self.nextNode;
    
    for (int i=0; i<index; i++) {
        tempNode=tempNode.nextNode;
    }
    
    return tempNode;
}

-(void)insertObj:(id)obj atIndex:(int)index
{
    
    int len=[self length];
    
    Node *tempNode=self;
    
    if (index>len) {
        return;
    }
    
    for (int i=0; i<len; i++) {
        tempNode=tempNode.nextNode;
    }
    
    Node *newNode=[[Node alloc] init];
    newNode.obj=obj;
    
    tempNode.nextNode=newNode;
    newNode.preNode=tempNode;
    
    
    Node *lastNode=[self getNodeAtIndex:index+1];
    
    if (lastNode) {
        newNode.nextNode=lastNode;
        lastNode.preNode=newNode;
    }
    
}


-(void)addNode:(Node *)node
{
    
    int len=[self length];
    [self insertObj:node.obj atIndex:len];
    
}

-(void)deleteNode:(int)index
{
    Node *node=[self getNodeAtIndex:index];
    if (!node) {
        return;
    }
    
    Node *preNode=node.preNode;
    Node *nextNode=node.nextNode;
    
    if (!nextNode) {
        preNode.nextNode=nil;
    }else{
        preNode.nextNode=nextNode;
        nextNode.preNode=preNode;
    }
}

-(Node *)getMidNode
{
    Node *mid=self;
    Node *search=self;
    
    while (search.nextNode !=nil) {
        
        if (search.nextNode.nextNode !=nil) {
            search=search.nextNode.nextNode;
            mid=mid.nextNode;
        }else{
            search=search.nextNode;
            mid=mid.nextNode;
        }
        
    }
    
    return mid;
    
}


@end
