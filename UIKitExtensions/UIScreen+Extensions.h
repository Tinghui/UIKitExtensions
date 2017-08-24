//
//  UIScreen+Extensions.h
//  UIKit-Extensions
//
//  Created by ZhangTinghui on 14-5-26.
//  Copyright (c) 2014年 blog.morefun.mobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (Extensions)

+ (CGFloat)width;
+ (CGFloat)height;

+ (BOOL)heightIsLessThanOrEqualToiPhone4s;
+ (BOOL)heightIsEqualToiPhone5;
+ (BOOL)heightIsEqualToiPhone6;
+ (BOOL)heightIsEqualOrGreaterThaniPhone6Plus;

@end
