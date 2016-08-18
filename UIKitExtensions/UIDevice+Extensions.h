//
//  UIDevice+Extensions.h
//  UIKitExtensions
//
//  Created by ZhangTinghui on 15/5/14.
//  Copyright (c) 2015年 www.morefun.mobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Extensions)

+ (BOOL)systemVersionBelow:(nonnull NSString *)version;
+ (BOOL)systemVersionBelowOrIs:(nonnull NSString *)version;
+ (BOOL)systemVersionIs:(nonnull NSString *)version;
+ (BOOL)systemVersionAbove:(nonnull NSString *)version;
+ (BOOL)systemVersionAboveOrIs:(nonnull NSString *)version;

@end
