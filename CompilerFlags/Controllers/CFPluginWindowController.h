//
//  CFPluginWindowController.h
//  CompilerFlags
//
//  Created by 于晓鹏 on 15/5/8.
//  Copyright (c) 2015年 roc. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CFPluginWindowController : NSWindowController <NSUserNotificationCenterDelegate>

- (id)initWithBundle:(NSBundle *)bundle;

@end
