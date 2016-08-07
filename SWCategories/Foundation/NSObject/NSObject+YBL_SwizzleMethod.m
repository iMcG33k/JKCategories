//
//  NSObject+YBL_SwizzleMethod.m
//  IOS-Categories
//
//  Created by iMcG33k on 2016/03/17.
//  Copyright © 2016年 https://github.com/iMcG33k. All rights reserved.
//


/* 功能说明:
 1.交换方法
 */

#import "NSObject+YBL_SwizzleMethod.h"
#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@implementation NSObject(YBL_SwizzleMethod)
// 快速交换两个 类方法
+ (void)ybl_swizzleClassMethod:(Class)class originSelector:(SEL)originSelector otherSelector:(SEL)otherSelector
{
  Method otherMehtod = class_getClassMethod(class, otherSelector);
  Method originMehtod = class_getClassMethod(class, originSelector);
  // 交换2个方法的实现
  method_exchangeImplementations(otherMehtod, originMehtod);
}

// 自己写的 快速交换两个 对象方法
+ (void)ybl_swizzleInstanceMethod:(Class)class originSelector:(SEL)originSelector otherSelector:(SEL)otherSelector
{
  Method otherMehtod = class_getInstanceMethod(class, otherSelector);
  Method originMehtod = class_getInstanceMethod(class, originSelector);
  // 交换2个方法的实现
  method_exchangeImplementations(otherMehtod, originMehtod);
}
@end