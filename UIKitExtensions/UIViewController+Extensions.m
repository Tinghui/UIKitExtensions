//
//  UIViewController+Extensions.m
//  UIKitExtensions
//
//  Created by ZhangTinghui on 15/8/6.
//  Copyright (c) 2015年 www.morefun.mobi. All rights reserved.
//

#import "UIViewController+Extensions.h"

@implementation UIViewController (Extensions)

@end


@implementation UIViewController (InterfaceBuilder)

#pragma mark - Storyboard
+ (nullable __kindof UIViewController *)createFromStoryboardWithName:(nonnull NSString *)storyboardName
                                                          identifier:(nonnull NSString *)identifier {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    return [storyboard instantiateViewControllerWithIdentifier:identifier];
}

+ (nullable __kindof UIViewController *)createFromStoryboardWithName:(nonnull NSString *)storyboardName {
    return [self createFromStoryboardWithName:storyboardName
                                   identifier:NSStringFromClass(self)];
}

#pragma mark - Nib
+ (nullable instancetype)createFromNibFile {
    return [[self alloc] initWithNibName:NSStringFromClass([self class]) bundle:nil];
}

@end