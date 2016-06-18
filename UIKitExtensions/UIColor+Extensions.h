//
//  UIColor+Extensions.h
//  UIKit-Extensions
//
//  Created by ZhangTinghui on 14-5-26.
//  Copyright (c) 2014年 www.codingobjc.com. All rights reserved.
//

#import <UIKit/UIKit.h>


#define RGBColor(r, g, b)           RGBAColor((r), (g), (b), 1.0f)
#define RGBAColor(r, g, b, a)       [UIColor colorWithRed:(r)/255.00f green:(g)/255.00f blue:(b)/255.00f alpha:(a)]

@interface UIColor (Extensions)

+ (nonnull UIColor *)hexColor:(NSUInteger)value;
+ (nonnull UIColor *)hexColor:(NSUInteger)value withAlpha:(CGFloat)alpha;

+ (nullable UIColor *)colorWithHexColorString:(nonnull NSString *)string;

@end
