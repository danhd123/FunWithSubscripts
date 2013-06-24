//
//  NSString+Indexing.h
//  SubscriptingTest
//
//  Created by Daniel DeCovnick on 6/20/13.
//  Copyright (c) 2013 Softyards. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSString (Indexing)
- (id)objectAtIndexedSubscript:(NSUInteger)idx;
+ (NSString *)reasonableTypeEncodingForMethod:(Method)method;
@end
