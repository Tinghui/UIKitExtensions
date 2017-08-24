//
//  UIButton+Extensions.m
//  UIKit-Extensions
//
//  Created by ZhangTinghui on 14-8-14.
//  Copyright (c) 2014年 blog.morefun.mobi. All rights reserved.
//

#import "UIImage+Extensions.h"
#import "UIButton+Extensions.h"

@implementation UIButton (Extensions)

- (UIBarButtonItem *)embedInBarButtonItem {
    return [[UIBarButtonItem alloc] initWithCustomView:self];
}

#pragma mark - BackgroundColor
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    [self setBackgroundImage:[UIImage imageWithColor:backgroundColor] forState:state];
}

#pragma mark - VerticallyLayout
- (void)centerVertically {
    const CGFloat kDefaultPadding = 6.0f;
    [self centerVerticallyWithPadding:kDefaultPadding];
}

- (void)centerVerticallyWithPadding:(float)padding {
    // from: https://codedump.io/share/mENwT9mk1ttE/1/uibutton-how-to-center-an-image-and-a-text-using-imageedgeinsets-and-titleedgeinsets
    // lower the text and push it left so it appears centered
    //  below the image
    CGSize imageSize = self.imageView.image.size;
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, - (imageSize.height + padding), 0.0);
    
    // raise the image and push it right so it appears centered
    //  above the text
    CGSize titleSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: self.titleLabel.font}];
    self.imageEdgeInsets = UIEdgeInsetsMake(- (titleSize.height + padding), 0.0, 0.0, - titleSize.width);
    
    // increase the content height to avoid clipping
    CGFloat edgeOffset = fabs(titleSize.height - imageSize.height) / 2.0;
    self.contentEdgeInsets = UIEdgeInsetsMake(edgeOffset, 0.0, edgeOffset, 0.0);
}

@end


