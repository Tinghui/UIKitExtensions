//
//  Tests.m
//  Tests
//
//  Created by ZhangTinghui on 2017/4/17.
//  Copyright © 2017年 www.morefun.mobi. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIColor+Extensions.h"

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testHexColorStringConversion {
    XCTAssertEqualObjects(@"0XbAFF0000", [UIColor hexRGBAStringToARGBString:@"0XFF0000bA"]);
    XCTAssertEqualObjects(@"0x00fF0000", [UIColor hexRGBAStringToARGBString:@"0xfF000000"]);
    XCTAssertEqualObjects(@"#FFff1000", [UIColor hexRGBAStringToARGBString:@"#ff1000FF"]);
    XCTAssertNotEqualObjects(@"#00ff1000", [UIColor hexRGBAStringToARGBString:@"#FF100000"]);
}

- (void)testHexColorGenerationWithString {
    UIColor *targetColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    NSArray *colorStrings = @[@"#000000", @"#FF000000", @"0x000000", @"0xFF000000", @"0X000000", @"0Xff000000"];
    [colorStrings enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        XCTAssertEqualObjects(targetColor, [UIColor colorWithHexColorString:obj]);
    }];
    
    targetColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    XCTAssertEqualObjects(targetColor, [UIColor colorWithHexColorString:@"#00000000"]);
    
    targetColor = [UIColor colorWithRed:1.0 green:0.0 blue:1.0 alpha:0.0];
    XCTAssertEqualObjects(targetColor, [UIColor colorWithHexColorString:@"#00ff00ff"]);
    
}

@end
