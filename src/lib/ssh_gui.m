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

@implementation SshGUI

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
  self.window =
    [[NSWindow alloc]
      initWithContentRect:NSMakeRect(50, 10, 500,600)
		styleMask:NSTitledWindowMask | NSResizableWindowMask
		  backing:NSBackingStoreBuffered
		    defer:NO];
  [self setup_ui];
  [self.window makeKeyAndOrderFront:NSApp];
}

-(void)send_query
{
  caml_callback(*caml_named_value("zipcode_of_ip"),
  		 caml_copy_string("45.33.64.41"));

  caml_callback2(*caml_named_value("connect_to"),
  		 caml_copy_string("edgar.haus"),
  		 caml_copy_string("gar"));
}

-(void)setup_ui
{
	NSMenu *menu_bar = [NSMenu new];
	NSMenuItem *app_item = [NSMenuItem new];
	NSMenu *app_menu = [NSMenu new];
	NSString *app_name = @"Tallgeese";
	NSString *quit_title = [@"Quit " stringByAppendingString:app_name];
	NSMenuItem *quit_item =
		[[NSMenuItem alloc]
			initWithTitle:quit_title
						 action:@selector(terminate:) keyEquivalent:@"q"];
	[app_menu addItem:quit_item];
	[menu_bar addItem:app_item];
	[app_item setSubmenu:app_menu];
	[NSApp setMainMenu:menu_bar];

  [self.window setBackgroundColor:[NSColor grayColor]];
  NSButton *send_query = [[NSButton alloc]
			   initWithFrame:NSMakeRect(20, 500, 150, 40)];
  send_query.bezelStyle = NSRoundedBezelStyle;
  send_query.title = @"Send ssh command";
  [send_query setTarget:self];
  [send_query setAction:@selector(send_query)];

  [self.window.contentView addSubview: send_query];

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

  [self.window.contentView addSubview:self.zip_code];
  [self.window.contentView addSubview:scrolling];
  [self.window.contentView addSubview:describe];
}

@end
