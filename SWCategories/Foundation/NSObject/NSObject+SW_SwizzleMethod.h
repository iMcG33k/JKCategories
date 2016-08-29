//
//  NSObject+SW_SwizzleMethod.h
//  IOS-Categories
//
//  Created by iMcG33k on 2016/03/17.
//  Copyright © 2016年 https://github.com/iMcG33k. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SW_SwizzleMethod)

+ (void)SW_swizzleClassMethod:(Class)class originSelector:(SEL)originSelector swizzledSelector:(SEL)swizzledSelector;

+ (void)SW_swizzleInstanceMethod:(Class)class originSelector:(SEL)originSelector swizzledSelector:(SEL)swizzledSelector;

@end
