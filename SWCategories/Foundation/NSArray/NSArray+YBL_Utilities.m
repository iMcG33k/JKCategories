//
//  NSArray+YBLUtilities.m
//  IOS-Categories
//
//  Created by iMcG33k on 2016/03/17.
//  Copyright © 2016年 https://github.com/iMcG33k. All rights reserved.
//

#import "NSArray+YBL_Utilities.h"

@implementation NSArray (YBL_Utilities)

- (NSArray *)omitRepeatElementsOrdered:(NSArray *)originArr {
  
  NSMutableArray *resultArr = [NSMutableArray array];
  
  for (NSString *elem in originArr) {
    if (![resultArr containsObject:elem]) {
      [resultArr addObject:elem];
    }
  }
  
  return [resultArr copy];
}

- (NSArray *)omitRepeatElementsUnordered:(NSArray *)originArr {
  return [[NSSet setWithArray:originArr] allObjects];
}

@end
