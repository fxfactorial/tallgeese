#import <Cocoa/Cocoa.h>

#include "ssh_prefs.h"

@implementation Ssh_prefs

-(void)show
{
	int flags = NSTitledWindowMask | NSClosableWindowMask;
	NSRect screen_frame = [NSScreen mainScreen].frame;
	CGFloat center_x = CGRectGetMidX(screen_frame);
	CGFloat center_y = CGRectGetMidY(screen_frame);
	NSRect about_frame = NSMakeRect(center_x - 75, center_y - 50, 175, 150);
	self.preferences_window =
		[[NSWindow alloc]
			initWithContentRect:about_frame
								styleMask:flags
									backing:NSBackingStoreBuffered
										defer:NO];

	[self.preferences_window setLevel:NSNormalWindowLevel + 1];
	[self.preferences_window makeKeyAndOrderFront:NSApp];
}
@end
