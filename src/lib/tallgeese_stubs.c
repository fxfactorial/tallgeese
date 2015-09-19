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

CAMLprim value cocoa_ml_receive_query_result(value r_variant)
{
	CAMLparam1(r_variant);
	/* CAMLlocal1(a_variant); */
	char *result = String_val(Field(r_variant, 0));
	int type = Tag_val(r_variant);
	NSApplication *app = [NSApplication sharedApplication];


	switch (type) {
	case 0:
		[((SshGUI*)app.delegate).zip_code
		 setString:[[NSString alloc] initWithUTF8String:result]];
		break;
	case 1:
		[((SshGUI*)app.delegate).ssh_output
		 setString:[[NSString alloc] initWithUTF8String:result]];
		break;
	}
	CAMLreturn(Val_unit);
}

CAMLprim value cocoa_ml_start(void)
{
  if (fork () == 0) {
    NSApplication *app = [NSApplication sharedApplication];
    // Critical to have this so that you can add menus
    [NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];

    SshGUI *app_delegate = [[SshGUI alloc] init];

    app.delegate = app_delegate;
    [app run];
    return Val_unit;
  }
  else{
    exit(0);
  }
}
