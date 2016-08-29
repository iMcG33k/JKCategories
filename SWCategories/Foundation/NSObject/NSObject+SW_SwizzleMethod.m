//
//  NSObject+SW_SwizzleMethod.m
//  IOS-Categories
//
//  Created by iMcG33k on 2016/03/17.
//  Copyright © 2016年 https://github.com/iMcG33k. All rights reserved.
//


/* 功能说明:
 1.交换方法
 */

#import "NSObject+SW_SwizzleMethod.h"
#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@implementation NSObject(SW_SwizzleMethod)
// 快速交换两个 类方法
//TODO: 待修改（按照下面交换实例方法方式）
+ (void)SW_swizzleClassMethod:(Class)class originSelector:(SEL)originSelector swizzledSelector:(SEL)swizzledSelector
{
    Method originalMethod = class_getClassMethod(class, originSelector);
    Method otherMehtod = class_getClassMethod(class, swizzledSelector);
    BOOL didAddMethod =
    class_addMethod(class,
                    originSelector,
                    method_getImplementation(otherMehtod),
                    method_getTypeEncoding(otherMehtod));
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, otherMehtod);
    }
}

// 自己写的 快速交换两个 对象方法
+ (void)SW_swizzleInstanceMethod:(Class)class originSelector:(SEL)originSelector swizzledSelector:(SEL)swizzledSelector
{

    Method originalMethod = class_getInstanceMethod(class, originSelector);
    Method otherMehtod = class_getInstanceMethod(class, swizzledSelector);
    BOOL didAddMethod =
    class_addMethod(class,
                    originSelector,
                    method_getImplementation(otherMehtod),
                    method_getTypeEncoding(otherMehtod));
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, otherMehtod);
    }
}
@end