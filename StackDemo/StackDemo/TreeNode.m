//
//  Tree.m
//  StackDemo
//
//  Created by PF Z on 2017/3/8.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import "TreeNode.h"

@implementation TreeNode

//创建二叉树
+(TreeNode *)createTreeWithValues:(NSArray *)values
{
    TreeNode *root =nil;
    for (int i= 0; i<values.count; i++) {
    
        NSInteger value=[values[i] integerValue];
        
        root=[self addTreeNode:root value:value];
        
    }
    
    return root;
    
}

//添加节点
+(TreeNode *)addTreeNode:(TreeNode *)treeNode value:(NSInteger)value
{
    //如果根节点不存在，则创建节点
    if (!treeNode) {
        treeNode=[[TreeNode alloc] init];
        treeNode.value=value;
    }else if (value <= treeNode.value){
        treeNode.leftNode=[self addTreeNode:treeNode.leftNode value:value];
    }else{
        treeNode.rightNode=[self addTreeNode:treeNode.rightNode value:value];
    }
    
    return treeNode;
}

//根据下标获取二叉树中的节点（按层次遍历）
+(TreeNode *)getNodeAtIndex:(NSInteger)index inTree:(TreeNode *)rootNode
{
    if (!rootNode || index<0) {
        return nil;
    }
    
    NSMutableArray * queueArray=[NSMutableArray array];
    [queueArray addObject:rootNode];
    
    while (queueArray.count>0) {
        
        TreeNode *node=[queueArray firstObject];
        if (index==0) {
            return node;
        }
        
        [queueArray removeObjectAtIndex:0];
        index -- ;
        
        if (node.leftNode) {
            [queueArray addObject:node.leftNode];
        }
        if (node.rightNode) {
            [queueArray addObject:node.rightNode];
        }
        
    }
    
    return nil;
}


//先序遍历
+(void)preOrderTraverseTree:(TreeNode *)rootNode handler:(void(^)(TreeNode *treeNode))handler {
    if (rootNode) {
        
        if (handler) {
            handler(rootNode);
        }
        
        [self preOrderTraverseTree:rootNode.leftNode handler:handler];
        [self preOrderTraverseTree:rootNode.rightNode handler:handler];
    }
}

//中序遍历
+(void)middleOrderTraverseTree:(TreeNode *)rootNode handler:(void(^)(TreeNode *treeNode))handler {
    if (rootNode) {
        
        [self preOrderTraverseTree:rootNode.leftNode handler:handler];
        
        if (handler) {
            handler(rootNode);
        }
        [self preOrderTraverseTree:rootNode.rightNode handler:handler];
    }
}

//后序遍历
+(void)postOrderTraverseTree:(TreeNode *)rootNode handler:(void(^)(TreeNode *treeNode))handler {
    if (rootNode) {
        [self preOrderTraverseTree:rootNode.leftNode handler:handler];
        [self preOrderTraverseTree:rootNode.rightNode handler:handler];
        if (handler) {
            handler(rootNode);
        }
    }
}

//层次遍历
+ (void)levelTraverseTree:(TreeNode *)rootNode handler:(void(^)(TreeNode *treeNode))handler {
    if (!rootNode) {
        return;
    }
    
    NSMutableArray *queueArray = [NSMutableArray array]; //数组当成队列
    [queueArray addObject:rootNode]; //压入根节点
    while (queueArray.count > 0) {
        
        TreeNode *node = [queueArray firstObject];
        
        if (handler) {
            handler(node);
        }
        
        [queueArray removeObjectAtIndex:0]; //弹出最前面的节点，仿照队列先进先出原则
        if (node.leftNode) {
            [queueArray addObject:node.leftNode]; //压入左节点
        }
        if (node.rightNode) {
            [queueArray addObject:node.rightNode]; //压入右节点
        }
    }
}

//获取二叉树的深度
+ (NSInteger)depthOfTree:(TreeNode *)rootNode {
    if (!rootNode) {
        return 0;
    }
    if (!rootNode.leftNode && !rootNode.rightNode) {
        return 1;
    }
    
    //左子树深度
    NSInteger leftDepth = [self depthOfTree:rootNode.leftNode];
    //右子树深度
    NSInteger rightDepth = [self depthOfTree:rootNode.rightNode];
    
    return MAX(leftDepth, rightDepth) + 1;
}

//获取二叉树的宽度
+ (NSInteger)widthOfTree:(TreeNode *)rootNode {
    if (!rootNode) {
        return 0;
    }
    
    NSMutableArray *queueArray = [NSMutableArray array]; //数组当成队列
    [queueArray addObject:rootNode]; //压入根节点
    NSInteger maxWidth = 1; //最大的宽度，初始化为1（因为已经有根节点）
    NSInteger curWidth = 0; //当前层的宽度
    
    while (queueArray.count > 0) {
        
        curWidth = queueArray.count;
        //依次弹出当前层的节点
        for (NSInteger i=0; i<curWidth; i++) {
            TreeNode *node = [queueArray firstObject];
            [queueArray removeObjectAtIndex:0]; //弹出最前面的节点，仿照队列先进先出原则
            //压入子节点
            if (node.leftNode) {
                [queueArray addObject:node.leftNode];
            }
            if (node.rightNode) {
                [queueArray addObject:node.rightNode];
            }
        }
        //宽度 = 当前层节点数
        maxWidth = MAX(maxWidth, queueArray.count);
    }
    
    return maxWidth;
}

//获取二叉树的所有节点数
+ (NSInteger)numberOfNodesInTree:(TreeNode *)rootNode {
    if (!rootNode) {
        return 0;
    }
    //节点数=左子树节点数+右子树节点数+1（根节点）
    return [self numberOfNodesInTree:rootNode.leftNode] + [self numberOfNodesInTree:rootNode.rightNode] + 1;
}

//获取二叉树的叶子节点数
+ (NSInteger)numberOfLeafsInTree:(TreeNode *)rootNode {
    if (!rootNode) {
        return 0;
    }
    //左子树和右子树都是空，说明是叶子节点
    if (!rootNode.leftNode && !rootNode.rightNode) {
        return 1;
    }
    //递归：叶子数 = 左子树叶子数 + 右子树叶子数
    return [self numberOfLeafsInTree:rootNode.leftNode] + [self numberOfLeafsInTree:rootNode.rightNode];
}


//获取二叉树的最大距离（二叉树的直径）
+ (NSInteger)maxDistanceOfTree:(TreeNode *)rootNode {
    if (!rootNode) {
        return 0;
    }
    //    方案一：（递归次数较多，效率较低）
    //分3种情况：
    //1、最远距离经过根节点：距离 = 左子树深度 + 右子树深度
    NSInteger distance = [self depthOfTree:rootNode.leftNode] + [self depthOfTree:rootNode.rightNode];
    //2、最远距离在根节点左子树上，即计算左子树最远距离
    NSInteger disLeft = [self maxDistanceOfTree:rootNode.leftNode];
    //3、最远距离在根节点右子树上，即计算右子树最远距离
    NSInteger disRight = [self maxDistanceOfTree:rootNode.rightNode];
    
    return MAX(MAX(disLeft, disRight), distance);
}



@end
