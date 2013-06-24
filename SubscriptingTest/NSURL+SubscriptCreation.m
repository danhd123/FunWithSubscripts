//
//  NSURL+SubscriptCreation.m
//  SubscriptingTest
//
//  Created by Daniel DeCovnick on 6/22/13.
//  Copyright (c) 2013 Softyards. All rights reserved.
//

#import "NSURL+SubscriptCreation.h"

@implementation NSURL (SubscriptCreation)
+ (id)objectForKeyedSubscript:(id)key
{
    if ([key isKindOfClass:[NSCoder class]])
    {
        return [[NSURL alloc] initWithCoder:key];
    }
    if ([key isKindOfClass:[NSString class]])
    {
        return [[NSURL alloc] initWithString:key];
    }
    if ([key isKindOfClass:[NSArray class]])
    {
        return [NSURL fileURLWithPathComponents:key];
    }
    else @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"NSURL does not subscript except strings, arrays, and coders" userInfo:key];
}
@end
