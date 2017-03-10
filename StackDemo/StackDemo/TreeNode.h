//
//  Tree.h
//  StackDemo
//
//  Created by PF Z on 2017/3/8.
//  Copyright © 2017年 PF Z. All rights reserved.
//

//OC实现树的数据结构

#import <Foundation/Foundation.h>

@interface TreeNode : NSObject

@property (nonatomic,assign) NSInteger value;

@property (nonatomic,strong) TreeNode *leftNode;
@property (nonatomic,strong) TreeNode *rightNode;

@end
