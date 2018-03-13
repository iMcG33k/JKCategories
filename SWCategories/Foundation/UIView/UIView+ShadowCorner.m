//
//  UIView+ShadowCorner.m
//  NatonAnnualMeetingQA
//
//  Created by Naton on 2018/3/13.
//  Copyright © 2018年 naton. All rights reserved.
//

#import "UIView+ShadowCorner.h"

@implementation UIView (ShadowCorner)

/// 阴影 & 圆角
- (void)sw_shadowCornerWithRadius:(CGFloat)aRadius shadowWidth:(CGFloat)width shadowOpacity:(CGFloat)opacity
{
    //阴影又圆角得layer
    CALayer *shadowCorner = [CALayer layer];
    shadowCorner.frame = self.bounds;
    shadowCorner.backgroundColor = [UIColor whiteColor].CGColor;
    shadowCorner.shadowOffset = CGSizeMake(0, width); //数字变大阴影效果得范围变宽
    shadowCorner.shadowColor = [[UIColor blackColor] CGColor];
    shadowCorner.shadowOpacity = opacity;
    shadowCorner.shadowRadius = width;//阴影效果得半径与shadowOffset共同控制阴影效果
    shadowCorner.cornerRadius = aRadius;//圆角半径
    //    shadowCorner.masksToBounds = YES; //这行代码会屏蔽掉阴影效果
    //    shadowCorner.borderColor = [[UIColor grayColor] CGColor];
    //    shadowCorner.borderWidth = 2;
    [self.layer addSublayer:shadowCorner];
    self.backgroundColor = [UIColor clearColor];//清空本身view得layer得背景色，不然圆角显示不成功，因为shadowCorner得圆角部分透明，透视盗test得layer非圆角颜色，显示不出圆角效果
}

@end
