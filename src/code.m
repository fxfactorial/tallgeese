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

CAMLprim value cocoa_ml_start(void)
{
	if (fork () == 0) {
		NSApplication *app = [NSApplication sharedApplication];
		NSRect frame = NSMakeRect(200, 200, 200, 200);

		NSWindow* window  = [[[NSWindow alloc]
				      initWithContentRect:frame
				      styleMask:NSBorderlessWindowMask
				      backing:NSBackingStoreBuffered
				      defer:NO] autorelease];
		[window setBackgroundColor:[NSColor blueColor]];
		[window makeKeyAndOrderFront:NSApp];

		[app run];
		return Val_unit;
	}
	else{
		/* caml_callback(*caml_named_value("test_func"), Val_unit); */
		exit(0);
	}
}
