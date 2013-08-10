VRXVerbalExpressions
====================

An Objective-C implementation of [VerbalExpressions](https://github.com/VerbalExpressions)

## Installation
For now, just add VRXVerbalExpressions.h and VRXVerbalExpressions.m files to your project. 

(CocoaPods coming soon)


## Examples

### Testing if we have a valid URL
```Objective-C
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
```
## Developer setup : running the tests
The tests use [NSUnit](https://github.com/jacksonh/NSUnit), there is a Podfile included that will setup NSUnit for you. Just run `Pod install` in the VRXVerbalExpressions directory.

