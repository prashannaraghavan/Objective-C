//
//  main.m
//  NotificationPattern
//
//  Created by Prashanna Raghavan on 6/21/17.
//  Copyright © 2017 ASU. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString* const notification;

@interface BroadcastingClass : NSObject

@end

@implementation BroadcastingClass

NSString* const notification = @"SayHi";

-(id)init{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

-(void)broadCastNow
{
    NSLog(@"BroadCasting Hi !!");
    [[NSNotificationCenter defaultCenter] postNotificationName:notification object:@"Hello people !!"];
}

@end

@interface CallBackClass : NSObject

-(void)startPoint;

@end

@implementation CallBackClass

-(void)dealloc
{
    NSLog(@"CallBackClass : Remove observer when it is no longer required");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)startPoint{
    NSLog(@"CallBackClass : Add observer when you wanna respond to the broadcast");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(respondToBroadCast:) name:notification object:nil];
}

-(void)respondToBroadCast:(NSNotification *)sender
{
    NSLog(@"CallBackClass : \nNotification Received : %@\nMessage received: %@",[sender name],[sender object]);
}

@end

@interface CallBackClass1 : NSObject

-(void)startPoint;

@end

@implementation CallBackClass1

-(void)dealloc
{
    NSLog(@"CallBackClass1 : Remove observer when it is no longer required");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)startPoint{
    NSLog(@"CallBackClass1 : Add observer when you wanna respond to the broadcast");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(respondToBroadCast:) name:notification object:nil];
}

-(void)respondToBroadCast:(NSNotification *)sender
{
    NSLog(@"CallBackClass1 : \nNotification Received : %@\nMessage received: %@",[sender name],[sender object]);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        CallBackClass *callBackClass = [[CallBackClass alloc] init];
        [callBackClass startPoint];
        
        CallBackClass1 *callBackClass1 = [[CallBackClass1 alloc] init];
        [callBackClass1 startPoint];
        
        BroadcastingClass *broadcastingClass = [[BroadcastingClass alloc] init];
        [broadcastingClass broadCastNow];
    }
    return 0;
}
