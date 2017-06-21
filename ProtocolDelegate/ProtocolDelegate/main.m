//
//  main.m
//  ProtocolDelegate
//
//  Created by Prashanna Raghavan on 6/21/17.
//  Copyright © 2017 ASU. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Rules <NSObject>

-(int)conformMeAndCallback;

@end

@interface ProtocolClass : NSObject

@property(nonatomic,weak) id<Rules> delegate;
-(void)triggerMethod;

@end

@implementation ProtocolClass

-(id)initWithDelegate:(id<Rules>)delegation{
    self = [super init];
    if (self) {
        self.delegate = delegation;
    }
    
    return self;
}

-(void)triggerMethod
{
    NSLog(@"I am going to ask callBackClass how many chocolate does she want ?");
    if ([self.delegate conformsToProtocol:@protocol(Rules)]) {
        int choco = [self.delegate conformMeAndCallback];
        NSLog(@"She wants %d chocolates",choco);
    }
}

@end

@interface CallBackClass : NSObject<Rules>

-(void)startPoint;

@end

@implementation CallBackClass

-(void)startPoint{
    ProtocolClass *protocolClass = [[ProtocolClass alloc] initWithDelegate:self];
    NSLog(@"Starting conversation between ProtocolClass and CallbackClass");
    [protocolClass triggerMethod];
}

-(int)conformMeAndCallback
{
    int chocolates = 5;
    NSLog(@"I want %d chocolates",chocolates);
    return chocolates;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        CallBackClass *callBackClass = [[CallBackClass alloc] init];
        [callBackClass startPoint];
    }
    return 0;
}
