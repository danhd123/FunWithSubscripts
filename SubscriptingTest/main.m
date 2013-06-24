//
//  main.m
//  SubscriptingTest
//
//  Created by Daniel DeCovnick on 6/20/13.
//  Copyright (c) 2013 Softyards. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Indexing.h"
#import "NSObject+Subscripts.h"

@interface NSOperation (Subscripts)
+ (id)objectForKeyedSubscript:(id)key;
@end
@implementation NSOperation (Subscripts)
+ (id)objectForKeyedSubscript:(id)key
{
    return @"Barsoom!";
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSString *foo = @"Hello World!";
        NSString *w = foo[6];
        NSLog(@"%@",w);
        NSOperation *op = [[NSOperation alloc] init];
        NSLog(@"%@", op[@"isReady"]);
        NSLog(@"%@", [NSOperation self][@"Bar"]);
        NSCalendar *calendar = [NSCalendar self][[[NSLocale currentLocale] localeIdentifier]];
        NSLog(@"%@", calendar);
        NSURL *earl = [NSURL self][@"http://www.apple.com/"];
        NSLog(@"earl = %@", earl);
    }
    return 0;
}

