//
//  main.m
//  ObjCTryIt
//
//  Created by Prashanna Raghavan on 6/20/17.
//  Copyright © 2017 ASU. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DrivingRules <NSObject>

-(int)speedLimit;
-(BOOL)doesConformToRegulation;

@end

@interface Car : NSObject<DrivingRules>
@property (nonatomic, copy) NSString *model;
@end

@implementation Car

-(int)speedLimit
{
    return 40;
}

-(BOOL)doesConformToRegulation
{
    return YES;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Car *honda = [[Car alloc] init];
        NSMutableString *model = [NSMutableString stringWithString:@"Honda Civic"];
        honda.model = model;
        
        NSLog(@"%@", honda.model);
        [model setString:@"Nissa Versa"];
        NSLog(@"%@", honda.model);
        
        SEL sel = @selector(speedLimit);
        if ([honda respondsToSelector:sel]) {
            int speed = [honda performSelector:sel];
            NSLog(@"Speed : %d",speed);
        }
        
        /*
        // insert code here...
        Car *car = [Car new];
        if ([car doesConformToRegulation]) {
            NSLog(@"Speed Limit : %d",[car speedLimit]);
        }
        
        __block int num = 1;
        __block NSUInteger blockTestVar = 1;

        printf("Num before block : %d\n",num);
        int(^myBlock)(int,int) = ^(int a,int b){
            num = num*a*b;
            printf("Num inside block : %d\n",num);
            blockTestVar++;
            num++;
            return num;
        };
        
        printf("Value returned from block : %d\nNum outside block : %d \n",myBlock(5,8),num);
        printf("Var : %lu\n",(unsigned long)blockTestVar);
        
        char *myCharacters[3] = { "TomJohn", "George", "Charles Condomine" };
        
        qsort_b(myCharacters, 3, sizeof(char *), ^(const void *l, const void *r) {
            char *left = *(char **)l;
            char *right = *(char **)r;
            return strncmp(left, right, 1);
        });
        
        for(int i=0;i<3;i++)
            NSLog(@"Characters : %s",myCharacters[i]);
        
        NSArray *stringsArray = @[ @"string 1",
                                   @"String 21",
                                   @"string 12",
                                   @"String 11",
                                   @"String 02" ];
        
        static NSStringCompareOptions comparisonOptions = NSCaseInsensitiveSearch | NSNumericSearch |
        NSWidthInsensitiveSearch | NSForcedOrderingSearch;
        NSLocale *currentLocale = [NSLocale currentLocale];
        
        NSComparator finderSortBlock = ^(id string1, id string2) {
            
            NSRange string1Range = NSMakeRange(0, [string1 length]);
            return [string1 compare:string2 options:comparisonOptions range:string1Range locale:currentLocale];
        };
        
        NSArray *finderSortArray = [stringsArray sortedArrayUsingComparator:finderSortBlock];
        NSLog(@"finderSortArray: %@", finderSortArray);
        
        
         Output:
         finderSortArray: (
         "string 1",
         "String 02",
         "String 11",
         "string 12",
         "String 21"
         )
         
        
        int year = 1967;          // Define a normal variable
        int *pointer;             // Declare a pointer that points to an int
        pointer = &year;          // Find the memory address of the variable
        NSLog(@"Pointer : %d", *pointer);   // Dereference the address to get its value
        *pointer = 1990;          // Assign a new value to the memory address
        NSLog(@"Year : %d", year);       // Access the value via the variable
        
        */
    }
    return 0;
}
