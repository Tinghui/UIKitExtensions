//
//  UIButton+Extensions.m
//  UIKit-Extensions
//
//  Created by ZhangTinghui on 14-8-14.
//  Copyright (c) 2014年 www.codingobjc.com. All rights reserved.
//

#import "UIButton+Extensions.h"

@implementation UIButton (Extensions)

+ (instancetype)createBarButtonItem:(UIBarButtonItem **)item
                          withImage:(UIImage *)image
                             target:(id)target
                             action:(SEL)action
{
    return [self createBarButtonItem:item
                      withButtonSize:CGSizeMake(32, 32)
                               image:image
                              target:target
                              action:action];
}

+ (instancetype)createBarButtonItem:(UIBarButtonItem **)item
                     withButtonSize:(CGSize)size
                              image:(UIImage *)image
                             target:(id)target
                             action:(SEL)action {
    
    UIButton *button = [self buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, size.width, size.height);
    [button addTarget:target
               action:action
     forControlEvents:UIControlEventTouchUpInside];
    
    if (image != nil) {
        button.imageView.layer.cornerRadius = size.width/2;
        button.imageView.layer.masksToBounds = YES;
        [button setImage:image forState:UIControlStateNormal];
    }
    
    if (item) {
        *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    }
    
    return button;
}

#pragma mark - VerticallyLayout
- (void)centerVertically {
    const CGFloat kDefaultPadding = 6.0f;
    [self centerVerticallyWithPadding:kDefaultPadding];
}

- (void)centerVerticallyWithPadding:(float)padding {
    CGSize imageSize = CGSizeMake(CGRectGetWidth(self.imageView.bounds),
                                  CGRectGetHeight(self.imageView.bounds));
    CGSize titleSize = CGSizeMake(CGRectGetWidth(self.titleLabel.bounds),
                                  CGRectGetHeight(self.titleLabel.bounds));
    
    CGFloat totalHeight = (imageSize.height + titleSize.height + padding);
    
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height),
                                            0.0f,
                                            0.0f,
                                            - titleSize.width);
    
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0f,
                                            - imageSize.width,
                                            - (totalHeight - titleSize.height),
                                            0.0f);
    
}

@end
