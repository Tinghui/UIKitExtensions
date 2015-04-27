//
//  UIButton+Extensions.h
//  UIKit-Extensions
//
//  Created by ZhangTinghui on 14-8-14.
//  Copyright (c) 2014年 www.codingobjc.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIButton (Extensions)

#pragma mark -
// with size (32, 32)
+ (instancetype)createBarButtonItem:(UIBarButtonItem **)item
                          withImage:(UIImage *)image
                             target:(id)target
                             action:(SEL)action;

+ (instancetype)createBarButtonItem:(UIBarButtonItem **)item
                     withButtonSize:(CGSize)size
                              image:(UIImage *)image
                             target:(id)target
                             action:(SEL)action;

#pragma mark - VerticallyLayout
- (void)centerVertically;
- (void)centerVerticallyWithPadding:(float)padding;

@end
