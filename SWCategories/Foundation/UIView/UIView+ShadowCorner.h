//
//  UIView+ShadowCorner.h
//  NatonAnnualMeetingQA
//
//  Created by Naton on 2018/3/13.
//  Copyright © 2018年 naton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ShadowCorner)

/// 阴影 & 圆角
- (void)sw_shadowCornerWithRadius:(CGFloat)aRadius shadowWidth:(CGFloat)width shadowOpacity:(CGFloat)opacity;

@end
