VRXVerbalExpressions
====================

An Objective-C implementation of [VerbalExpressions](https://github.com/VerbalExpressions)

## Installation
For now, just add VRXVerbalExpressions.h and VRXVerbalExpressions.m files to your project. 

(CocoaPods coming soon)


## Examples

### Testing if we have a valid URL
```Objective-C

//
// There are two ways of creating VRXExpressions. Either through
// a block based API:
//
id exp = [VRXVerbalExpression create:^(VRXVerbalExpression *r) {
        [r startOfLine];
        [r then:@"http"];
        [r maybe:@"s"];
        [r then:@"://"];
        [r maybe:@"www."];
        [r anythingBut:@" "];
        [r endOfLine];
}];

// 
// or a messages based API can be used:
// Note that startOfLine is both an instance and class method, 
// facilitating both methods of creating expressions
//
id exp = [[[[[[[VRXVerbalExpression startOfLine]
                   then:@"http"]
                  maybe:@"s"]
                 then:@"://"]
                maybe:@"www."]
               anythingBut:@" "]
              endOfLine];

//
// Once a VRXVerbalExpression has been created (id was used
// above for brevity), it can be tested for matches:
//
BOOL test = [exp test:@"https://www.google.com"];
```
## Developer setup : running the tests
The tests use [NSUnit](https://github.com/jacksonh/NSUnit), there is a Podfile included that will setup NSUnit for you. Just run `Pod install` in the VRXVerbalExpressions directory.

