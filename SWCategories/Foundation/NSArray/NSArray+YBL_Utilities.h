//
//  NSArray+YBL_Utilities.h
//  IOS-Categories
//
//  Created by iMcG33k on 2016/03/17.
//  Copyright © 2016年 https://github.com/iMcG33k. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (YBL_Utilities)

// 数组去重
- (NSArray *)ybl_OmitRepeatElementsOrdered:(NSArray *)originArr;    // 有序
- (NSArray *)ybl_omitRepeatElementsUnordered:(NSArray *)originArr;  // 无序


@end
