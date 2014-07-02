//
//  VRXVerbalExpressions.h
//  VRXVerbalExpressions
//
//  Created by Jackson Harper on 8/9/13.
//  Copyright (c) 2013 Harper Semiconductors, Inc.
//

#import <Foundation/Foundation.h>

@interface VRXVerbalExpression : NSObject

+ (VRXVerbalExpression *) create:(void (^)(VRXVerbalExpression *)) b;

+ (VRXVerbalExpression *) startOfLine;
- (VRXVerbalExpression *) startOfLine;
+ (VRXVerbalExpression *) endOfLine;
- (VRXVerbalExpression *) endOfLine;

+ (VRXVerbalExpression *) then:(NSString *) s;
- (VRXVerbalExpression *) then:(NSString *) s;

+ (VRXVerbalExpression *) maybe:(NSString *) s;
- (VRXVerbalExpression *) maybe:(NSString *) s;
+ (VRXVerbalExpression *) anythingBut:(NSString *) s;
- (VRXVerbalExpression *) anythingBut:(NSString *) s;


- (BOOL) test:(NSString *) str;

@end
