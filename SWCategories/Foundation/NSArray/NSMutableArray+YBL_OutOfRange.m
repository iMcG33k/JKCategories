//
//  NSMutableArray+YBL_OutOfRange.m
//  IOS-Categories
//
//  Created by iMcG33k on 2016/03/17.
//  Copyright © 2016年 https://github.com/iMcG33k. All rights reserved.
//

#import "NSMutableArray+YBL_OutOfRange.h"
#import "NSObject+SW_SwizzleMethod.h"

@implementation NSMutableArray (YBL_OutOfRange)
+ (void)load
{
  [self SW_swizzleInstanceMethod:NSClassFromString(@"__NSArrayM") originSelector:@selector(addObject:) swizzledSelector:@selector(p_addObject:)];
  [self SW_swizzleInstanceMethod:NSClassFromString(@"__NSArrayM") originSelector:@selector(objectAtIndex:) swizzledSelector:@selector(p_objectAtIndex:)];
}

// NSMutableArray 添加元素时自动忽略nil
- (void)p_addObject:(id)object
{
  if (object != nil) {
    [self p_addObject:object];
  } else {
    NSLog(@"不小心向可变数组中加入了nil对象");
  }
}

// 避免数组越界崩溃
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