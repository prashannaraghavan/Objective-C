//
//  main.m
//  KeyValueObservingPattern
//
//  Created by Prashanna Raghavan on 6/21/17.
//  Copyright © 2017 ASU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyValueClass : NSObject

@property(nonatomic,strong) NSString *value;
@property int number;

-(void)changeValueTo:(NSString *)newValue andNumber:(int)no;

@end

@implementation KeyValueClass

-(id)initWithValue:(NSString *)data andNumber:(int)no
{
    self = [super init];
    if (self) {
        _value = data;
        _number = no;
    }
    return self;
}

-(void)changeValueTo:(NSString *)newValue andNumber:(int)no
{
    self.value = newValue;
    self.number = no;
}

@end

@interface KeyValueObservingClass : NSObject
{
    KeyValueClass *keyValueClass;
}

-(void)triggerFunction;

@end

static void *valueContext;
static void *numberContext;

@implementation KeyValueObservingClass

-(void)dealloc
{
    [keyValueClass removeObserver:self forKeyPath:@"value"];
    [keyValueClass removeObserver:self forKeyPath:@"number"];
}

-(id)init
{
    self = [super init];
    if (self) {
        keyValueClass = [[KeyValueClass alloc] initWithValue:@"Hello" andNumber:5];
        [keyValueClass addObserver:self forKeyPath:@"value" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:valueContext];
        [keyValueClass addObserver:self forKeyPath:@"number" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:numberContext];
    }
    
    return self;
}

-(void)triggerFunction
{
    [keyValueClass changeValueTo:@"World" andNumber:5];
    [keyValueClass changeValueTo:@"Hello" andNumber:6];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (context == valueContext) {
        NSLog(@"Value changed : \n%@",change);
    }
    
    else if (context == numberContext)
    {
        NSLog(@"Number changed : \n%@",change);
    }
    
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        KeyValueObservingClass *KVO = [[KeyValueObservingClass alloc] init];
        [KVO triggerFunction];
    }
    return 0;
}
