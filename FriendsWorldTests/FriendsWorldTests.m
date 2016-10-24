//
//  FriendsWorldTests.m
//  FriendsWorldTests
//
//  Created by Xander on 10/10/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LinkedList.h"
#import "Person.h"
@interface FriendsWorldTests : XCTestCase

@end

@implementation FriendsWorldTests

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
    LinkedList *l = [[LinkedList alloc] init];
    [l setup];
    //Appending
    [l append:@"c"];
    XCTAssertEqual([l getDataAt:0], @"c");
    XCTAssertEqual([l length], 1);
    
    //Prepending
    [l prepend:@"a"];
    XCTAssertEqual([l length], 2);
    XCTAssertEqual([l getDataAt:0], @"a");
    XCTAssertEqual([l getDataAt:1], @"c");
    
    //Inserting
    [l insert:@"b" at:1];
    XCTAssertEqual([l getDataAt:0], @"a");
    XCTAssertEqual([l getDataAt:1], @"b");
    XCTAssertEqual([l getDataAt:2], @"c");
    XCTAssertEqual([l length], 3);
    
    //Inserting before
    [l insertBefore:@"b0" before:1];
    XCTAssertEqual([l getDataAt:0], @"a");
    XCTAssertEqual([l getDataAt:1], @"b0");
    XCTAssertEqual([l getDataAt:2], @"b");
    XCTAssertEqual([l getDataAt:3], @"c");
    XCTAssertEqual([l length], 4);
    
    //Inserting after
    [l insertAfter:@"b1" after:2];
    XCTAssertEqual([l getDataAt:0], @"a");
    XCTAssertEqual([l getDataAt:1], @"b0");
    XCTAssertEqual([l getDataAt:2], @"b");
    XCTAssertEqual([l getDataAt:3], @"b1");
    XCTAssertEqual([l getDataAt:4], @"c");
    XCTAssertEqual([l length], 5);
    
    //Inserting at 0
    [l insert:@"a0" at:0];
    XCTAssertEqual([l length], 6);
    XCTAssertEqual([l getDataAt:0], @"a0");
    XCTAssertEqual([l getDataAt:1], @"a");
    XCTAssertEqual([l getDataAt:2], @"b0");
    XCTAssertEqual([l getDataAt:3], @"b");
    XCTAssertEqual([l getDataAt:4], @"b1");
    XCTAssertEqual([l getDataAt:5], @"c");
    
    //Inserting at the end
    [l insert:@"c1" at:[l length]];
    XCTAssertEqual([l length], 7);
    XCTAssertEqual([l getDataAt:0], @"a0");
    XCTAssertEqual([l getDataAt:1], @"a");
    XCTAssertEqual([l getDataAt:2], @"b0");
    XCTAssertEqual([l getDataAt:3], @"b");
    XCTAssertEqual([l getDataAt:4], @"b1");
    XCTAssertEqual([l getDataAt:5], @"c");
    XCTAssertEqual([l getDataAt:6], @"c1");
    
    //Setting data, which contains removing data
    [l setDataAt:@"d" at:6];
    [l setDataAt:@"a00" at:0];
    [l setDataAt:@"b2" at:4];
    XCTAssertEqual([l length], 7);
    XCTAssertEqual([l getDataAt:0], @"a00");
    XCTAssertEqual([l getDataAt:1], @"a");
    XCTAssertEqual([l getDataAt:2], @"b0");
    XCTAssertEqual([l getDataAt:3], @"b");
    XCTAssertEqual([l getDataAt:4], @"b2");
    XCTAssertEqual([l getDataAt:5], @"c");
    XCTAssertEqual([l getDataAt:6], @"d");
    
    //Removing
    [l removeAt:0];
    [l removeLast];
    XCTAssertEqual([l length], 5);
    XCTAssertEqual([l getDataAt:0], @"a");
    XCTAssertEqual([l getDataAt:1], @"b0");
    XCTAssertEqual([l getDataAt:2], @"b");
    XCTAssertEqual([l getDataAt:3], @"b2");
    XCTAssertEqual([l getDataAt:4], @"c");
    
    //Indexing
    XCTAssertEqual([l indexOf:@"a"], 0);
    XCTAssertEqual([l indexOf:@"b"], 2);
    XCTAssertEqual([l indexOf:@"c"], 4);
    
    //Containing
    XCTAssertTrue([l contains:@"a"]);
    XCTAssertTrue([l contains:@"b"]);
    XCTAssertTrue([l contains:@"c"]);
    XCTAssertFalse([l contains:@"f"]);
    
    //Clearing
    [l clear];
    XCTAssertEqual([l length], 0);
    XCTAssertFalse([l contains:@"a"]);
    
    Person *p = [[Person alloc] initWithName:@"john"];
    XCTAssertEqual(p.name, @"john");
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
