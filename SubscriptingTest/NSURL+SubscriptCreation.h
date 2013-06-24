//
//  NSURL+SubscriptCreation.h
//  SubscriptingTest
//
//  Created by Daniel DeCovnick on 6/22/13.
//  Copyright (c) 2013 Softyards. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (SubscriptCreation)
+ (id)objectForKeyedSubscript:(id)key;
@end
