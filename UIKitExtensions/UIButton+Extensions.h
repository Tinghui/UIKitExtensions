//
//  UIButton+Extensions.h
//  UIKit-Extensions
//
//  Created by ZhangTinghui on 14-8-14.
//  Copyright (c) 2014年 blog.morefun.mobi. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIButton (Extensions)

- (UIBarButtonItem *)embedInBarButtonItem;

#pragma mark - BackgroundColor
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

#pragma mark - VerticallyLayout
- (void)centerVertically;
- (void)centerVerticallyWithPadding:(float)padding;

@end
