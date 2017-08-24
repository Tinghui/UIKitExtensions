//
//  UIScreen+Extensions.m
//  UIKit-Extensions
//
//  Created by ZhangTinghui on 14-5-26.
//  Copyright (c) 2014年 blog.morefun.mobi. All rights reserved.
//

#import "UIScreen+Extensions.h"

@implementation UIScreen (Extensions)

+ (CGFloat)width {
    return (CGRectGetWidth([[UIScreen mainScreen] bounds]));
}

+ (CGFloat)height {
    return (CGRectGetHeight([[UIScreen mainScreen] bounds]));
}

+ (BOOL)heightIsLessThanOrEqualToiPhone4s {
    return [self height] <= (480.00 + 0.000001);
}

+ (BOOL)heightIsEqualToiPhone5 {
    return fabs([self height] - 568.00) <= 0.000001;
}

+ (BOOL)heightIsEqualToiPhone6 {
    return fabs([self height] - 667.00) <= 0.000001;
}

+ (BOOL)heightIsEqualOrGreaterThaniPhone6Plus {
    return [self height] + 0.000001 >= 736.0;
}

@end
