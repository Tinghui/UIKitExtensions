//
//  UINavigationController+Extensions.h
//  UIKitExtensions
//
//  Created by ZhangTinghui on 16/7/11.
//  Copyright © 2016年 www.morefun.mobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Extensions)

/**
 *  Pops view controllers until the previous controller of the specified controller is on top.
 *  @param controller specified controller
 *  @param animated   whether animated
 *  @return Returns the popped controllers.
 */
- (nullable NSArray<__kindof UIViewController *> *)popToPreviousViewController:(nonnull UIViewController *)controller animated:(BOOL)animated;

@end
