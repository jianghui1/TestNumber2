//
//  TestNumber2Tests.m
//  TestNumber2Tests
//
//  Created by ys on 2018/12/15.
//  Copyright © 2018 mg. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface TestNumber2Tests : XCTestCase

@end

@implementation TestNumber2Tests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)test1
{
    CGFloat f = 1999.21;
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.maximumFractionDigits = 1;
    formatter.numberStyle = kCFNumberFormatterDecimalStyle;
    
    NSString *s = [formatter stringFromNumber:@(f)];
    NSLog(@"字符串 -- %@", s);
    
    CGFloat r = [s floatValue];
    NSLog(@"数值 -- %.1f", r);
    
    // 打印结果
    /*
     2018-12-15 19:30:24.381564+0800 TestNumber2[23989:224784] 字符串 -- 1,999.2
     2018-12-15 19:30:24.381752+0800 TestNumber2[23989:224784] 数值 -- 1.0
     */
}

- (void)test2
{
    CGFloat f = 1999.21;
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.maximumFractionDigits = 1;
    formatter.numberStyle = kCFNumberFormatterDecimalStyle;
    formatter.usesGroupingSeparator = NO; // 不使用分组符号
    
    NSString *s = [formatter stringFromNumber:@(f)];
    NSLog(@"字符串 -- %@", s);
    
    CGFloat r = [s floatValue];
    NSLog(@"数值 -- %.1f", r);
    
    // 打印结果
    /*
     2018-12-15 19:33:41.701357+0800 TestNumber2[24111:226638] 字符串 -- 1999.2
     2018-12-15 19:33:41.701608+0800 TestNumber2[24111:226638] 数值 -- 1999.2
     */
}

- (void)test3
{
    CGFloat f = 1999.21;
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.maximumFractionDigits = 1;
    formatter.numberStyle = kCFNumberFormatterDecimalStyle;
    formatter.groupingSeparator = @" ";
    
    NSString *s = [formatter stringFromNumber:@(f)];
    NSLog(@"字符串 -- %@", s);
    
    CGFloat r = [s floatValue];
    NSLog(@"数值 -- %.1f", r);
    
    // 打印结果
    /*
     2018-12-15 19:36:35.211693+0800 TestNumber2[24229:228413] 字符串 -- 1 999.2
     2018-12-15 19:36:35.211894+0800 TestNumber2[24229:228413] 数值 -- 1.0
     */
}

- (void)test4
{
    CGFloat f = 1999.21;
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.maximumFractionDigits = 1;
    formatter.numberStyle = kCFNumberFormatterDecimalStyle;
    formatter.groupingSeparator = @"";
    
    NSString *s = [formatter stringFromNumber:@(f)];
    NSLog(@"字符串 -- %@", s);
    
    CGFloat r = [s floatValue];
    NSLog(@"数值 -- %.1f", r);
    
    // 打印结果
    /*
     2018-12-15 19:38:33.911502+0800 TestNumber2[24303:229946] 字符串 -- 1999.2
     2018-12-15 19:38:33.911727+0800 TestNumber2[24303:229946] 数值 -- 1999.2
     */
}

@end
