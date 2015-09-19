// Avoid name_clashes
#define CAML_NAME_SPACE
// OCaml declarations
#include <caml/mlvalues.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/memory.h>
#include <caml/fail.h>
//Cocoa
#import <Cocoa/Cocoa.h>

#include "ssh_gui.h"
#include "ssh_exts.h"

@implementation SshGUI

- (void)applicationDidFinishLaunching:(NSNotification *)a_notification
{
	int flags = NSTitledWindowMask | NSResizableWindowMask | NSClosableWindowMask;
  self.main_window =
    [[NSWindow alloc]
      initWithContentRect:NSMakeRect(50, 10, 500, 600)
		styleMask:flags
		  backing:NSBackingStoreBuffered
		    defer:NO];
  [self setup_ui];
  [self.main_window makeKeyAndOrderFront:NSApp];
	// Make sure we're ahead of anything else.
	[self.main_window setLevel:NSNormalWindowLevel + 1];
}

-(void)send_query
{
	// Temporarily disabled
  // caml_callback(*caml_named_value("zipcode_of_ip"),
  // 		 caml_copy_string("45.33.64.41"));

  // caml_callback2(*caml_named_value("connect_to"),
  // 		 caml_copy_string("edgar.haus"),
  // 		 caml_copy_string("gar"));
}

-(void)setup_menus
{
	NSMenu *menu_bar = [NSMenu new];
	NSMenuItem *app_item = [NSMenuItem new];
	NSMenu *app_menu = [NSMenu new];

	NSMenuItem *quit_item =
		[[NSMenuItem alloc]
			initWithTitle:@"Quit Tallgeese"
						 action:@selector(terminate:)
			keyEquivalent:@"q"];

	NSMenuItem *about =
		[[NSMenuItem alloc]
			initWithTitle:@"About Tallgeese"
						 action:@selector(show_about)
			keyEquivalent:@""];

	NSMenuItem *preferences =
		[[NSMenuItem alloc]
			initWithTitle:@"Preferences..."
						 action:@selector(prefs)
			keyEquivalent:@","];
	NSArray *add_these =
		@[about,
		  [NSMenuItem separatorItem],
			preferences,
		  [NSMenuItem separatorItem], quit_item];
	// Add them finally
	for (id iter in add_these)
		[app_menu addItem:iter];

	[menu_bar addItem:app_item];
	[app_item setSubmenu:app_menu];
	[NSApp setMainMenu:menu_bar];
}

-(void)show_about
{
	// Notice that if you don't do this as a property, aka holding a
	// strong reference to it then it gets collected and disappears
	// immediately
	int flags = NSTitledWindowMask | NSClosableWindowMask;
	NSRect screen_frame = [NSScreen mainScreen].frame;
	CGFloat center_x = CGRectGetMidX(screen_frame);
	CGFloat center_y = CGRectGetMidY(screen_frame);
	NSRect about_frame = NSMakeRect(center_x - 75, center_y - 50, 175, 150);
	self.about_window =
		[[NSWindow alloc]
			initWithContentRect:about_frame
								styleMask:flags
									backing:NSBackingStoreBuffered
										defer:NO];
	// The category is not working at the moment, no idea why, come back to later
	// NSTextField *about_message = [[NSTextField alloc] init_as_label:@"Hello"];

	NSTextField *about_message = [NSTextField new];
	about_message.editable = NO;
	about_message.bezeled = NO;
	about_message.drawsBackground = NO;
	about_message.selectable = NO;
	about_message.stringValue = @"About Tallgeese";
	[about_message sizeToFit];
	NSRect about_message_frame = [about_message frame];
	about_message_frame.origin.x = 10;
	about_message_frame.origin.y = 30;
	[about_message setFrame:about_message_frame];
	[self.about_window.contentView addSubview:about_message];

	[self.about_window setLevel:NSNormalWindowLevel + 1];
	[self.about_window makeKeyAndOrderFront:NSApp];

}

-(void)prefs
{
	NSLog(@"Called");
}

-(void)setup_ui
{
	[self setup_menus];

  [self.main_window setBackgroundColor:[NSColor grayColor]];
  NSButton *send_query = [[NSButton alloc]
			   initWithFrame:NSMakeRect(20, 500, 150, 40)];
  send_query.bezelStyle = NSRoundedBezelStyle;
  send_query.title = @"Send ssh command";
  [send_query setTarget:self];
  [send_query setAction:@selector(send_query)];

  [self.main_window.contentView addSubview:send_query];

  NSScrollView *scrolling = [[NSScrollView alloc]
			     initWithFrame:NSMakeRect(40, 40, 440, 400)];
  self.ssh_output = [[NSTextView alloc] initWithFrame:scrolling.frame];
  self.ssh_output.editable = YES;
  NSTextField *describe =
    [[NSTextField alloc] initWithFrame:NSMakeRect(250, 525, 170, 20)];
  describe.bezeled = NO;
  describe.editable = NO;
  describe.selectable = NO;
  describe.stringValue = @"ZipCode of the SSH Server";

  self.zip_code =
    [[NSTextView alloc] initWithFrame:NSMakeRect(300, 500, 100, 20)];
  [scrolling addSubview:self.ssh_output];
  [scrolling setHasVerticalScroller:YES];

  [self.main_window.contentView addSubview:self.zip_code];
  [self.main_window.contentView addSubview:scrolling];
  [self.main_window.contentView addSubview:describe];
}

@end
