//
//  main.m
//  Practice
//
//  Created by Prashanna Raghavan on 7/29/17.
//  Copyright © 2017 ASU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Practice : NSObject

-(BOOL)checkSum:(NSInteger)sum inArray:(NSArray *)array;
@end

@implementation Practice

-(BOOL)checkSum:(NSInteger)sum inArray:(NSArray *)array
{
    int i=0;
    int j=(int)[array count]-1;
    
    while (i <= j) {
        int first = [array[i] intValue];
        int second = [array[j] intValue];
        if(first+second == sum) {
            return YES;
        }
        else if(first+second < sum)
        {
            i++;
        }
        else if(first+second > sum)
        {
            j--;
        }
    }
    
    return NO;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Practice *practice = [[Practice alloc] init];
        NSArray *array = [NSArray arrayWithObjects:@1,@3,@4,@6,@9,nil];
        BOOL flag = [practice checkSum:17 inArray:array];
        NSLog(flag ? @"Yes":@"No");
    }
    return 0;
}
