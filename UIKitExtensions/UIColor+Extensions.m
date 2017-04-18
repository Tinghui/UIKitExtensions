//
//  UIColor+Extensions.m
//  UIKit-Extensions
//
//  Created by ZhangTinghui on 14-5-26.
//  Copyright (c) 2014年 www.codingobjc.com. All rights reserved.
//

#import "UIColor+Extensions.h"

@implementation UIColor (Extensions)

#define RGBColor(r, g, b)           RGBAColor((r), (g), (b), 1.0f)
#define RGBAColor(r, g, b, a)       [UIColor colorWithRed:(r)/255.00f green:(g)/255.00f blue:(b)/255.00f alpha:(a)]

+ (nonnull UIColor *)rgbColor:(nonnull NSString *)colorString {
    return [self rgbaColor:[colorString stringByAppendingString:@",1.0"]];
}

+ (nonnull UIColor *)rgbaColor:(nonnull NSString *)colorString {
    NSArray<NSString *> *components = [colorString componentsSeparatedByString:@","];
    if (components.count != 4) {
        [NSException raise:NSInvalidArgumentException
                    format:@"Invalid argument: @\"%@\", rgbaColor needs 4 components, ex. @\"255.00,255.00,255.00,1.0\".", colorString];
    }
    return [UIColor colorWithRed:([components[0] floatValue] / 255.00)
                           green:([components[1] floatValue] / 255.00)
                            blue:([components[2] floatValue] / 255.00)
                           alpha:([components[3] floatValue])];
}


+ (nonnull UIColor *)hexColor:(NSUInteger)value {
    return [self hexColor:value withAlpha:1.0];
}

+ (UIColor *)hexColor:(NSUInteger)value withAlpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((float)(((value) & 0xFF0000) >> 16)) / 255.0f
                           green:((float)(((value) & 0xFF00) >> 8)) / 255.0f
                            blue:((float)((value) & 0xFF)) / 255.0f
                           alpha:alpha];
}

+ (nullable UIColor *)colorWithHexColorString:(nonnull NSString *)string {
    NSString *colorString = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    colorString = [colorString uppercaseString];
    //strip 0X or # if it appears
    if ([colorString hasPrefix:@"0X"]) {
        colorString = [colorString substringFromIndex:2];
    }
    if ([colorString hasPrefix:@"#"]) {
        colorString = [colorString substringFromIndex:1];
    }
    
    //String should be at least 6 characters
    const NSUInteger kMinCharCount = 6;
    if ([colorString length] < kMinCharCount) {
        [NSException raise:NSInvalidArgumentException
                    format:@"Invalid argument: @\"%@\", hex color needs at least 6 characters except its prefix, ex. @\"0xFFFFFF\" or @\"0xFF000000\".", colorString];
    }
    
    //append alpha components at first two characters 
    if (colorString.length == kMinCharCount) {
        colorString = [@"FF" stringByAppendingString:colorString];
    }
    
    //Separate into a, r, g, b substrings
    NSString *aString = [colorString substringWithRange:NSMakeRange(0, 2)];
    NSString *rString = [colorString substringWithRange:NSMakeRange(2, 2)];
    NSString *gString = [colorString substringWithRange:NSMakeRange(4, 2)];
    NSString *bString = [colorString substringWithRange:NSMakeRange(6, 2)];
    if (aString == nil || rString == nil || gString == nil || bString == nil) {
        return nil;
    }
    
    //Scan values
    unsigned int a, r, g, b;
    [[NSScanner scannerWithString:aString] scanHexInt:&a];
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float)r / 255.0f)
                           green:((float)g / 255.0f)
                            blue:((float)b / 255.0f)
                           alpha:((float)a / 255.0f)];
}

+ (nullable NSString *)hexRGBAStringToARGBString:(nullable NSString *)string {
    if (![string hasPrefix:@"0x"] && ![string hasPrefix:@"0X"] && ![string hasPrefix:@"#"]) {
        return nil;
    }
    
    NSString *prefix = nil, *valueString = nil;
    if ([string hasPrefix:@"0x"] || [string hasPrefix:@"0X"]) {
        prefix = [string substringToIndex:2];
        valueString = [string substringFromIndex:2];
    }
    else {
        prefix = [string substringToIndex:1];
        valueString = [string substringFromIndex:1];
    }
    
    if (valueString.length != 8) {
        [NSException raise:NSInvalidArgumentException format:@"only support 8 chars hex rgba string."];
    }
    
    NSString *argbString = [prefix stringByAppendingString:[valueString substringWithRange:NSMakeRange(6, 2)]];
    argbString = [argbString stringByAppendingString:[valueString substringWithRange:NSMakeRange(0, 6)]];
    
    return argbString;
}

@end


