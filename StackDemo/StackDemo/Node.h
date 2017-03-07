//
//  Node.h
//  数据结构Demo
//
//  Created by PF Z on 2017/2/22.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property (nonatomic,strong) id obj;
@property (nonatomic,strong) Node *nextNode;
@property (nonatomic,strong) Node *preNode;

-(int)length;
-(Node *)getNodeAtIndex:(int)index;
-(void)insertObj:(id)obj atIndex:(int)index;
-(void)addNode:(Node *)node;
-(void)deleteNode:(int)index;

-(Node *)getMidNode;

//清除链表
-(void)clearList;

@end
