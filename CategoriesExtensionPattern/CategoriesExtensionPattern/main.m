//
//  main.m
//  CategoriesExtensionPattern
//
//  Created by Prashanna Raghavan on 6/26/17.
//  Copyright © 2017 ASU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryClass : NSObject

-(void)triggerMethod:(Class)class;

@end

@interface CategoryClass()

-(void)extensionMethod:(Class)class;

@end

@implementation CategoryClass

-(void)triggerMethod:(Class)class
{
    NSLog(@"This is a method from %@",class);
}

-(void)extensionMethod:(Class)class
{
    NSLog(@"This is a method from %@ extension",class);
}

@end

@interface CategoryClass (FirstModule)

-(void)categoryMethod:(Class)class;

@end

@implementation CategoryClass (FirstModule)

-(void)categoryMethod:(Class)class
{
    NSLog(@"This is a method from %@ FirstModule",class);
}

@end

@interface SubCategoryClass : CategoryClass

@end

@implementation SubCategoryClass

@end

@interface RandomClass : NSObject
{
    CategoryClass *categoryClass;
}
@end

@implementation RandomClass

-(id)init{
    self = [super init];
    if (self) {
        categoryClass = [[CategoryClass alloc] init];
        [categoryClass triggerMethod:[self class]];
        [categoryClass categoryMethod:[self class]];
        [categoryClass extensionMethod:[self class]];
    }
    
    return self;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        CategoryClass *categoryClass = [[CategoryClass alloc] init];
        [categoryClass triggerMethod:[categoryClass class]];
        [categoryClass categoryMethod:[categoryClass class]];
        [categoryClass extensionMethod:[categoryClass class]];
        
        SubCategoryClass *subCategoryClass = [[SubCategoryClass alloc] init];
        [subCategoryClass triggerMethod:[subCategoryClass class]];
        [subCategoryClass extensionMethod:[subCategoryClass class]];
        [subCategoryClass categoryMethod:[subCategoryClass class]];
        
        RandomClass *randomClass = [[RandomClass alloc] init];
    }
    return 0;
}
