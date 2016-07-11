//
//  UINavigationController+Extensions.m
//  UIKitExtensions
//
//  Created by ZhangTinghui on 16/7/11.
//  Copyright © 2016年 www.morefun.mobi. All rights reserved.
//

#import "UINavigationController+Extensions.h"

@implementation UINavigationController (Extensions)

- (nullable NSArray<__kindof UIViewController *> *)popToPreviousViewController:(nonnull UIViewController *)controller animated:(BOOL)animated {
    UIViewController *previousController = nil;
    NSArray<__kindof UIViewController *> *controllers = self.navigationController.viewControllers;
    for (NSInteger i = controllers.count - 1; i > 0; i--) {
        if (controllers[i] == self && i - 1 >= 0) {
            previousController = controllers[i-1];
            break;
        }
    }
    
    if (previousController == nil) {
        return nil;
    }
    
    return [self popToViewController:previousController animated:animated];
}

@end
