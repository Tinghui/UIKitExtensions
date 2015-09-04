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
+ (instancetype)createFromStoryboardWithName:(NSString *)storyboardName
                                  identifier:(NSString *)identifier {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    return [storyboard instantiateViewControllerWithIdentifier:identifier];
}

+ (instancetype)createFromStoryboardWithName:(NSString *)storyboardName {
    return [self createFromStoryboardWithName:storyboardName
                                   identifier:NSStringFromClass(self)];
}

#pragma mark - Nib
+ (instancetype)createFromNibFile {
    return [[self alloc] initWithNibName:NSStringFromClass([self class]) bundle:nil];
}

@end