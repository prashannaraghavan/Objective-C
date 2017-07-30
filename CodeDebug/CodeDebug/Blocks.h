//
//  Blocks.h
//  CodeDebug
//
//  Created by Prashanna Raghavan on 7/30/17.
//  Copyright © 2017 ASU. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CompletionBlock)(NSString *string);

@interface Blocks : NSObject

-(void)displayValue:(int)value withBlock:(CompletionBlock)completionBlock;

@end
