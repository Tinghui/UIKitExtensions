//
//  UIImage+Extensions.m
//  UIKit-Extensions
//
//  Created by ZhangTinghui on 13-11-21.
//  Copyright (c) 2013年 www.660pp.com. All rights reserved.
//


#if !__has_feature(objc_arc)
#error This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif

#import <QuartzCore/QuartzCore.h>
#import "UIImage+Extensions.h"

@implementation UIImage (Extensions)

+ (UIImage *)imageWithColor:(UIColor *)color {
    const CGRect rect = CGRectMake(0, 0, 3.0, 3.0);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(1.0, 1.0, 1.0, 1.0)];
}

#pragma mark - Save
- (BOOL)saveToPath:(NSString *)filePath {
    if (self == nil || filePath == nil || [filePath isEqualToString:@""]) {
        return NO;
    }
    
    @try {
        
        NSData *imageData = nil;
        NSString *extension = [filePath pathExtension];
        if (extension == nil || [extension isEqualToString:@""]) {
            return NO;
        }
        
        if ([extension isEqualToString:@"png"]) {
            imageData = UIImagePNGRepresentation(self);
        }
        else {
            imageData = UIImageJPEGRepresentation(self, 1);
        }
        
        if (imageData == nil || [imageData length] <= 0) {
            return NO;
        }
        
        [imageData writeToFile:filePath atomically:YES];
        return YES;
        
    }
    @catch (NSException *e) {
#if DEBUG
        NSLog(@"Save image failed (path:%@)", filePath);
#endif
    }
    return NO;
}

#pragma mark - Capture
+ (UIImage *)capturedImageFromView:(UIView *)view inRect:(CGRect)rect afterScreenUpdates:(BOOL)afterUpdates {
    if (view == nil || CGRectIsEmpty(rect)) {
        return nil;
    }
    
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, [UIScreen mainScreen].scale);
    
    if ([view respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:afterUpdates];
    }
    else {
        [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return [image capturedImageInRect:rect];
}

+ (UIImage *)capturedImageFromView:(UIView *)view inRect:(CGRect)rect {
    return [self capturedImageFromView:view inRect:rect afterScreenUpdates:YES];
}

+ (UIImage *)capturedImageFromView:(UIView *)view {
    return [self capturedImageFromView:view inRect:view.bounds];
}

- (UIImage *)capturedImageInRect:(CGRect)rect {
    if (CGRectIsEmpty(rect)) {
        return nil;
    }
    
    if (CGRectEqualToRect(rect, CGRectMake(0, 0, self.size.width, self.size.height))) {
        return self;
    }
    
    CGRect rectInCGImage = CGRectApplyAffineTransform(rect, CGAffineTransformMakeScale(self.scale, self.scale));
    CGImageRef cutCGImage = CGImageCreateWithImageInRect([self CGImage], rectInCGImage);
    UIImage *cutImage = [[UIImage alloc] initWithCGImage:cutCGImage
                                                   scale:self.scale
                                             orientation:self.imageOrientation];
    CGImageRelease(cutCGImage);
    
    return cutImage;
}

#pragma mark - Resize
- (UIImage *)resizedImageToSize:(CGSize)size scale:(CGFloat)scale {
    if (size.width <= 0.0 || size.height <= 0.0) {
        return nil;
    }
    
    if (fabs(self.size.width - size.width) < 0.000001
        && fabs(self.size.height - size.height) < 0.000001
        && fabs(self.scale - scale) < 0.000001) {
        return self;
    }
    
    UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

- (UIImage *)resizedImageToSize:(CGSize)size {
    return [self resizedImageToSize:size scale:1.0];
}

- (UIImage *)resizedImageToWidth:(CGFloat)width {
    if (width <= 0.0) {
        return nil;
    }
    
    const CGFloat height = width / (self.size.width / self.size.height);
    return [self resizedImageToSize:CGSizeMake(width, height)];
}

- (UIImage *)normalOrientationImage {
    if (self.imageOrientation == UIImageOrientationUp) {
        return self;
    }
    
    UIGraphicsBeginImageContext(self.size);
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    UIImage *normalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return normalImage;
}

#pragma mark - TintColor
- (UIImage *)tintImageWithColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    [self drawInRect:bounds blendMode:blendMode alpha:1.0];
    //重绘一次保存alpha通道
    if (blendMode != kCGBlendModeDestinationIn) {
        [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)tintImageWithColor:(UIColor *)tintColor {
    return [self tintImageWithColor:tintColor blendMode:kCGBlendModeDestinationIn];
}

- (UIImage *)gradientTintImageWithColor:(UIColor *)tintColor {
    return [self tintImageWithColor:tintColor blendMode:kCGBlendModeOverlay];
}


- (UIImage *)grayImage {
    CGImageRef  imageRef;
    imageRef = self.CGImage;
    
    size_t width  = CGImageGetWidth(imageRef);
    size_t height = CGImageGetHeight(imageRef);
    
    size_t                  bitsPerComponent;
    bitsPerComponent = CGImageGetBitsPerComponent(imageRef);
    size_t                  bitsPerPixel;
    bitsPerPixel = CGImageGetBitsPerPixel(imageRef);
    size_t                  bytesPerRow;
    bytesPerRow = CGImageGetBytesPerRow(imageRef);
    CGColorSpaceRef         colorSpace;
    colorSpace = CGImageGetColorSpace(imageRef);
    CGBitmapInfo            bitmapInfo;
    bitmapInfo = CGImageGetBitmapInfo(imageRef);
    bool                    shouldInterpolate;
    shouldInterpolate = CGImageGetShouldInterpolate(imageRef);
    CGColorRenderingIntent  intent;
    intent = CGImageGetRenderingIntent(imageRef);
    CGDataProviderRef   dataProvider;
    dataProvider = CGImageGetDataProvider(imageRef);
    CFDataRef   data;
    UInt8*      buffer;
    data = CGDataProviderCopyData(dataProvider);
    buffer = (UInt8*)CFDataGetBytePtr(data);
    
    NSUInteger  x, y;
    for (y = 0; y < height; y++) {
        for (x = 0; x < width; x++) {
            UInt8*  tmp;
            tmp = buffer + y * bytesPerRow + x * 4;

            UInt8 red,green,blue;
            red = *(tmp + 0);
            green = *(tmp + 1);
            blue = *(tmp + 2);
            
            *(tmp + 0) = red*0.299 + green * 0.587 + blue * 0.114;
            *(tmp + 1) = *(tmp + 0) ;
            *(tmp + 2) = *(tmp + 0) ;
        }
    }
    
    CFDataRef   effectedData;
    effectedData = CFDataCreate(NULL, buffer, CFDataGetLength(data));
    
    CGDataProviderRef   effectedDataProvider;
    effectedDataProvider = CGDataProviderCreateWithCFData(effectedData);
    
    CGImageRef  effectedCgImage;
    UIImage*    effectedImage;
    effectedCgImage = CGImageCreate(
                                    width, height,
                                    bitsPerComponent, bitsPerPixel, bytesPerRow,
                                    colorSpace, bitmapInfo, effectedDataProvider,
                                    NULL, shouldInterpolate, intent);
    effectedImage = [[UIImage alloc] initWithCGImage:effectedCgImage];
    
    CGImageRelease(effectedCgImage);
    CFRelease(effectedDataProvider);
    CFRelease(effectedData);
    CFRelease(data);
    
    return effectedImage;
}

@end


