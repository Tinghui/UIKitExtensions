//
//  UIDevice+Extensions.m
//  UIKitExtensions
//
//  Created by ZhangTinghui on 15/5/14.
//  Copyright (c) 2015年 www.morefun.mobi. All rights reserved.
//

#import "UIDevice+Extensions.h"

@implementation UIDevice (Extensions)

+ (BOOL)systemVersionBelow:(nonnull NSString *)version {
    return ([[[self currentDevice] systemVersion] compare:version options:NSNumericSearch] == NSOrderedAscending);
}

+ (BOOL)systemVersionBelowOrIs:(nonnull NSString *)version {
    return ([[[self currentDevice] systemVersion] compare:version options:NSNumericSearch] != NSOrderedDescending);
}

+ (BOOL)systemVersionIs:(nonnull NSString *)version {
    return ([[[self currentDevice] systemVersion] compare:version options:NSNumericSearch] == NSOrderedSame);
}

+ (BOOL)systemVersionAbove:(nonnull NSString *)version {
    return ([[[self currentDevice] systemVersion] compare:version options:NSNumericSearch] == NSOrderedDescending);
}

+ (BOOL)systemVersionAboveOrIs:(nonnull NSString *)version {
    return ([[[self currentDevice] systemVersion] compare:version options:NSNumericSearch] != NSOrderedAscending);
}

@end
