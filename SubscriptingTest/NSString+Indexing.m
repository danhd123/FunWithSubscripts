//
//  NSString+Indexing.m
//  SubscriptingTest
//
//  Created by Daniel DeCovnick on 6/20/13.
//  Copyright (c) 2013 Softyards. All rights reserved.
//

#import "NSString+Indexing.h"
#import <objc/runtime.h>

@implementation NSString (Indexing)
- (id)objectAtIndexedSubscript:(NSUInteger)idx
{
    return [self substringWithRange:NSMakeRange(idx, 1)];
}
+ (NSString *)reasonableTypeEncodingForMethod:(Method)method
{
    
    NSString *ret = [NSString stringWithUTF8String:method_getTypeEncoding(method)];
    NSCharacterSet *numbers = [NSCharacterSet decimalDigitCharacterSet];
    ret = [[ret componentsSeparatedByCharactersInSet:numbers] componentsJoinedByString:@""];
    return ret;
}
@end
