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

-(void)exit_program
{
  exit(0);
}

-(void)send_query
{
  caml_callback2(*caml_named_value("connect_to"),
  		 caml_copy_string("edgar.haus"),
  		 caml_copy_string("gar"));

}

-(void)setup_ui
{
  [self.window setBackgroundColor:[NSColor grayColor]];
  NSRect frame = NSMakeRect(20, 550, 50, 40);
  NSButton *pushButton = [[NSButton alloc] initWithFrame: frame];
  pushButton.bezelStyle = NSRoundedBezelStyle;
  pushButton.title = @"Exit";
  NSButton *send_query = [[NSButton alloc]
			   initWithFrame:NSMakeRect(20, 500, 150, 40)];
  send_query.bezelStyle = NSRoundedBezelStyle;
  send_query.title = @"Send ssh command";
  [send_query setTarget:self];
  [send_query setAction:@selector(send_query)];
  [pushButton setTarget:self];
  [pushButton setAction:@selector(exit_program)];

  [self.window.contentView addSubview: pushButton];
  [self.window.contentView addSubview: send_query];

  NSScrollView *scrolling = [[NSScrollView alloc]
			     initWithFrame:NSMakeRect(40, 40, 440, 400)];
  self.ssh_output = [[NSTextView alloc] initWithFrame:scrolling.frame];
  self.ssh_output.editable = YES;
  [scrolling addSubview:self.ssh_output];
  [scrolling setHasVerticalScroller:YES];

  [self.window.contentView addSubview:scrolling];

}

@end
