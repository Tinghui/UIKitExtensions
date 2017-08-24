//
//  UIImage+Extensions.h
//  UIKit-Extensions
//
//  Created by ZhangTinghui on 13-11-21.
//  Copyright (c) 2013年 www.660pp.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extensions)
/**
 *  Create an image with specified color.
 *
 *  The image is resizable with capInsets UIEdgeInsetsMake(1.0, 1.0, 1.0, 1.0)
 *
 *  @param color The specified color
 *  @return An image.
 */
+ (nonnull UIImage *)imageWithColor:(nonnull UIColor *)color;

#pragma mark - Save
/**
 *  Save image to file path
 *
 *  @param filePath file path
 *
 *  @return YES, if save successed. NO, if not.
 */
- (BOOL)saveToPath:(nullable NSString *)filePath;

#pragma mark - Capture
/**
 *  Capture image from view whthin a rect
 *
 *  @param view The view which will be captured
 *  @param rect The rect of captured area in the view.
 *  @param afterUpdates A Boolean value that indicates whether the snapshot should be rendered after recent changes have been incorporated. Specify the value NO if you want to render a snapshot in the view hierarchy’s current state, which might not include recent changes.
 *
 *  @return Captured image.
 */
+ (nullable UIImage *)capturedImageFromView:(nullable UIView *)view inRect:(CGRect)rect afterScreenUpdates:(BOOL)afterUpdates;

/**
 *  Same with [self capturedImageFromView:view inRect:rect afterScreenUpdates:YES]
 */
+ (nullable UIImage *)capturedImageFromView:(nullable UIView *)view inRect:(CGRect)rect;

/*!
 *  Same with [self capturedImageFromView:view inRect:view.bounds]
 */
+ (nullable UIImage *)capturedImageFromView:(nullable UIView *)view;

/**
 *  Get the capatured image whthin rect
 *
 *  @param rect The rect of captured area in the image.
 *
 *  @return Capatured image
 */
- (nullable UIImage *)capturedImageInRect:(CGRect)rect;

#pragma mark - Resize
/*!
 *  Get the resized image with new size.
 *
 *  @param size  New size image will be resized to.
 *  @param scale New image scale.
 *
 *  @return Resized image.
 */
- (nullable UIImage *)resizedImageToSize:(CGSize)size scale:(CGFloat)scale;

/*!
 *  This method is equivalent to calling the -resizedImageToSize:scale: method with the scale factor of 1.0.
 */
- (nullable UIImage *)resizedImageToSize:(CGSize)size;

/**
 Get the resized image with new width.

 @param width New image width.
 @return Resized image. image will be scale aspect to new width.
 */
- (nullable UIImage *)resizedImageToWidth:(CGFloat)width;

/**
 Get the image whith a normal orientation.

 @return The image whith a normal orientation.
 */
- (nullable UIImage *)normalOrientationImage;

/**
 Resize image asynchronously

 @param width resized width
 @param rotate Whether ratate the resized image to a `normalOrientationImage`
 @param completion Completion block which will return the resized image.
 */
- (void)resizeToWidth:(CGFloat)width rotateToNormalOrientation:(BOOL)rotate completion:(void(^_Nullable)(UIImage * _Nullable resizedImage))completion;

#pragma mark - TintColor
- (nonnull UIImage *)tintImageWithColor:(nonnull UIColor *)tintColor;
- (nonnull UIImage *)gradientTintImageWithColor:(nonnull UIColor *)tintColor;
- (nonnull UIImage *)tintImageWithColor:(nonnull UIColor *)tintColor blendMode:(CGBlendMode)blendMode;
- (nonnull UIImage *)grayImage;

@end


