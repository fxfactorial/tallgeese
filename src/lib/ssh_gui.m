#import <Cocoa/Cocoa.h>

#include "ssh_gui.h"
#include "ssh_exts.h"
#include "ssh_ml.h"
#include "ssh_prefs.h"

@implementation SshGUI

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
      initWithContentRect:NSMakeRect(50, 10, 500, 600)
								styleMask:flags
									backing:NSBackingStoreBuffered
										defer:NO];
	// NSToolbar *bar = [[NSToolbar alloc] initWithIdentifier:@"main_window_toolbar"];
	// bar.displayMode = NSToolbarDisplayModeIconAndLabel;
	// self.main_window.toolbar = bar;

	[self.main_window setTitle:@"Tallgeese"];
  [self setup_ui];
  [self.main_window makeKeyAndOrderFront:NSApp];
	// Make sure we're ahead of anything else.
	[self.main_window setLevel:NSNormalWindowLevel + 1];
}

-(void)setup_menus
{
	NSMenu *menu_bar = [NSMenu new];
	NSMenuItem *app_item = [NSMenuItem new];
	NSMenu *app_menu = [NSMenu new];

	NSMenuItem *quit_item =
		[[NSMenuItem alloc]
			initWithTitle:@"Quit Tallgeese" action:@selector(terminate:) keyEquivalent:@"q"];

	NSMenuItem *about =
		[[NSMenuItem alloc]
			initWithTitle:@"About Tallgeese" action:@selector(show_about) keyEquivalent:@""];

	NSMenuItem *preferences =
		[[NSMenuItem alloc]
			initWithTitle:@"Preferences..." action:@selector(preferences) keyEquivalent:@","];

	NSArray *add_these =
		@[about, [NSMenuItem separatorItem], preferences, [NSMenuItem separatorItem], quit_item];
	// Add them finally
	for (id iter in add_these)
		[app_menu addItem:iter];

	[menu_bar addItem:app_item];
	[app_item setSubmenu:app_menu];
	[NSApp setMainMenu:menu_bar];
}

- (BOOL)application:(NSApplication *)theApplication openFile:(NSString *)filename
{
	NSLog(@"Something dragged");
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
			initWithContentRect:about_frame styleMask:flags backing:NSBackingStoreBuffered defer:NO];

	NSTextField *about_message =
		[[NSTextField alloc] init_as_label:@"About Tallgeese"];

	NSRect about_message_frame = [about_message frame];
	about_message_frame.origin.x = 10;
	about_message_frame.origin.y = 30;
	[about_message setFrame:about_message_frame];

	// NSDictionary *this_dict =
	// 	@{@"about_message":about_message, @"window_view":self.about_window.contentView};
	// + constraintsWithVisualFormat:options:metrics:views:
	// [button1 setTranslatesAutoresizingMaskIntoConstraints:NO];
	// [about_message setTranslatesAutoresizingMaskIntoConstraints:NO];
	// NSArray *cons =
	// 	[NSLayoutConstraint
	// 		constraintsWithVisualFormat:@"V:[window_view]-10-[about_message]"
	// 												options:NSLayoutFormatAlignAllCenterX
	// 												metrics:nil
	// 													views:this_dict];
	// [about_message addConstraints:cons];

	[self.about_window.contentView addSubview:about_message];
	[self.about_window setLevel:NSNormalWindowLevel + 1];
	[self.about_window makeKeyAndOrderFront:NSApp];
}

-(void)preferences
{
	self.prefs_object = [Ssh_prefs new];
	[self.prefs_object show];
}

-(void)setup_main_interface
{
	NSTabView *v = [NSTabView new];
	v.drawsBackground = YES;

	NSTabViewItem *first_page =
		[[NSTabViewItem alloc]
			init_with:@"Dashboard" tool_tip:@"Main ssh manipulation" identifier:@"first_page"];

	NSTabViewItem *second_page =
		[[NSTabViewItem alloc]
			init_with:@"History" tool_tip:@"Some second page" identifier:@"second_page"];

	for (id g in @[first_page, second_page])
		[v addTabViewItem:g];

	self.main_window.contentView = v;
}

-(void)setup_ui
{
	Ssh_ml *ml_obj = [Ssh_ml shared_application];
	[self setup_menus];
	[self setup_main_interface];

  // [self.main_window setBackgroundColor:[NSColor grayColor]];

  // NSButton *send_query = [[NSButton alloc]
	// 		   initWithFrame:NSMakeRect(20, 500, 150, 40)];
  // send_query.bezelStyle = NSRoundedBezelStyle;
  // send_query.title = @"Send ssh command";
  // [send_query setTarget:ml_obj];
  // [send_query setAction:@selector(query_zipcode_of_ip:)];

  // [self.main_window.contentView addSubview:send_query];

  // NSScrollView *scrolling = [[NSScrollView alloc]
	// 		     initWithFrame:NSMakeRect(40, 40, 440, 400)];
  // self.ssh_output = [[NSTextView alloc] initWithFrame:scrolling.frame];
  // self.ssh_output.editable = YES;
  // NSTextField *describe =
  //   [[NSTextField alloc] initWithFrame:NSMakeRect(250, 525, 170, 20)];
  // describe.bezeled = NO;
  // describe.editable = NO;
  // describe.selectable = NO;
  // describe.stringValue = @"ZipCode of the SSH Server";

  // self.zip_code =
  //   [[NSTextView alloc] initWithFrame:NSMakeRect(300, 500, 100, 20)];
  // [scrolling addSubview:self.ssh_output];
  // [scrolling setHasVerticalScroller:YES];

  // [self.main_window.contentView addSubview:self.zip_code];
  // [self.main_window.contentView addSubview:scrolling];
  // [self.main_window.contentView addSubview:describe];
}

@end
