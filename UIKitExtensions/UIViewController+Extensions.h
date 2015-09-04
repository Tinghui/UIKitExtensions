//
//  UIViewController+Extensions.h
//  UIKitExtensions
//
//  Created by ZhangTinghui on 15/8/6.
//  Copyright (c) 2015年 www.morefun.mobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extensions)

@end


@interface UIViewController (InterfaceBuilder)

#pragma mark - Storyboard
/*!
 *  Create an view controller from storyboard
 *
 *  @param storyboardName storyboard file name, no need the .storyboard extension name
 *  @param identifier     identifier of the controller in storyboard
 *
 *  @return The view controller corresponding to the specified identifier string in the specified storyboard. If no view controller is associated with the identifier, this method throws an exception.
 */
+ (instancetype)createFromStoryboardWithName:(NSString *)storyboardName
                                  identifier:(NSString *)identifier;

/*!
 *  Create an view controller from storyboard
 *
 *  @note Same as [self createFromStoryboardWithName:storyboardName identifier:NSStringFromClass(self)]. <b>So make sure the identifier string is same with view controller's class name in the specified storyboard</b>
 *
 *  @param storyboardName storyboard file name, no need the .storyboard extension name
 *
 *  @return The view controller which uses it's class name as the identifier string in the specified storyboard. If no view controller is associated with the string, this method throws an exception.
 */
+ (instancetype)createFromStoryboardWithName:(NSString *)storyboardName;


#pragma mark - Nib
/*!
 *  Create an view controller from nib file in mainBundle
 *
 *  @note Make sure nib file name is same with view controller's class name
 *
 *  @return A newly initialized UIViewController object
 */
+ (instancetype)createFromNibFile;

@end


@protocol StoryboardCreating <NSObject>
@required
+ (instancetype)createFromStoryboard;
@end


