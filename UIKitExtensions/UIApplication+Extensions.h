//
//  UIApplication+Extensions.h
//  UIKit-Extensions
//
//  Created by ZhangTinghui on 14-5-26.
//  Copyright (c) 2014年 www.codingobjc.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (Extensions)

+ (UIViewController*)topmostViewController;

+ (void)gotoAppStoreUserReviewsPageOfApp:(NSString *)appId;


@end
