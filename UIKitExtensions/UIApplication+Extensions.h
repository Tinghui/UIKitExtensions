//
//  UIApplication+Extensions.h
//  UIKit-Extensions
//
//  Created by ZhangTinghui on 14-5-26.
//  Copyright (c) 2014年 blog.morefun.mobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (Extensions)

+ (nonnull UIViewController*)topmostViewController;

+ (void)gotoAppStoreUserReviewsPageOfApp:(nonnull NSString *)appId;


@end
