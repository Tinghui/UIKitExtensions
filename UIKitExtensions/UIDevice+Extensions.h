//
//  UIDevice+Extensions.h
//  UIKitExtensions
//
//  Created by ZhangTinghui on 15/5/14.
//  Copyright (c) 2015年 www.morefun.mobi. All rights reserved.
//

#import <UIKit/UIKit.h>


#define SystemVersionIs(v)           ([[[UIDevice currentDevice] systemVersion] compare:(v) options:NSNumericSearch] == NSOrderedSame)
#define SystemVersionAbove(v)        ([[[UIDevice currentDevice] systemVersion] compare:(v) options:NSNumericSearch] == NSOrderedDescending)
#define SystemVersionAboveOrIs(v)    ([[[UIDevice currentDevice] systemVersion] compare:(v) options:NSNumericSearch] != NSOrderedAscending)
#define SystemVersionBelow(v)        ([[[UIDevice currentDevice] systemVersion] compare:(v) options:NSNumericSearch] == NSOrderedAscending)
#define SystemVersionBelowOrIs(v)    ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)



@interface UIDevice (Extensions)

@end
