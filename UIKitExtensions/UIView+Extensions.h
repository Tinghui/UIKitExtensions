//
//  UIView+Extensions.h
//  UIKit-Extensions
//
//  Created by ZhangTinghui on 14-5-26.
//  Copyright (c) 2014年 blog.morefun.mobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extensions)

/// 从mainBundle中同类名的xib创建一个实例对象
+ (nullable instancetype)createFromNibFile;

@end
