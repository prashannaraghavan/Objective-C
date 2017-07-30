//
//  main.m
//  CodeDebug
//
//  Created by Prashanna Raghavan on 7/30/17.
//  Copyright © 2017 ASU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Debug.h"
#import "Blocks.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Debug *debug = [[Debug alloc] init];
        Blocks *blocks = [[Blocks alloc] init];
    
        void(^displayValue)(int a) = ^(int a){
            NSLog(@"Information : %d",a);
        };
        
        int value = [[debug display:@"12"] intValue];
        displayValue(value);
        [blocks displayValue:value withBlock:^(NSString *string) {
            NSLog(@"%@",string);
        }];
        
        debug = nil;
        [debug display:@"Test"];
    }
    return 0;
}
