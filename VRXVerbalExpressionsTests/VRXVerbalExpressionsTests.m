//
//  VRXVerbalExpressionsTests.m
//  VRXVerbalExpressionsTests
//
//  Created by Jackson Harper on 8/9/13.
//  Copyright (c) 2013 Harper Semiconductors, Inc.
//

#import "VRXVerbalExpressionsTests.h"
#import "VRXVerbalExpression.h"

#import <NSUnit/NSUnit.h>

@implementation VRXVerbalExpressionsTests

- (void)testCreateBlock_validUrl_passesTest
{
    id exp = [VRXVerbalExpression create:^(VRXVerbalExpression *r) {
        [r startOfLine];
        [r then:@"http"];
        [r maybe:@"s"];
        [r then:@"://"];
        [r maybe:@"www."];
        [r anythingBut:@" "];
        [r endOfLine];
    }];

    BOOL test = [exp test:@"https://www.google.com"];
    [Assert that:@(test) is:[Equal to:@(TRUE)]];
}

- (void)testMessageMethod
{
    id exp = [[[[[[[VRXVerbalExpression startOfLine]
                   then:@"http"]
                  maybe:@"s"]
                   then:@"://"]
                  maybe:@"www."]
            anythingBut:@" "]
                endOfLine];

    BOOL test = [exp test:@"https://www.google.com"];
    [Assert that:@(test) is:[Equal to:@(TRUE)]];
}

- (void)testCreateBlock_invalidUrl_failsTest
{
    id exp = [VRXVerbalExpression create:^(VRXVerbalExpression *r) {
        [r startOfLine];
        [r then:@"http"];
        [r maybe:@"s"];
        [r then:@"://"];
        [r maybe:@"www."];
        [r anythingBut:@" "];
        [r endOfLine];
    }];
    
    BOOL test = [exp test:@"invalidurl"];
    [Assert that:@(test) is:[Equal to:@(FALSE)]];
}

- (void)testMessageStyle_invalidUrl_failsTest
{
    id exp = [[[[[[[VRXVerbalExpression startOfLine]
                   then:@"http"]
                  maybe:@"s"]
                 then:@"://"]
                maybe:@"www."]
               anythingBut:@" "]
              endOfLine];
    
    BOOL test = [exp test:@"invalidurl"];
    [Assert that:@(test) is:[Equal to:@(FALSE)]];
}


@end
