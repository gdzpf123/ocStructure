//
//  ViewController.m
//  StackDemo
//
//  Created by PF Z on 2017/3/2.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import "ViewController.h"
#import "Stack.h"
//栈的DEMO 

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Stack <NSString *>  *S=[[Stack alloc] init];
    [S push:@"1"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
