//
//  UIBarButtonItem+Extensions.m
//  UIKit-Extensions
//
//  Created by ZhangTinghui on 14-7-11.
//  Copyright (c) 2014年 blog.morefun.mobi. All rights reserved.
//

#import "UIBarButtonItem+Extensions.h"

@implementation UIBarButtonItem (Extensions)

+ (instancetype)barButtonItemWithImage:(UIImage *)image target:(id)target selector:(SEL)selector {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = CGRectMake(0, 0, 32, 32);
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:target
               action:selector
     forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc] initWithCustomView:button];
}

@end
