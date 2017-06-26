//
//  main.m
//  Blocks
//
//  Created by Prashanna Raghavan on 6/26/17.
//  Copyright © 2017 ASU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlockClass : NSObject

-(void)triggerFunction:(void(^)(int a,int b))completionBlock;

@end

typedef void(^CompletionHandler)(int a,int b);

@implementation BlockClass

-(void)triggerFunction:(CompletionHandler)completionBlock
{
    int a = 10;
    int b = 20;
    NSLog(@"BlockClass : In triggerFunction");
    completionBlock(a,b);
}

@end

@interface CallBackClass : NSObject

-(void)triggerFunction;

@end

void(^blockFunction)(int a,int b);

@implementation CallBackClass

-(void)triggerFunction
{
    BlockClass *blockClass = [[BlockClass alloc] init];
    NSLog(@"CallBackClass: Before calling triggerFunction of BlockClass");
    [blockClass triggerFunction:^(int a, int b) {
        int sum = a+b;
        NSLog(@"Sum is :%d",sum);
    }];
    NSLog(@"CallBackClass: After calling triggerFunction of BlockClass");
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        CallBackClass *callBackClass = [[CallBackClass alloc] init];
        [callBackClass triggerFunction];
    
    }
    return 0;
}
