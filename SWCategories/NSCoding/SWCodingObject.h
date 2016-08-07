//
//  SWCodingObject.h
//  IOS-Categories
//
//  Created by iMcG33k on 16/6/6.
//  Copyright © 2016年 www.skyfox.org. All rights reserved.
//

// 这个类的子类 具有以下特性:
// 1. copy 方法 深复制
// 2. 子类归档 不必再重写 encode decode方法

#import <Foundation/Foundation.h>

@interface SWCodingObject : NSObject <NSCoding, NSCopying>

@end
