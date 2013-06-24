//
//  NSObject+Subscripts.m
//  SubscriptingTest
//
//  Created by Daniel DeCovnick on 6/20/13.
//  Copyright (c) 2013 Softyards. All rights reserved.
//

#import "NSObject+Subscripts.h"
#import "NSString+Indexing.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation NSObject (Subscripts)

- (id)objectForKeyedSubscript:(id)key
{
    if ([key isKindOfClass:[NSString class]])
    {
        if ([key componentsSeparatedByString:@"."].count > 1)
        {
            return [self valueForKeyPath:key];
        }
        else
        {
            return [self valueForKey:key];
        }
    }
    else
    {
        return nil; // really?
    }
}
+ (id)objectForKeyedSubscript:(id)key
{
    unsigned int outCount;
    id ret = nil;
    if ([self instancesRespondToSelector:@selector(initWithCoder:)] && [key isKindOfClass:[NSCoder class]])
    {
        return [[[self alloc] initWithCoder:key] autorelease];
    }
    //todo: cache these results in an associated object
    Method *theseMethods = class_copyMethodList(self, &outCount);
    NSMutableIndexSet *methodArrayHits = [[NSMutableIndexSet alloc] init];
    for (unsigned int i = 0; i < outCount; i++) {
        NSString *initName = NSStringFromSelector(method_getName(theseMethods[i]));
        if ([initName isEqualToString:@"initWithCoder:"])
        {
            continue;
        }
        if ([[NSString reasonableTypeEncodingForMethod:theseMethods[i]] isEqualToString:@"@@:@"] && [initName hasPrefix:@"initWith"])
        {
            [methodArrayHits addIndex:i];
        }
    }
    if ([methodArrayHits count] == 1)
    {
        SEL sele = method_getName(theseMethods[[methodArrayHits firstIndex]]);
        ret = [[self alloc] performSelector:sele withObject:key];
    }
    free(theseMethods);
    [methodArrayHits release];
    return [ret autorelease];
}
@end
