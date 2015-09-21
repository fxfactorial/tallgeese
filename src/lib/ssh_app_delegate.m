#import <Cocoa/Cocoa.h>

#include "ssh_app_delegate.h"
#include "ssh_gui.h"

@implementation Ssh_app_delegate

- (void)applicationDidFinishLaunching:(NSNotification *)a_notification
{
	int flags =
		NSTitledWindowMask
		| NSResizableWindowMask
		| NSUnifiedTitleAndToolbarWindowMask
		| NSClosableWindowMask
		| NSMiniaturizableWindowMask;
  self.main_window =
    [[NSWindow alloc]
      initWithContentRect:NSMakeRect(0, 0, 500, 600)
								styleMask:flags
									backing:NSBackingStoreBuffered
										defer:NO];

	NSToolbar *bar = [[NSToolbar alloc] initWithIdentifier:@"main_window_toolbar"];
	bar.displayMode = NSToolbarDisplayModeIconAndLabel;
	bar.sizeMode = NSToolbarSizeModeSmall;

	self.app_logic =
		[[Ssh_gui alloc]
			initWithFrame:NSMakeRect(0,
															 0,
															 self.main_window.frame.size.width - 3,
															 self.main_window.frame.size.height - 20)];
	// self.main_window.contentView = self.app_logic;
	[self.main_window.contentView addSubview:self.app_logic];

	[bar setDelegate:self.app_logic];
	self.main_window.toolbar = bar;

	// [self.main_window.contentView addSubview:self.app_logic];
	[self.main_window setTitle:@"Tallgeese"];
  [self.main_window makeKeyAndOrderFront:NSApp];
	// Make sure we're ahead of anything else.
	[self.main_window setLevel:NSNormalWindowLevel + 1];
}

-(void)applicationWillResignActive:(id)whatever
{
	// Be nice and go away
	[self.main_window setLevel:NSNormalWindowLevel];
}

@end
