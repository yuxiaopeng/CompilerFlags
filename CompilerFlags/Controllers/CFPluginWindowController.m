//
//  CFPluginWindowController.m
//  CompilerFlags
//
//  Created by 于晓鹏 on 15/5/8.
//  Copyright (c) 2015年 roc. All rights reserved.
//

#import "CFPluginWindowController.h"
#import "IDE"

@interface CFPluginWindowController ()

@end

@implementation CFPluginWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (id)initWithBundle:(NSBundle *)bundle {
    if (self = [super initWithWindowNibName:NSStringFromClass([CFPluginWindowController class])]) {
        @try {
            if ([NSUserNotificationCenter class])
                [[NSUserNotificationCenter defaultUserNotificationCenter] setDelegate:self];
        }
        @catch(NSException *exception) { NSLog(@"I've heard you like exceptions... %@", exception); }
    }
    return self;
}

@end
