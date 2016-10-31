//
//  ViewController.m
//  TestDemo
//
//  Created by 陈俊俊 on 16/10/14.
//  Copyright © 2016年 陈俊俊. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    UILabel *testLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    testLabel.text = @"测试";
    [self.view addSubview:testLabel];
    NSLog(@"Dev1.0");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
