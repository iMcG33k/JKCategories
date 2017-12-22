//
//  UIViewController+SWExtension.m
//  JKCategories-Demo
//
//  Created by Naton on 2017/9/11.
//  Copyright © 2017年 www.skyfox.org. All rights reserved.
//

#import "UIViewController+SWExtension.h"

@implementation UIViewController (SWExtension)
  
- (void)nt_viewWillDisappear:(BOOL)animated {
//  [super viewWillDisappear:animated];
  
  [[NSNotificationCenter defaultCenter] removeObserver:self];
  NSArray *viewControllers = self.navigationController.viewControllers;
  NSLog(@"%zd", viewControllers.count);
  if (viewControllers.count > 1 &&
      [viewControllers objectAtIndex:viewControllers.count - 2] ==
      self) { // View is disappearing because a new view controller was
    // pushed onto the stack
    NSLog(@"New view controller was pushed");
    
  } else if ([viewControllers indexOfObject:self] ==
             NSNotFound) { // View is disappearing because it was popped from
    // the stack
    NSLog(@"View controller was popped");
    
    
  }
}
@end
