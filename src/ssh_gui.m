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
  // Not sure why its not working, not a big deal anyway
  // self.statusItem = [[NSStatusBar systemStatusBar]
  // 		 statusItemWithLength:NSVariableStatusItemLength];
  // self.statusItem.title = @"Hello World";
  // self.statusItem.highlightMode = YES;
  // [self.statusItem setMenu:[NSApplication sharedApplication].mainMenu];

  self.window = [[NSWindow alloc] initWithContentRect:NSMakeRect(10,100,400,300)
					    styleMask:NSTitledWindowMask
					      backing:NSBackingStoreBuffered
						defer:NO];
  [self.window setBackgroundColor:[NSColor blueColor]];
  [self.window makeKeyAndOrderFront:NSApp];
}
/* caml_callback(*caml_named_value("test_func"), Val_unit); */
@end
