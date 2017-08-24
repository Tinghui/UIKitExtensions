//
//  UIView+Extensions.m
//  UIKit-Extensions
//
//  Created by ZhangTinghui on 14-5-26.
//  Copyright (c) 2014年 blog.morefun.mobi. All rights reserved.
//

#import "UIView+Extensions.h"

@implementation UIView (Extensions)

+ (nullable instancetype)createFromNibFile {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

@end
