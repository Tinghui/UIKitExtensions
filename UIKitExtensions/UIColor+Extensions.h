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
#define HexColor(x)                 HexAlphaColor(x, 1.0f)
#define HexAlphaColor(x, a)         [UIColor colorWithRed:((float)(((x) & 0xFF0000) >> 16))/255.0f \
                                        green:((float)(((x) & 0xFF00) >> 8))/255.0f \
                                        blue:((float)((x) & 0xFF))/255.0f \
                                        alpha:(a)]

@interface UIColor (Extensions)

+ (UIColor *)colorWithHexColorString:(NSString *)string;

@end
