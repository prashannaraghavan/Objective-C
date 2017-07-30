//
//  Blocks.m
//  CodeDebug
//
//  Created by Prashanna Raghavan on 7/30/17.
//  Copyright © 2017 ASU. All rights reserved.
//

#import "Blocks.h"

@implementation Blocks

-(void)displayValue:(int)value withBlock:(CompletionBlock)completionBlock
{
    NSString *string = [NSString stringWithFormat:@"Information is %d",value];
    completionBlock(string);
}

@end
