//
//  NSObject+Subscripts.h
//  SubscriptingTest
//
//  Created by Daniel DeCovnick on 6/20/13.
//  Copyright (c) 2013 Softyards. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Subscripts)
- (id)objectForKeyedSubscript:(id)key;
+ (id)objectForKeyedSubscript:(id)key;
@end
