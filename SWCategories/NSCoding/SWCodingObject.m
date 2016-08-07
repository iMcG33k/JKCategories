//
//  SWCodingObject.m
//  IOS-Categories
//
//  Created by iMcG33k on 16/6/6.
//  Copyright © 2016年 www.skyfox.org. All rights reserved.
//

#import "SWCodingObject.h"
#import <objc/runtime.h>

@implementation SWCodingObject


- (id)copyWithZone:(NSZone *)zone {
  id obj = [[[self class] allocWithZone:zone] init];
  
  Class c = self.class;
  // 截取类和父类的成员变量
  while (c && c != [NSObject class]) {
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList(c, &count);
    for (int i = 0; i < count; i++) {
      
      NSString *key = [NSString stringWithUTF8String:ivar_getName(ivars[i])];
      
      // 如果是对象类型就 copy, 基本数据类型就直接赋值
      if ([[self valueForKey:key] isKindOfClass:[NSObject class]]) {
        [obj setValue:[[self valueForKey:key] copy] forKey:key];
      } else {
        [obj setValue:[self valueForKey:key]  forKey:key];
      }
      
      
    }
    // 获得c的父类
    c = [c superclass];
    free(ivars);
  }

  return obj;
}

- (id)initWithCoder:(NSCoder *)decoder
{
  if (self = [super init]) {
    Class c = self.class;
    // 截取类和父类的成员变量
    while (c && c != [NSObject class]) {
      unsigned int count = 0;
      Ivar *ivars = class_copyIvarList(c, &count);
      for (int i = 0; i < count; i++) {
        
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivars[i])];
        
        id value = [decoder decodeObjectForKey:key];
        
        [self setValue:value forKey:key];
        
      }
      // 获得c的父类
      c = [c superclass];
      free(ivars);
    }
    
    
  }
  return self;
}


- (void)encodeWithCoder:(NSCoder *)encoder
{
  Class c = self.class;
  // 截取类和父类的成员变量
  while (c && c != [NSObject class]) {
    unsigned int count = 0;
    
    Ivar *ivars = class_copyIvarList(c, &count);
    
    for (int i = 0; i < count; i++) {
      Ivar ivar = ivars[i];
      NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
      
      id value = [self valueForKey:key];
      
      [encoder encodeObject:value forKey:key];
    }
    c = [c superclass];
    // 释放内存
    free(ivars);
  }
}

@end
