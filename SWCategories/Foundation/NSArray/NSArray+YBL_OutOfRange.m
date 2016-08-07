//
//  NSArray+YBL_OutOfRange.m
//  IOS-Categories
//
//  Created by iMcG33k on 2016/03/17.
//  Copyright © 2016年 https://github.com/iMcG33k. All rights reserved.
//

#import "NSArray+YBL_OutOfRange.h"
#import "NSObject+YBL_SwizzleMethod.h"

@implementation NSArray (YBL_OutOfRange)
+ (void)load
{
  [self ybl_swizzleInstanceMethod:NSClassFromString(@"__NSArrayI") originSelector:@selector(objectAtIndex:) otherSelector:@selector(p_objectAtIndex:)];

}

- (id)p_objectAtIndex:(NSUInteger)index
{
  if (index < self.count) {
    return [self p_objectAtIndex:index];
  } else {
    NSLog(@"不小心数组越界了:数组长度 = %tu, 请求index = %tu", self.count, index);
    return nil;
  }
}
@end
