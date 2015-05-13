//
//  CompilerFlags.h
//  CompilerFlags
//
//  Created by 于晓鹏 on 15/5/8.
//  Copyright (c) 2015年 roc. All rights reserved.
//

#import <AppKit/AppKit.h>
#import "CFPluginWindowController.h"

@interface CompilerFlags : NSObject

+ (instancetype)sharedPlugin;

@property (nonatomic, strong, readonly) NSBundle* bundle;
@property (nonatomic, strong) CFPluginWindowController *windowController;

@end