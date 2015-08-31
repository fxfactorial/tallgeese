// Avoid name_clashes
#define CAML_NAME_SPACE
// OCaml declarations
#include <caml/mlvalues.h>
#include <caml/alloc.h>
#include <caml/memory.h>
#include <caml/fail.h>
//Cocoa
#import <Cocoa/Cocoa.h>
/* __attribute__((noreturn))  */

CAMLprim value foo(void)
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
	else {
		printf("Parent exited\n");
		exit(0);
	}
}
