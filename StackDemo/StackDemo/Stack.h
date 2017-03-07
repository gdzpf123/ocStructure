//
//  Stack.h
//  StackDemo
//
//  Created by PF Z on 2017/3/2.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack <objectType> : NSObject

-(void)push:(objectType)obj;//入栈

-(void)pop;//出栈

-(void)clearStack;//清空栈

//@property (nonatomic,strong) NSMutableArray <objectType> * Arr;

@end
