//
//  main.m
//  MultiNet
//
//  Created by Prashanna Raghavan on 7/3/17.
//  Copyright © 2017 ASU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Network : NSURLSession

@end

@implementation Network



@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSURL *URL = [NSURL URLWithString:@"https://jsonplaceholder.typicode.com/users"];
        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
        
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                                completionHandler:
                                      ^(NSData *data, NSURLResponse *response, NSError *error) {
                                          
                                      }];
        
        [task resume];
    }
    return 0;
}
