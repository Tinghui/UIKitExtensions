//
//  UIScreen+Extensions.h
//  UIKit-Extensions
//
//  Created by ZhangTinghui on 14-5-26.
//  Copyright (c) 2014年 www.codingobjc.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIScreenWidth                       (CGRectGetWidth([[UIScreen mainScreen] bounds]))
#define UIScreenHeight                      (CGRectGetHeight([[UIScreen mainScreen] bounds]))
#define UIScreenHeightIs4SAndLower          (UIScreenHeight <= 480)
#define UIScreenHeightIs5                   (UIScreenHeight == 568)
#define UIScreenHeightIs6                   (UIScreenHeight == 667)
#define UIScreenHeightIs6PlusAndHigher      (UIScreenHeight >= 736)


#define UIScreenIsRetina    ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] \
                                && [[UIScreen mainScreen] scale] >= 2.0f))

@interface UIScreen (Extensions)


@end
