//
//  NSObject+AppInfo.h
//  IOS-Categories
//
//  Created by nidom on 15/9/29.
//  Copyright © 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NSObject (AppInfo)
-(NSString *)ai_version;          // Bundle versions string, short
-(NSInteger)ai_build;             // Bundle version
-(NSString *)ai_identifier;       // bundle identifier
-(NSString *)ai_currentLanguage;  // example: en-US
-(NSString *)ai_deviceModel;      // example: x86_64
@end
