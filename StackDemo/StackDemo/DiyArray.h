//
//  DiyArray.h
//  数据结构Demo
//
//  Created by PF Z on 2017/2/22.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiyArray : NSObject



-(void)addObj:(id)obj;
-(void)deleteObjAtIndex:(int)index;
-(void)insertObjAtIndex:(id)obj index:(int)index;
-(id)objAtIndex:(int)index;
-(void)setObjAtIndex:(id)obj index:(int)index;
-(id)getMiddleObj;

@property (nonatomic,assign) int count;

@end
