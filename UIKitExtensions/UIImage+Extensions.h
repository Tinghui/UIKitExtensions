//
//  UIImage+Extensions.h
//  UIKit-Extensions
//
//  Created by ZhangTinghui on 13-11-21.
//  Copyright (c) 2013年 www.660pp.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIImage (Extensions)

#pragma mark - Save
/**
 *  Save image to file path
 *
 *  @param filePath file path
 *
 *  @return YES, if save successed. NO, if not.
 */
- (BOOL)saveToPath:(NSString *)filePath;

#pragma mark - Capture
/**
 *  Capture image from view whthin a rect
 *
 *  @param view The view which will be captured
 *  @param rect The rect of captured area in the view.
 *
 *  @return Captured image.
 */
+ (UIImage *)capturedImageFromView:(UIView *)view inRect:(CGRect)rect;

/*!
 *  This method is equivalent to calling the +capturedImageFromView:inRect: method with the rect of view.bounds
 */
+ (UIImage *)capturedImageFromView:(UIView *)view;

/**
 *  Get the capatured image whthin rect
 *
 *  @param rect The rect of captured area in the image.
 *
 *  @return Capatured image
 */
- (UIImage *)capturedImageInRect:(CGRect)rect;

#pragma mark - Resize
/*!
 *  Get the resized image with new size.
 *
 *  @param size  New size image will be resized to.
 *  @param scale New image scale.
 *
 *  @return Resized image.
 */
- (UIImage *)resizedImageToSize:(CGSize)size scale:(CGFloat)scale;

/*!
 *  This method is equivalent to calling the -resizedImageToSize:scale: method with the scale factor of 1.0.
 */
- (UIImage *)resizedImageToSize:(CGSize)size;

/*!
 *  Get the resized image with new width.
 *
 *  @param width New image width.
 *
 *  @return Resized image. image will be scale aspect to new width.
 */
- (UIImage *)resizedImageToWidth:(CGFloat)width;

/**
 *  Get the image whith a normal orientation.
 *
 *  @return The image whith a normal orientation.
 */
- (UIImage *)normalOrientationImage;

#pragma mark - TintColor
- (UIImage *)tintImageWithColor:(UIColor *)tintColor;
- (UIImage *)gradientTintImageWithColor:(UIColor *)tintColor;
- (UIImage *)tintImageWithColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode;
- (UIImage *)grayImage;

@end

