//
//  TestDemoAutoTests.m
//  TestDemoAutoTests
//
//  Created by 陈俊俊 on 16/10/19.
//  Copyright © 2016年 陈俊俊. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface TestDemoAutoTests : XCTestCase

@end

@implementation TestDemoAutoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSLog(@"测试==================");
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
