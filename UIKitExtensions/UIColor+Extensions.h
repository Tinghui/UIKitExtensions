//
//  UIColor+Extensions.h
//  UIKit-Extensions
//
//  Created by ZhangTinghui on 14-5-26.
//  Copyright (c) 2014年 blog.morefun.mobi. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIColor (Extensions)

/**
 *  Create color with RGB color string.
 *  @param colorString color components string separated by comma. For example: @@"255.00,255.00,255.00".
 */
+ (nonnull UIColor *)rgbColor:(nonnull NSString *)colorString;

/**
 *  Create color with RGBA color string.
 *  @param colorString color components string separated by comma. For example: @@"255.00,255.00,255.00,1.0".
 */
+ (nonnull UIColor *)rgbaColor:(nonnull NSString *)colorString;

/**
 *  Create color with hex color value.
 *  @param value hex color value. For example: 0xFFFFFF
 */
+ (nonnull UIColor *)hexColor:(NSUInteger)value;

/**
 *  Create color with hex color value and alpha value.
 *  @param value value hex color value. For example: 0xFFFFFF
 *  @param alpha alpha. 0.0~1.0
 */
+ (nonnull UIColor *)hexColor:(NSUInteger)value withAlpha:(CGFloat)alpha;

/**
 *  Create color with hex color string.
 * 
 *  Hex color string supports 6 chars (RGB) or 8 chars (ARGB) string.
 *
 *  @param string hex color string. For example: @@"0xFFFFFF" or @@"#FFFFFF"
 */
+ (nullable UIColor *)colorWithHexColorString:(nonnull NSString *)string;

/**
 Hex RGBA string convert to ARGB string.
 
 ex. "#RRGGBBAA" to "#AARRGGBB" (R: red value, G: green value, B: blue value, A: alpha value)

 @param string RGBA string
 @return ARGB string.
 */
+ (nullable NSString *)hexRGBAStringToARGBString:(nullable NSString *)string;

@end


