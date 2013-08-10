//
//  VRXVerbalExpressions.m
//  VRXVerbalExpressions
//
//  Created by Jackson Harper on 8/9/13.
//  Copyright (c) 2013 Syntax Tree. All rights reserved.
//

#import "VRXVerbalExpression.h"

@interface VRXVerbalExpression ()

@property (strong, nonatomic) NSString *prefixes;
@property (strong, nonatomic) NSString *suffixes;
@property (strong, nonatomic) NSMutableString *source;

@end


@implementation VRXVerbalExpression

- (instancetype) init
{
    self = [super init];
    if (self) {
        _prefixes = @"";
        _suffixes = @"";
        _source = [[NSMutableString alloc] initWithString:@""];
    }
    return self;
}

+ (VRXVerbalExpression *) create:(void (^)(VRXVerbalExpression *)) b
{
    VRXVerbalExpression *res = [[VRXVerbalExpression alloc] init];
    b (res);
    return res;
}

+ (VRXVerbalExpression *) startOfLine
{
    VRXVerbalExpression *res = [[VRXVerbalExpression alloc] init];
    return [res startOfLine];
}

- (VRXVerbalExpression *) startOfLine
{
    [self setPrefixes:@"^"];
    return self;
}

- (VRXVerbalExpression *) endOfLine
{
    [self setSuffixes:@"$"];
    return self;
}

+ (VRXVerbalExpression *) endOfLine
{
    VRXVerbalExpression *r = [[VRXVerbalExpression alloc] init];
    return [r startOfLine];
}

+ (VRXVerbalExpression *) then:(NSString *) s
{
    VRXVerbalExpression *r = [[VRXVerbalExpression alloc] init];
    return [r then:s];
}

- (VRXVerbalExpression *) then:(NSString *) s
{
    return [self addSource:@"(%@)" withArg:s];
}

+ (VRXVerbalExpression *) maybe:(NSString *) s
{
    VRXVerbalExpression *r = [[VRXVerbalExpression alloc] init];
    return [r maybe:s];
}

- (VRXVerbalExpression *) maybe:(NSString *) s
{
    return [self addSource:@"(%@)?" withArg:s];
}

+ (VRXVerbalExpression *) anythingBut:(NSString *) s
{
    VRXVerbalExpression *r = [[VRXVerbalExpression alloc] init];
    return [r anythingBut:s];
}

- (VRXVerbalExpression *) anythingBut:(NSString *) s
{
    return [self addSource:@"([^%@]*)" withArg:s];
}

- (VRXVerbalExpression *) addSource:(NSString *) fmt withArg:(NSString *) s
{
    NSString *escaped = [NSRegularExpression escapedPatternForString:s];
    [[self source] appendFormat:fmt, escaped];
    return self;
}

- (BOOL) test:(NSString *) str
{
    NSError *error;
    NSString *pattern = [NSString stringWithFormat:@"%@%@%@", [self prefixes], [self source], [self suffixes]];
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:&error];
    
    NSLog (@"pattern:  %@", pattern);
    if (error) {
        NSLog (@"INVALID REGEX PATTERN:  %@", [error localizedDescription]);
    }
    
    NSUInteger count = [regex numberOfMatchesInString:str options:0 range:NSMakeRange(0, [str length])];
    return count > 0;
}


@end
