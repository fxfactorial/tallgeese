#import <Cocoa/Cocoa.h>

#include "ssh_app_prefs.h"
#include "ssh_exts.h"

@implementation Ssh_app_prefs

-(void)show
{
	int flags = NSTitledWindowMask | NSClosableWindowMask;
	NSRect screen_frame = [NSScreen mainScreen].frame;
	CGFloat center_x = CGRectGetMidX(screen_frame);
	CGFloat center_y = CGRectGetMidY(screen_frame);
	NSRect about_frame = NSMakeRect(center_x - 75, center_y - 50, 175, 150);

	NSTextField *prefs =
		[[NSTextField alloc] init_as_label:@"Preferences" with:NSMakeRect(0, 0, 0, 0)];

	self.preferences_window =
		[[NSWindow alloc]
			initWithContentRect:about_frame
								styleMask:flags
									backing:NSBackingStoreBuffered
										defer:NO];

	[self.preferences_window.contentView addSubview:prefs];
	[self.preferences_window setLevel:NSNormalWindowLevel + 1];
	[self.preferences_window makeKeyAndOrderFront:NSApp];
}
@end
