//
//  NSObject+YBL_SwizzleMethod.h
//  IOS-Categories
//
//  Created by iMcG33k on 2016/03/17.
//  Copyright © 2016年 https://github.com/iMcG33k. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (YBL_SwizzleMethod)

+ (void)ybl_swizzleClassMethod:(Class)class originSelector:(SEL)originSelector otherSelector:(SEL)otherSelector;

+ (void)ybl_swizzleInstanceMethod:(Class)class originSelector:(SEL)originSelector otherSelector:(SEL)otherSelector;

@end
