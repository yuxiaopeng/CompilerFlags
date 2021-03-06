//
//  CompilerFlags.m
//  CompilerFlags
//
//  Created by 于晓鹏 on 15/5/8.
//  Copyright (c) 2015年 roc. All rights reserved.
//

#import "CompilerFlags.h"
#import "CFPluginWindowController.h"

static CompilerFlags *sharedPlugin;

@interface CompilerFlags()

@property (nonatomic, strong, readwrite) NSBundle *bundle;
@end

@implementation CompilerFlags

+ (void)pluginDidLoad:(NSBundle *)plugin
{
    static dispatch_once_t onceToken;
    NSString *currentApplicationName = [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
    if ([currentApplicationName isEqual:@"Xcode"]) {
        dispatch_once(&onceToken, ^{
            sharedPlugin = [[self alloc] initWithBundle:plugin];
        });
    }
}

+ (instancetype)sharedPlugin
{
    return sharedPlugin;
}

- (id)initWithBundle:(NSBundle *)plugin
{
    if (self = [super init]) {
        // reference to plugin's bundle, for resource access
        self.bundle = plugin;
        
        // Create menu items, initialize UI, etc.

        // Sample Menu Item:
        NSMenuItem *menuItem = [[NSApp mainMenu] itemWithTitle:@"Edit"];
        if (menuItem) {
            [[menuItem submenu] addItem:[NSMenuItem separatorItem]];
            NSMenuItem *actionMenuItem = [[NSMenuItem alloc] initWithTitle:@"Do Action" action:@selector(loadWindowAndPutInFront) keyEquivalent:@""];
            [actionMenuItem setTarget:self];
            [[menuItem submenu] addItem:actionMenuItem];
        }
    }
    return self;
}

- (void)loadWindowAndPutInFront {
    if (!self.windowController.window)
        self.windowController = [[CFPluginWindowController alloc] initWithBundle:self.bundle];
    
    [[self.windowController window] makeKeyAndOrderFront:self];
}

// Sample Action, for menu item:
- (void)doMenuAction
{
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText:@"Hello, World"];
    [alert runModal];
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
